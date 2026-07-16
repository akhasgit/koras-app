import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/koras_api_client.dart';
import 'reading_models.dart';

part 'reading_repository.g.dart';

@riverpod
ReadingRepository readingRepository(Ref ref) =>
    ReadingRepository(ref.watch(korasApiClientProvider));

/// Reading programme — all traffic goes through `/reading/{uid}/...`.
/// Every attempt is async: start → PUT → upload-complete → analyze → poll.
/// See `docs/CURSOR_PROMPT_reading_program.md` §3–§4.
class ReadingRepository {
  ReadingRepository(this._api);
  final KorasApiClient _api;

  String get _uid => _api.userId;

  /// Prefill values for the confirm-and-edit intake (§6.1).
  Future<ReadingIntakeDefaults> intakeDefaults() async {
    final data = await _api.apiGet('/reading/$_uid/intake-defaults');
    return ReadingIntakeDefaults.fromResponse(data);
  }

  /// Upsert the reading profile. Request bodies use camelCase (house style
  /// for this module).
  Future<ReadingProfile> submitIntake({
    required String intent,
    required List<String> goals,
    required String persona,
    int? gradeLevel,
  }) async {
    final data = await _api.apiPost('/reading/$_uid/intake', {
      'intent': intent,
      'goals': goals,
      'persona': persona,
      if (gradeLevel != null) 'gradeLevel': gradeLevel,
    });
    return ReadingProfile.fromJson(
      (data['profile'] as Map).cast<String, dynamic>(),
    );
  }

  /// Current programme + stage summaries. `null` when the user has no live
  /// programme yet (intake abandoned before calibration, §6.2).
  Future<ReadingProgram?> getProgram() async {
    final data = await _api.apiGet('/reading/$_uid/program');
    final program = data['program'];
    if (program == null) return null;
    return ReadingProgram.fromJson((program as Map).cast<String, dynamic>());
  }

  Future<ReadingStage> getStage(String stageId) async {
    final data = await _api.apiGet('/reading/$_uid/stage/$stageId');
    return ReadingStage.fromResponse(data);
  }

  /// Re-run a failed stage generation (§3.3). The server 409s when content
  /// already exists — callers may treat that as success.
  Future<void> retryStageGeneration(String stageId) async {
    await _api.apiPost('/reading/$_uid/stage/$stageId/retry', const {});
  }

  Future<ReadingStartResponse> startAttempt({
    required String attemptType,
    required String passageText,
    String audioMimeType = 'audio/mp4',
    int? guideWpm,
    String? stageId,
    String? lessonId,
    String? stepId,
  }) async {
    final data = await _api.apiPost('/reading/$_uid/attempt/start', {
      'attemptType': attemptType,
      'passageText': passageText,
      'audioMimeType': audioMimeType,
      if (guideWpm != null) 'guideWpm': guideWpm,
      if (stageId != null) 'stageId': stageId,
      if (lessonId != null) 'lessonId': lessonId,
      if (stepId != null) 'stepId': stepId,
    });
    return ReadingStartResponse.fromJson(data);
  }

  Future<void> reportUploadStatus({
    required String attemptId,
    required String recordingUploadStatus,
    double? durationSeconds,
  }) async {
    await _api.apiPost('/reading/$_uid/attempt/upload-complete', {
      'attemptId': attemptId,
      'recordingUploadStatus': recordingUploadStatus,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
    });
  }

  Future<void> startAnalysis(String attemptId) async {
    await _api.apiPost('/reading/$_uid/attempt/analyze', {
      'attemptId': attemptId,
    });
  }

  Future<void> retryAnalysis(String attemptId) async {
    await _api.apiPost('/reading/$_uid/attempt/retry', {
      'attemptId': attemptId,
    });
  }

  Future<ReadingAttempt> getAttempt(String attemptId) async {
    final data = await _api.apiGet('/reading/$_uid/attempt/$attemptId');
    return ReadingAttempt.fromJson(
      (data['attempt'] as Map).cast<String, dynamic>(),
    );
  }

  /// Mark a step complete; the server rolls up lesson/stage completion, XP,
  /// streaks and the next-stage unlock chain (§3.2).
  Future<Map<String, dynamic>> completeLesson({
    required String stageId,
    required String lessonId,
    required String stepId,
    String? attemptId,
  }) async {
    return _api.apiPost('/reading/$_uid/lesson/complete', {
      'stageId': stageId,
      'lessonId': lessonId,
      'stepId': stepId,
      if (attemptId != null) 'attemptId': attemptId,
    });
  }

  Future<ReadingProgress> progress() async {
    final data = await _api.apiGet('/reading/$_uid/progress');
    final row = data['progress'] ?? data;
    return ReadingProgress.fromJson((row as Map).cast<String, dynamic>());
  }

  /// House poll cadence: every 3 s, 40 attempts (~120 s) — same pattern as
  /// `vocabulary_repository.dart`.
  Future<ReadingAttempt> pollAttempt(
    String attemptId, {
    Duration interval = const Duration(seconds: 3),
    int maxAttempts = 40,
  }) async {
    for (var i = 0; i < maxAttempts; i++) {
      await Future.delayed(interval);
      final attempt = await getAttempt(attemptId);
      if (attempt.analysisStatus == 'completed') return attempt;
      if (attempt.analysisStatus == 'failed') {
        throw ServerError(attempt.analysisError ?? 'Analysis failed');
      }
    }
    throw const ServerError('Analysis timed out');
  }

  /// Poll `GET /program` while it is being generated (same cadence as attempt
  /// polling). Resolves once the programme leaves `generating`; the fallback
  /// path (§3.3) surfaces as `active` + `generation_error`.
  Future<ReadingProgram> pollProgram({
    Duration interval = const Duration(seconds: 3),
    int maxAttempts = 40,
  }) async {
    for (var i = 0; i < maxAttempts; i++) {
      await Future.delayed(interval);
      final program = await getProgram();
      if (program == null) continue;
      if (program.status == 'failed') {
        throw ServerError(
            program.generationError ?? 'Programme generation failed');
      }
      if (!program.isGenerating) return program;
    }
    throw const ServerError('Programme generation timed out');
  }
}

@riverpod
Future<ReadingIntakeDefaults> readingIntakeDefaults(Ref ref) =>
    ref.watch(readingRepositoryProvider).intakeDefaults();

@riverpod
Future<ReadingProgram?> readingProgram(Ref ref) =>
    ref.watch(readingRepositoryProvider).getProgram();

@riverpod
Future<ReadingStage> readingStage(Ref ref, String stageId) =>
    ref.watch(readingRepositoryProvider).getStage(stageId);

@riverpod
Future<ReadingProgress> readingProgress(Ref ref) =>
    ref.watch(readingRepositoryProvider).progress();

@riverpod
Future<ReadingAttempt> readingAttempt(Ref ref, String attemptId) =>
    ref.watch(readingRepositoryProvider).getAttempt(attemptId);
