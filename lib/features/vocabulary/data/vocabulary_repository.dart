import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/koras_api_client.dart';
import 'vocabulary_models.dart';

part 'vocabulary_repository.g.dart';

@riverpod
VocabularyRepository vocabularyRepository(Ref ref) =>
    VocabularyRepository(ref.watch(korasApiClientProvider));

/// Daily Vocabulary — all traffic goes through `/vocabulary/{uid}/...`.
/// Every attempt is async: start → PUT → upload-complete → analyze → poll.
/// See `docs/MOBILE_MISSING_FEATURES_BUILD_PLAN.md` §4.
class VocabularyRepository {
  VocabularyRepository(this._api);
  final KorasApiClient _api;

  String get _uid => _api.userId;

  /// Get today's 5 words (lazy generate-or-fetch on the server).
  Future<VocabularyTodayResponse> today() async {
    final data = await _api.apiPost('/vocabulary/$_uid/today', const {});
    return VocabularyTodayResponse.fromJson(data);
  }

  Future<VocabularyStartResponse> startAttempt({
    String? dailySetId,
    String? word,
    required String kind,
    String source = 'daily',
    String audioMimeType = 'audio/webm',
  }) async {
    final data = await _api.apiPost('/vocabulary/$_uid/attempt/start', {
      if (dailySetId != null) 'daily_set_id': dailySetId,
      if (word != null) 'word': word,
      'kind': kind,
      'source': source,
      'audioMimeType': audioMimeType,
    });
    return VocabularyStartResponse.fromJson(data);
  }

  Future<void> reportUploadStatus({
    required String attemptId,
    required String recordingUploadStatus,
    int? durationSeconds,
  }) async {
    await _api.apiPost('/vocabulary/$_uid/attempt/upload-complete', {
      'attemptId': attemptId,
      'recordingUploadStatus': recordingUploadStatus,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
    });
  }

  Future<void> startAnalysis(String attemptId) async {
    await _api.apiPost('/vocabulary/$_uid/attempt/analyze', {
      'attemptId': attemptId,
    });
  }

  Future<void> retryAnalysis(String attemptId) async {
    await _api.apiPost('/vocabulary/$_uid/attempt/retry', {
      'attemptId': attemptId,
    });
  }

  Future<VocabularyAttempt> getAttempt(String attemptId) async {
    final data = await _api.apiGet('/vocabulary/$_uid/attempt/$attemptId');
    return VocabularyAttempt.fromJson(
      (data['attempt'] as Map).cast<String, dynamic>(),
    );
  }

  Future<String> playbackUrl(String attemptId) async {
    final data = await _api.apiGet(
      '/vocabulary/$_uid/recording/playback-url?attempt_id=$attemptId',
    );
    return data['url'] as String;
  }

  Future<VocabularyProgressSummary> progress() async {
    final data = await _api.apiGet('/vocabulary/$_uid/progress');
    final summary = data['progress'] ?? data['user_progress'] ?? data;
    return VocabularyProgressSummary.fromJson(
      (summary as Map).cast<String, dynamic>(),
    );
  }

  Future<List<VocabularyLibraryEntry>> library({
    String? status,
    String? cefr,
    String? partOfSpeech,
    String? register,
    String? search,
  }) async {
    final qs = <String>[];
    if (status != null) qs.add('status=$status');
    if (cefr != null) qs.add('cefr=$cefr');
    if (partOfSpeech != null) qs.add('part_of_speech=$partOfSpeech');
    if (register != null) qs.add('register=$register');
    if (search != null && search.isNotEmpty) {
      qs.add('search=${Uri.encodeQueryComponent(search)}');
    }
    final suffix = qs.isEmpty ? '' : '?${qs.join('&')}';
    final data = await _api.apiGet('/vocabulary/$_uid/library$suffix');
    final list = data['entries'] as List? ?? data['library'] as List?;
    if (list == null) return const [];
    return list
        .map((r) => VocabularyLibraryEntry.fromJson(
            (r as Map).cast<String, dynamic>()))
        .toList();
  }

  Future<Map<String, dynamic>> revisionDue({int limit = 20}) async {
    return _api.apiGet('/vocabulary/$_uid/revision/due?limit=$limit');
  }

  Future<void> submitRevision({
    required String word,
    required String result,
    required String mode,
    String? attemptId,
  }) async {
    await _api.apiPost('/vocabulary/$_uid/revision/submit', {
      'word': word,
      'result': result,
      'mode': mode,
      if (attemptId != null) 'attempt_id': attemptId,
    });
  }

  Future<Map<String, dynamic>> history({int limit = 30}) async {
    return _api.apiGet('/vocabulary/$_uid/history?limit=$limit');
  }

  Future<Map<String, dynamic>> wordDetail(String word) async {
    return _api.apiGet('/vocabulary/$_uid/word/${Uri.encodeComponent(word)}');
  }

  Future<VocabularyAttempt> pollAttempt(
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
}

@riverpod
Future<VocabularyTodayResponse> vocabularyToday(Ref ref) =>
    ref.watch(vocabularyRepositoryProvider).today();

@riverpod
Future<VocabularyProgressSummary> vocabularyProgress(Ref ref) =>
    ref.watch(vocabularyRepositoryProvider).progress();
