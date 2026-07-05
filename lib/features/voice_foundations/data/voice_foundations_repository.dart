import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/koras_api_client.dart';
import 'voice_foundations_models.dart';

part 'voice_foundations_repository.g.dart';

@riverpod
VoiceFoundationsRepository voiceFoundationsRepository(Ref ref) =>
    VoiceFoundationsRepository(ref.watch(korasApiClientProvider));

/// Voice Foundations — all traffic goes through `/voice-foundations/{uid}/...`.
/// AI analysis is server-side (async, 202 + polling). See
/// `docs/MOBILE_MISSING_FEATURES_BUILD_PLAN.md` §3.
class VoiceFoundationsRepository {
  VoiceFoundationsRepository(this._api);
  final KorasApiClient _api;

  String get _uid => _api.userId;

  Future<List<VoiceFoundationsActivity>> listActivities() async {
    final data = await _api.apiGet('/voice-foundations/$_uid/activities');
    final list = data['activities'] as List?;
    if (list == null) return const [];
    return list
        .map((r) => VoiceFoundationsActivity.fromJson(
            (r as Map).cast<String, dynamic>()))
        .toList();
  }

  Future<VoiceFoundationsProgress> progress() async {
    final data = await _api.apiGet('/voice-foundations/$_uid/progress');
    return VoiceFoundationsProgress.fromJson(data);
  }

  Future<VoiceFoundationsProgress> completeActivity(String activityId) async {
    final data = await _api.apiPost(
      '/voice-foundations/$_uid/activity/complete',
      {'activityId': activityId},
    );
    return VoiceFoundationsProgress.fromJson(
      (data['progress'] as Map).cast<String, dynamic>(),
    );
  }

  Future<VoiceFoundationsProgress> uncompleteActivity(String activityId) async {
    final data = await _api.apiPost(
      '/voice-foundations/$_uid/activity/uncomplete',
      {'activityId': activityId},
    );
    return VoiceFoundationsProgress.fromJson(
      (data['progress'] as Map).cast<String, dynamic>(),
    );
  }

  Future<VoiceFoundationsStartResponse> startAttempt({
    required String activityId,
    required int day,
    String audioMimeType = 'audio/webm',
  }) async {
    final data = await _api.apiPost('/voice-foundations/$_uid/attempt/start', {
      'activityId': activityId,
      'day': day,
      'audioMimeType': audioMimeType,
    });
    return VoiceFoundationsStartResponse.fromJson(data);
  }

  Future<void> reportUploadStatus({
    required String attemptId,
    required String recordingUploadStatus,
    int? durationSeconds,
  }) async {
    await _api.apiPost('/voice-foundations/$_uid/attempt/upload-complete', {
      'attemptId': attemptId,
      'recordingUploadStatus': recordingUploadStatus,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
    });
  }

  Future<void> startAnalysis(String attemptId) async {
    await _api.apiPost('/voice-foundations/$_uid/attempt/analyze', {
      'attemptId': attemptId,
    });
  }

  Future<void> retryAnalysis(String attemptId) async {
    await _api.apiPost('/voice-foundations/$_uid/attempt/retry', {
      'attemptId': attemptId,
    });
  }

  Future<VoiceFoundationsAttempt> getAttempt(String attemptId) async {
    final data =
        await _api.apiGet('/voice-foundations/$_uid/attempt/$attemptId');
    return VoiceFoundationsAttempt.fromJson(
      (data['attempt'] as Map).cast<String, dynamic>(),
    );
  }

  Future<List<VoiceFoundationsAttempt>> listAttempts({
    String? activityId,
  }) async {
    final qs = activityId == null ? '' : '?activityId=$activityId';
    final data = await _api.apiGet('/voice-foundations/$_uid/attempts$qs');
    final list = data['attempts'] as List?;
    if (list == null) return const [];
    return list
        .map((r) => VoiceFoundationsAttempt.fromJson(
            (r as Map).cast<String, dynamic>()))
        .toList();
  }

  Future<String> playbackUrl(String attemptId) async {
    final data = await _api.apiGet(
      '/voice-foundations/$_uid/recording/playback-url?attempt_id=$attemptId',
    );
    return data['url'] as String;
  }

  /// Polls `getAttempt` every [interval] until `analysis_status` is a terminal
  /// value (`completed` or `failed`).
  Future<VoiceFoundationsAttempt> pollAttempt(
    String attemptId, {
    Duration interval = const Duration(seconds: 3),
    int maxAttempts = 40,
  }) async {
    for (var i = 0; i < maxAttempts; i++) {
      await Future.delayed(interval);
      final attempt = await getAttempt(attemptId);
      final status = attempt.analysisStatus;
      if (status == 'completed') return attempt;
      if (status == 'failed') {
        throw ServerError(attempt.analysisError ?? 'Analysis failed');
      }
    }
    throw const ServerError('Analysis timed out');
  }
}

@riverpod
Future<List<VoiceFoundationsActivity>> voiceFoundationsActivities(Ref ref) =>
    ref.watch(voiceFoundationsRepositoryProvider).listActivities();

@riverpod
Future<VoiceFoundationsProgress> voiceFoundationsProgress(Ref ref) =>
    ref.watch(voiceFoundationsRepositoryProvider).progress();
