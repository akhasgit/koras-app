import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_refinement_models.freezed.dart';
part 'voice_refinement_models.g.dart';

@freezed
class VoiceRefinementBaseline with _$VoiceRefinementBaseline {
  const factory VoiceRefinementBaseline({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'audio_object_key') String? audioObjectKey,
    @JsonKey(name: 'audio_mime_type') String? audioMimeType,
    @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
    @JsonKey(name: 'attempt_status') String? attemptStatus,
    @JsonKey(name: 'analysis_status') String? analysisStatus,
    @JsonKey(name: 'analysis_error') String? analysisError,
    @JsonKey(name: 'prompt_kind') String? promptKind,
    Map<String, dynamic>? scores,
    Map<String, dynamic>? metrics,
    String? transcript,
    @JsonKey(name: 'coach_feedback') String? coachFeedback,
    @JsonKey(name: 'natural_range') Map<String, dynamic>? naturalRange,
    @JsonKey(name: 'archetype') String? archetype,
    @JsonKey(name: 'raw_response') Map<String, dynamic>? rawResponse,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _VoiceRefinementBaseline;

  factory VoiceRefinementBaseline.fromJson(Map<String, dynamic> j) =>
      _$VoiceRefinementBaselineFromJson(j);
}

@freezed
class VoiceRefinementUpload with _$VoiceRefinementUpload {
  const factory VoiceRefinementUpload({
    required String url,
    @JsonKey(name: 'object_key') required String objectKey,
    @JsonKey(name: 'content_type') required String contentType,
  }) = _VoiceRefinementUpload;

  factory VoiceRefinementUpload.fromJson(Map<String, dynamic> j) =>
      _$VoiceRefinementUploadFromJson(j);
}

@freezed
class VoiceRefinementBaselineStart with _$VoiceRefinementBaselineStart {
  const factory VoiceRefinementBaselineStart({
    required VoiceRefinementBaseline baseline,
    required VoiceRefinementUpload upload,
  }) = _VoiceRefinementBaselineStart;

  factory VoiceRefinementBaselineStart.fromJson(Map<String, dynamic> j) =>
      _$VoiceRefinementBaselineStartFromJson(j);
}

@freezed
class VoiceRefinementTargetIntent with _$VoiceRefinementTargetIntent {
  const factory VoiceRefinementTargetIntent({
    @JsonKey(name: 'pitch_semitones') @Default(0.0) double pitchSemitones,
    @JsonKey(name: 'speed_ratio') @Default(1.0) double speedRatio,
    @Default(0.0) double resonance,
    @Default(0.0) double brightness,
  }) = _VoiceRefinementTargetIntent;

  factory VoiceRefinementTargetIntent.fromJson(Map<String, dynamic> j) =>
      _$VoiceRefinementTargetIntentFromJson(j);
}

@freezed
class VoiceRefinementPlan with _$VoiceRefinementPlan {
  const factory VoiceRefinementPlan({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'target_id') String? targetId,
    @JsonKey(name: 'baseline_id') String? baselineId,
    String? status,
    @JsonKey(name: 'target_intent') Map<String, dynamic>? targetIntent,
    @JsonKey(name: 'activities') List<Map<String, dynamic>>? activities,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _VoiceRefinementPlan;

  factory VoiceRefinementPlan.fromJson(Map<String, dynamic> j) =>
      _$VoiceRefinementPlanFromJson(j);
}

@freezed
class VoiceRefinementAttempt with _$VoiceRefinementAttempt {
  const factory VoiceRefinementAttempt({
    required String id,
    @JsonKey(name: 'plan_id') String? planId,
    @JsonKey(name: 'activity_id') String? activityId,
    int? day,
    @JsonKey(name: 'is_checkpoint') bool? isCheckpoint,
    @JsonKey(name: 'attempt_status') String? attemptStatus,
    @JsonKey(name: 'analysis_status') String? analysisStatus,
    @JsonKey(name: 'analysis_error') String? analysisError,
    @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
    Map<String, dynamic>? scores,
    Map<String, dynamic>? metrics,
    String? transcript,
    @JsonKey(name: 'coach_feedback') String? coachFeedback,
  }) = _VoiceRefinementAttempt;

  factory VoiceRefinementAttempt.fromJson(Map<String, dynamic> j) =>
      _$VoiceRefinementAttemptFromJson(j);
}

@freezed
class VoiceRefinementAttemptStart with _$VoiceRefinementAttemptStart {
  const factory VoiceRefinementAttemptStart({
    required VoiceRefinementAttempt attempt,
    required VoiceRefinementUpload upload,
  }) = _VoiceRefinementAttemptStart;

  factory VoiceRefinementAttemptStart.fromJson(Map<String, dynamic> j) =>
      _$VoiceRefinementAttemptStartFromJson(j);
}
