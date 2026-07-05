import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/elevenlabs_client.dart';
import '../../learner_insights/data/learner_insights_repository.dart';
import '../data/ai_tutor_report.dart';
import '../data/ai_tutor_repository.dart';
import '../domain/ai_tutor_enums.dart';
import '../domain/ai_tutor_session_state.dart';
import '../domain/pcm_wav.dart';

part 'ai_tutor_notifier.g.dart';

const _sampleRate = 16000;

/// Orchestrates the AI Tutor 8-state machine: start → connect WS + mic stream →
/// transcripts → stop → upload recording → analyse → report. See 13.
@riverpod
class AiTutorNotifier extends _$AiTutorNotifier {
  AudioRecorder? _recorder;
  WebSocketChannel? _ws;
  StreamSubscription<dynamic>? _wsSub;
  StreamSubscription<Uint8List>? _micSub;
  final BytesBuilder _sessionPcm = BytesBuilder();
  final BytesBuilder _agentPcm = BytesBuilder();
  AudioPlayer? _agentPlayer;
  Timer? _agentFlush;
  DateTime? _startedAt;
  int _turnIndex = 0;
  String? _conversationId;
  final List<AiTutorTurn> _turns = [];

  @override
  AiTutorSessionState build() {
    ref.onDispose(_teardown);
    return const AiTutorSessionState.idle();
  }

  Future<void> start(AiTutorMode mode) async {
    if (state is! AiTutorIdle && state is! AiTutorErrorState) return;
    state = AiTutorSessionState.starting(mode);
    try {
      final granted = await Permission.microphone.request();
      if (!granted.isGranted) {
        throw const PermissionError('Microphone permission denied');
      }

      final repo = ref.read(aiTutorRepositoryProvider);
      final sessionId = await repo.startSession(mode);
      state = AiTutorSessionState.connecting(sessionId);

      final url = await repo.signedUrl(sessionId);
      final ws = ref.read(elevenLabsClientProvider).connect(url);
      _ws = ws;

      _wsSub = ws.stream.listen(
        (event) => _onWsMessage(sessionId, event),
        onError: (Object e) => _fail(mapError(e)),
        onDone: () => _onWsDone(sessionId),
      );

      await _startMic(ws);
      _startedAt = DateTime.now();
      _agentPlayer = AudioPlayer();
      state = AiTutorSessionState.live(sessionId: sessionId, turns: const []);
    } catch (e) {
      await _teardown();
      state = AiTutorSessionState.error(mapError(e));
    }
  }

