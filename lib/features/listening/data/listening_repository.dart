import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/koras_api_client.dart';
import 'listening_models.dart';

part 'listening_repository.g.dart';

@riverpod
ListeningRepository listeningRepository(Ref ref) =>
    ListeningRepository(ref.watch(korasApiClientProvider));

/// Listening Comprehension — all traffic goes through `/listening/{uid}/...`.
/// TTS synthesis, MCQ grading, and voice grading all happen server-side.
/// See `docs/MOBILE_MISSING_FEATURES_BUILD_PLAN.md` §5.
class ListeningRepository {
  ListeningRepository(this._api);
  final KorasApiClient _api;

  String get _uid => _api.userId;

  Future<ListeningPassagesResponse> passages() async {
    final data = await _api.apiGet('/listening/$_uid/passages');
    return ListeningPassagesResponse.fromJson(data);
  }

  /// Get a presigned URL for the passage's synthesised audio (server-cached).
  Future<String> audioUrl({
    required String passageId,
    int? segmentIndex,
  }) async {
    final data = await _api.apiPost('/listening/$_uid/audio', {
      'passageId': passageId,
      if (segmentIndex != null) 'segmentIndex': segmentIndex,
    });
    return data['url'] as String;
  }

  Future<ListeningAttempt> startAttempt({
    required String passageId,
    double playbackSpeed = 1.0,
  }) async {
    final data = await _api.apiPost('/listening/$_uid/attempt/start', {
      'passageId': passageId,
      'playbackSpeed': playbackSpeed,
    });
    return ListeningAttempt.fromJson(
      (data['attempt'] as Map).cast<String, dynamic>(),
    );
  }

  Future<ListeningAnswer> answerMcq({
    required String attemptId,
    required String questionId,
    required String selectedOptionId,
  }) async {
    final data = await _api.apiPost('/listening/$_uid/attempt/answer-mcq', {
      'attemptId': attemptId,
      'questionId': questionId,
      'selectedOptionId': selectedOptionId,
    });
    return ListeningAnswer.fromJson(
      (data['answer'] as Map).cast<String, dynamic>(),
    );
  }

  Future<ListeningVoiceUpload> voiceUploadUrl({
    required String attemptId,
    required String questionId,
    String audioMimeType = 'audio/webm',
  }) async {
    final data = await _api.apiPost(
      '/listening/$_uid/attempt/voice-upload-url',
      {
        'attemptId': attemptId,
        'questionId': questionId,
        'audioMimeType': audioMimeType,
      },
    );
    return ListeningVoiceUpload.fromJson(data);
  }

  /// Analyze a voice answer — server-side. Returns the persisted answer row.
  Future<ListeningAnswer> analyzeVoice({
    required String attemptId,
    required String questionId,
    required String objectKey,
    double? durationSeconds,
  }) async {
    final data = await _api.apiPost('/listening/$_uid/attempt/analyze-voice', {
      'attemptId': attemptId,
      'questionId': questionId,
      'objectKey': objectKey,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
    });
    return ListeningAnswer.fromJson(
      (data['answer'] as Map).cast<String, dynamic>(),
    );
  }

  Future<Map<String, dynamic>> completeAttempt({
    required String attemptId,
    int replayCount = 0,
    double playbackSpeed = 1.0,
  }) async {
    return _api.apiPost('/listening/$_uid/attempt/complete', {
      'attemptId': attemptId,
      'replayCount': replayCount,
      'playbackSpeed': playbackSpeed,
    });
  }

  Future<Map<String, dynamic>> getAttempt(String attemptId) async {
    return _api.apiGet('/listening/$_uid/attempt/$attemptId');
  }
}

@riverpod
Future<ListeningPassagesResponse> listeningPassages(Ref ref) =>
    ref.watch(listeningRepositoryProvider).passages();
