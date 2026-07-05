import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/koras_api_client.dart';
import '../domain/ai_tutor_enums.dart';
import 'ai_tutor_report.dart';

part 'ai_tutor_repository.g.dart';

@riverpod
AiTutorRepository aiTutorRepository(Ref ref) => AiTutorRepository(
      ref.watch(korasApiClientProvider),
    );

/// AI Tutor calls go through koras-api (`/ai-tutor/{uid}/{action}`).
/// The backend handles all analysis via background tasks.
/// See `docs/MOBILE_API_ALIGNMENT_PLAN.md` §4.1.
class AiTutorRepository {
  AiTutorRepository(this._api);
  final KorasApiClient _api;

  String get _uid => _api.userId;

  Future<String> startSession(AiTutorMode mode) async {
    final data = await _api.apiPost('/ai-tutor/$_uid/start', {'mode': mode.wire});
    return data['sessionId'] as String;
  }

  Future<String> signedUrl(String sessionId) async {
    final data = await _api.apiPost(
      '/ai-tutor/$_uid/signed-url',
      {'sessionId': sessionId},
    );
    return data['signedUrl'] as String;
  }

  Future<void> saveTurn(
    String sessionId,
    TurnRole role,
    int index,
    String transcript,
  ) =>
      _api.apiPost('/ai-tutor/$_uid/turn', {
        'sessionId': sessionId,
        'role': role == TurnRole.user ? 'user' : 'assistant',
        'turnIndex': index,
        'transcript': transcript,
      });

  Future<PresignedPut> presignRecording(
    String sessionId,
    String contentType,
  ) async {
    final data = await _api.apiPost('/ai-tutor/$_uid/recording-upload-url', {
      'sessionId': sessionId,
      'contentType': contentType,
    });
    return PresignedPut(
      uploadUrl: data['uploadUrl'] as String,
      objectKey: data['objectKey'] as String,
    );
  }

  Future<void> uploadRecording(
    PresignedPut put,
    List<int> bytes,
    String contentType,
  ) =>
      _api.putBytesToR2(put.uploadUrl, bytes, contentType);

  /// Confirm audio upload was successful.
  Future<void> confirmRecording(String sessionId, String objectKey) =>
      _api.apiPost('/ai-tutor/$_uid/recording-confirm', {
        'sessionId': sessionId,
        'objectKey': objectKey,
        'status': 'uploaded',
      });

  /// End session — returns 202; backend runs analysis in background.
  /// Caller should poll sessionStatus until completed.
  Future<void> endSession({
    required String sessionId,
    int? durationSeconds,
    String? audioObjectKey,
    String? recordingUploadStatus,
    String? elevenlabsConversationId,
  }) async {
    await _api.apiPost('/ai-tutor/$_uid/end', {
      'sessionId': sessionId,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (audioObjectKey != null) 'audioObjectKey': audioObjectKey,
      if (recordingUploadStatus != null)
        'recordingUploadStatus': recordingUploadStatus,
      if (elevenlabsConversationId != null)
        'elevenlabsConversationId': elevenlabsConversationId,
    });
  }

  /// Poll session analysis status.
  Future<String> sessionStatus(String sessionId) async {
    final data = await _api.apiGet(
      '/ai-tutor/$_uid/session/$sessionId/status',
    );
    return data['status'] as String;
  }

  /// Fetch report once analysis is complete.
  Future<AiTutorReport> getReport(String sessionId) async {
    final data = await _api.apiGet('/ai-tutor/$_uid/report/$sessionId');
    return AiTutorReport.fromJson(
      (data['report'] as Map).cast<String, dynamic>(),
    );
  }

  Future<List<AiTutorSession>> listSessions({int limit = 30}) async {
    final data = await _api.apiGet('/ai-tutor/$_uid/sessions?limit=$limit');
    final sessions = data['sessions'] as List?;
    if (sessions == null) return const [];
    return sessions
        .map((r) => AiTutorSession.fromJson(r as Map<String, dynamic>))
        .toList();
  }
}

/// Result of a presigned-PUT request.
class PresignedPut {
  const PresignedPut({required this.uploadUrl, required this.objectKey});
  final String uploadUrl;
  final String objectKey;
}

@riverpod
Future<List<AiTutorSession>> aiTutorSessions(Ref ref) =>
    ref.watch(aiTutorRepositoryProvider).listSessions();
