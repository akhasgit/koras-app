import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/koras_api_client.dart';
import 'voice_refinement_models.dart';

part 'voice_refinement_repository.g.dart';

@riverpod
VoiceRefinementRepository voiceRefinementRepository(Ref ref) =>
    VoiceRefinementRepository(ref.watch(korasApiClientProvider));

/// Voice Refinement — all traffic goes through `/voice-refinement/{uid}/...`.
/// Baseline analysis, target-to-plan generation, and per-activity attempt
/// analysis are all async server-side jobs. Mobile only records + polls.
/// See `docs/MOBILE_MISSING_FEATURES_BUILD_PLAN.md` §6.
class VoiceRefinementRepository {
  VoiceRefinementRepository(this._api);
  final KorasApiClient _api;

  String get _uid => _api.userId;

  // ── Baseline ──────────────────────────────────────────────────────────────

  Future<VoiceRefinementBaselineStart> startBaseline({
    String promptKind = 'baseline',
    String audioMimeType = 'audio/webm',
  }) async {
    final data = await _api.apiPost('/voice-refinement/$_uid/baseline/start', {
      'audioMimeType': audioMimeType,
      'promptKind': promptKind,
    });
    return VoiceRefinementBaselineStart.fromJson(data);
  }

  Future<void> reportBaselineUpload({
    required String baselineId,
    required String recordingUploadStatus,
    int? durationSeconds,
  }) async {
    await _api.apiPost('/voice-refinement/$_uid/baseline/upload-complete', {
      'baselineId': baselineId,
      'recordingUploadStatus': recordingUploadStatus,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
    });
  }

  Future<void> startBaselineAnalysis(String baselineId) async {
    await _api.apiPost('/voice-refinement/$_uid/baseline/analyze', {
      'baselineId': baselineId,
    });
  }

  Future<VoiceRefinementBaseline> getBaseline(String baselineId) async {
    final data =
        await _api.apiGet('/voice-refinement/$_uid/baseline/$baselineId');
    return VoiceRefinementBaseline.fromJson(
      (data['baseline'] as Map).cast<String, dynamic>(),
    );
  }

  Future<VoiceRefinementBaseline> pollBaseline(
    String baselineId, {
    Duration interval = const Duration(seconds: 3),
    int maxAttempts = 40,
  }) async {
    for (var i = 0; i < maxAttempts; i++) {
      await Future.delayed(interval);
      final b = await getBaseline(baselineId);
      if (b.analysisStatus == 'completed') return b;
      if (b.analysisStatus == 'failed') {
        throw ServerError(b.analysisError ?? 'Baseline analysis failed');
      }
    }
    throw const ServerError('Baseline analysis timed out');
  }

  Future<List<VoiceRefinementBaseline>> listBaselines() async {
    final data = await _api.apiGet('/voice-refinement/$_uid/baselines');
    final list = data['baselines'] as List?;
    if (list == null) return const [];
    return list
        .map((r) => VoiceRefinementBaseline.fromJson(
            (r as Map).cast<String, dynamic>()))
        .toList();
  }

  // ── Target + plan ────────────────────────────────────────────────────────

  Future<Map<String, dynamic>> submitTarget({
    required String baselineId,
    required VoiceRefinementTargetIntent target,
  }) async {
    return _api.apiPost('/voice-refinement/$_uid/target/submit', {
      'baselineId': baselineId,
      'target': target.toJson(),
    });
  }

  Future<Map<String, dynamic>> getTarget(String targetId) async {
    return _api.apiGet('/voice-refinement/$_uid/target/$targetId');
  }

  Future<VoiceRefinementPlan?> currentPlan() async {
    final data = await _api.apiGet('/voice-refinement/$_uid/plan/current');
    final plan = data['plan'];
    if (plan == null) return null;
    return VoiceRefinementPlan.fromJson((plan as Map).cast<String, dynamic>());
  }

  // ── Attempts ─────────────────────────────────────────────────────────────

  Future<VoiceRefinementAttemptStart> startAttempt({
    required String planId,
    required String activityId,
    required int day,
    bool isCheckpoint = false,
    String audioMimeType = 'audio/webm',
  }) async {
    final data = await _api.apiPost('/voice-refinement/$_uid/attempt/start', {
      'planId': planId,
      'activityId': activityId,
      'day': day,
      'isCheckpoint': isCheckpoint,
      'audioMimeType': audioMimeType,
    });
    return VoiceRefinementAttemptStart.fromJson(data);
  }

  Future<void> reportAttemptUpload({
    required String attemptId,
    required String recordingUploadStatus,
    int? durationSeconds,
  }) async {
    await _api.apiPost('/voice-refinement/$_uid/attempt/upload-complete', {
      'attemptId': attemptId,
      'recordingUploadStatus': recordingUploadStatus,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
    });
  }

  Future<void> startAttemptAnalysis(String attemptId) async {
    await _api.apiPost('/voice-refinement/$_uid/attempt/analyze', {
      'attemptId': attemptId,
    });
  }

  Future<void> retryAttemptAnalysis(String attemptId) async {
    await _api.apiPost('/voice-refinement/$_uid/attempt/retry', {
      'attemptId': attemptId,
    });
  }

  Future<VoiceRefinementAttempt> getAttempt(String attemptId) async {
    final data =
        await _api.apiGet('/voice-refinement/$_uid/attempt/$attemptId');
    return VoiceRefinementAttempt.fromJson(
      (data['attempt'] as Map).cast<String, dynamic>(),
    );
  }

  Future<VoiceRefinementAttempt> pollAttempt(
    String attemptId, {
    Duration interval = const Duration(seconds: 3),
    int maxAttempts = 40,
  }) async {
    for (var i = 0; i < maxAttempts; i++) {
      await Future.delayed(interval);
      final a = await getAttempt(attemptId);
      if (a.analysisStatus == 'completed') return a;
      if (a.analysisStatus == 'failed') {
        throw ServerError(a.analysisError ?? 'Analysis failed');
      }
    }
    throw const ServerError('Analysis timed out');
  }

  Future<void> completeActivity(String activityId, {String? planId}) async {
    await _api.apiPost('/voice-refinement/$_uid/activity/complete', {
      'activityId': activityId,
      if (planId != null) 'planId': planId,
    });
  }

  Future<List<Map<String, dynamic>>> listCompletions({String? planId}) async {
    final qs = planId == null ? '' : '?planId=$planId';
    final data = await _api.apiGet('/voice-refinement/$_uid/completions$qs');
    final list = data['completions'] as List?;
    if (list == null) return const [];
    return list
        .map<Map<String, dynamic>>((r) => (r as Map).cast<String, dynamic>())
        .toList();
  }
}

@riverpod
Future<VoiceRefinementPlan?> voiceRefinementPlan(Ref ref) =>
    ref.watch(voiceRefinementRepositoryProvider).currentPlan();

@riverpod
Future<List<VoiceRefinementBaseline>> voiceRefinementBaselines(Ref ref) =>
    ref.watch(voiceRefinementRepositoryProvider).listBaselines();
