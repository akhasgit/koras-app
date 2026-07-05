import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/koras_api_client.dart';
import '../domain/default_questions.dart';
import 'interview_models.dart';

part 'interview_prep_repository.g.dart';

@riverpod
InterviewPrepRepository interviewPrepRepository(Ref ref) =>
    InterviewPrepRepository(ref.watch(korasApiClientProvider));

/// Interview Prep now routes through koras-api (`/interview/{uid}/...`).
/// All AI analysis is server-side (202 + background task + polling).
/// See `docs/MOBILE_API_ALIGNMENT_PLAN.md` §4.3.
class InterviewPrepRepository {
  InterviewPrepRepository(this._api);
  final KorasApiClient _api;

  String get _uid => _api.userId;

  Future<List<InterviewScenario>> listScenarios() async {
    final data = await _api.apiGet('/interview/$_uid/scenarios');
    final list = data['scenarios'] as List?;
    if (list == null) return const [];
    return list
        .map((r) => InterviewScenario.fromJson(r as Map<String, dynamic>))
        .toList();
  }

  Future<InterviewScenario> createScenario({
    required String title,
    String? jobRole,
    String? company,
    String? jobDescription,
  }) async {
    final data = await _api.apiPost('/interview/$_uid/scenarios', {
      'title': title,
      if (jobRole != null) 'jobRole': jobRole,
      if (company != null) 'company': company,
      if (jobDescription != null) 'jobDescription': jobDescription,
    });
    return InterviewScenario.fromJson(
      (data['scenario'] as Map).cast<String, dynamic>(),
    );
  }

  /// Server-side question generation using Claude.
  Future<List<InterviewQuestion>> generateQuestions({
    required String scenarioId,
    String? jobDescription,
  }) async {
    try {
      final data = await _api.apiPost('/interview/$_uid/scenarios/generate', {
        'scenarioId': scenarioId,
        if (jobDescription != null) 'jobDescription': jobDescription,
      });
      final questions = data['questions'] as List?;
      if (questions == null) return kDefaultQuestions;
      return questions
          .map((q) => InterviewQuestion.fromJson(q as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return kDefaultQuestions;
    }
  }

  /// Async recording pipeline:
  /// 1. start attempt → 2. upload audio → 3. upload-complete → 4. analyze (202)
  /// Returns the attemptId for polling.
  Future<String> recordAnswer({
    required String scenarioId,
    required String questionId,
    required String question,
    required String sessionId,
    required List<int> bytes,
    required String mimeType,
    int? durationSeconds,
  }) async {
    // 1. Start attempt on backend
    final startData = await _api.apiPost('/interview/$_uid/attempt/start', {
      'scenarioId': scenarioId,
      'questionId': questionId,
      'question': question,
      'practiceSessionId': sessionId,
    });
    final attempt = (startData['attempt'] as Map).cast<String, dynamic>();
    final attemptId = attempt['id'] as String;

    // 2. Upload audio to recordings endpoint
    final uploadData = await _api.uploadAudio(bytes, mimeType,
        assessmentId: attemptId);
    final audioKey = uploadData['audio_key'] as String;
    final audioMime = uploadData['audio_mime_type'] as String;

    // 3. Confirm upload
    await _api.apiPost('/interview/$_uid/attempt/upload-complete', {
      'attemptId': attemptId,
      'recordingUploadStatus': 'uploaded',
      'audioObjectKey': audioKey,
      'audioMimeType': audioMime,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
    });

    // 4. Trigger async analysis (returns 202)
    await _api.apiPost('/interview/$_uid/attempt/analyze', {
      'attemptId': attemptId,
    });

    return attemptId;
  }

  /// Poll attempt status until analysis is complete.
  Future<InterviewAttempt> getAttempt(String attemptId) async {
    final data = await _api.apiGet('/interview/$_uid/attempt/$attemptId');
    return InterviewAttempt.fromJson(
      (data['attempt'] as Map).cast<String, dynamic>(),
    );
  }

  Future<List<InterviewAttempt>> listAttemptsBySession(String sessionId) async {
    final data = await _api.apiGet(
      '/interview/$_uid/attempts/by-session?practiceSessionId=$sessionId',
    );
    final list = data['attempts'] as List?;
    if (list == null) return const [];
    return list
        .map((r) => InterviewAttempt.fromJson(r as Map<String, dynamic>))
        .toList();
  }
}

@riverpod
Future<List<InterviewScenario>> interviewScenarios(Ref ref) =>
    ref.watch(interviewPrepRepositoryProvider).listScenarios();