  Future<void> _startMic(WebSocketChannel ws) async {
    final recorder = AudioRecorder();
    _recorder = recorder;
    final stream = await recorder.startStream(
      const RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        sampleRate: _sampleRate,
        numChannels: 1,
        autoGain: false,
        echoCancel: true,
        noiseSuppress: true,
      ),
    );
    _micSub = stream.listen((chunk) {
      _sessionPcm.add(chunk); // keep a full copy for the R2 recording
      try {
        ws.sink.add(jsonEncode({'user_audio_chunk': base64Encode(chunk)}));
      } catch (_) {/* socket closing */}
    });
  }

  void _onWsMessage(String sessionId, dynamic raw) {
    if (raw is! String) return;
    final Map<String, dynamic> msg;
    try {
      msg = jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return;
    }
    final type = msg['type'] as String?;
    switch (type) {
      case 'conversation_initiation_metadata':
        _conversationId = (msg['conversation_initiation_metadata_event']
            as Map?)?['conversation_id'] as String?;
      case 'ping':
        final id = (msg['ping_event'] as Map?)?['event_id'];
        _ws?.sink.add(jsonEncode({'type': 'pong', 'event_id': id}));
      case 'user_transcript':
        final t = (msg['user_transcription_event'] as Map?)?['user_transcript']
            as String?;
        if (t != null && t.trim().isNotEmpty) {
          _addTurn(sessionId, TurnRole.user, t);
        }
      case 'agent_response':
        final t =
            (msg['agent_response_event'] as Map?)?['agent_response'] as String?;
        if (t != null && t.trim().isNotEmpty) {
          _addTurn(sessionId, TurnRole.assistant, t);
        }
      case 'audio':
        final b64 = (msg['audio_event'] as Map?)?['audio_base_64'] as String?;
        if (b64 != null) {
          _agentPcm.add(base64Decode(b64));
          _scheduleAgentFlush();
        }
      case 'interruption':
        _agentPcm.clear();
        _agentPlayer?.stop();
    }
  }

  void _scheduleAgentFlush() {
    _agentFlush?.cancel();
    _agentFlush = Timer(const Duration(milliseconds: 280), _flushAgentAudio);
  }

  Future<void> _flushAgentAudio() async {
    final player = _agentPlayer;
    if (player == null || _agentPcm.isEmpty) return;
    final pcm = _agentPcm.takeBytes();
    try {
      final dir = await getTemporaryDirectory();
      final f = File(
          '${dir.path}/agent-${DateTime.now().microsecondsSinceEpoch}.wav');
      await f.writeAsBytes(pcm16ToWav(pcm, sampleRate: _sampleRate));
      await player.setFilePath(f.path);
      await player.play();
    } catch (_) {/* best-effort playback */}
  }

  void _addTurn(String sessionId, TurnRole role, String transcript) {
    final turn = AiTutorTurn(
      sessionId: sessionId,
      role: role,
      turnIndex: _turnIndex++,
      transcript: transcript,
    );
    _turns.add(turn);
    // Fire-and-forget the direct insert; UI state updates immediately.
    ref
        .read(aiTutorRepositoryProvider)
        .saveTurn(sessionId, role, turn.turnIndex, transcript)
        .catchError((_) {});
    if (state is AiTutorLive) {
      state = AiTutorSessionState.live(
        sessionId: sessionId,
        turns: List.unmodifiable(_turns),
      );
    }
  }

  void _onWsDone(String sessionId) {
    // If the socket drops while live, salvage the turns and analyse anyway.
    if (state is AiTutorLive) stop();
  }

  /// User taps Stop → finalise recording, upload, analyse, show report.
  Future<void> stop() async {
    final current = state;
    if (current is! AiTutorLive && current is! AiTutorEnding) return;
    final sessionId = switch (current) {
      AiTutorLive(:final sessionId) => sessionId,
      AiTutorEnding(:final sessionId) => sessionId,
      _ => null,
    };
    if (sessionId == null) return;

    state = AiTutorSessionState.ending(sessionId);
    final duration = _startedAt == null
        ? null
        : DateTime.now().difference(_startedAt!).inSeconds;

    await _micSub?.cancel();
    await _recorder?.stop();
    await _recorder?.dispose();
    _recorder = null;
    await _wsSub?.cancel();
    await _ws?.sink.close();
    _ws = null;

    final repo = ref.read(aiTutorRepositoryProvider);

    // Upload the captured conversation to R2 (best-effort).
    state = AiTutorSessionState.uploadingRecording(sessionId);
    String uploadStatus = 'skipped';
    String? objectKey;
    final pcm = _sessionPcm.takeBytes();
    if (pcm.isNotEmpty) {
      try {
        final wav = pcm16ToWav(pcm, sampleRate: _sampleRate);
        final put = await repo.presignRecording(sessionId, 'audio/wav');
        await repo.uploadRecording(put, wav, 'audio/wav');
        objectKey = put.objectKey;
        uploadStatus = 'uploaded';
      } catch (_) {
        uploadStatus = 'failed';
      }
    }

    state = AiTutorSessionState.analyzing(sessionId);
    try {
      // Confirm recording upload if successful
      if (objectKey != null && uploadStatus == 'uploaded') {
        await repo.confirmRecording(sessionId, objectKey);
      }

      // End session — returns 202, backend runs analysis in background
      await repo.endSession(
        sessionId: sessionId,
        durationSeconds: duration,
        audioObjectKey: objectKey,
        recordingUploadStatus: uploadStatus,
        elevenlabsConversationId: _conversationId,
      );

      // Poll until analysis completes
      final report = await _pollForReport(repo, sessionId);
      ref.invalidate(learnerInsightsProvider);
      ref.invalidate(aiTutorSessionsProvider);
      state = AiTutorSessionState.report(report);
    } catch (e) {
      state = AiTutorSessionState.error(mapError(e));
    } finally {
      await _stopAudioOnly();
    }
  }

  Future<AiTutorReport> _pollForReport(
    AiTutorRepository repo,
    String sessionId,
  ) async {
    const maxAttempts = 40;
    for (var i = 0; i < maxAttempts; i++) {
      await Future.delayed(const Duration(seconds: 3));
      final status = await repo.sessionStatus(sessionId);
      if (status == 'completed') {
        return repo.getReport(sessionId);
      }
      if (status == 'failed') {
        throw const ServerError('Analysis failed on the server');
      }
    }
    throw const ServerError('Analysis timed out');
  }

  void reset() {
    _turns.clear();
    _turnIndex = 0;
    _conversationId = null;
    _startedAt = null;
    state = const AiTutorSessionState.idle();
  }

  void _fail(AppError e) {
    _teardown();
    state = AiTutorSessionState.error(e);
  }

  Future<void> _stopAudioOnly() async {
    _agentFlush?.cancel();
    await _agentPlayer?.dispose();
    _agentPlayer = null;
    _agentPcm.clear();
  }

  Future<void> _teardown() async {
    _agentFlush?.cancel();
    await _micSub?.cancel();
    await _wsSub?.cancel();
    try {
      await _ws?.sink.close();
    } catch (_) {}
    try {
      await _recorder?.stop();
    } catch (_) {}
    await _recorder?.dispose();
    await _agentPlayer?.dispose();
    _recorder = null;
    _ws = null;
    _agentPlayer = null;
    _sessionPcm.clear();
    _agentPcm.clear();
  }
}
