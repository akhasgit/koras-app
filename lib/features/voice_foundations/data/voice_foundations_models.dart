import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_foundations_models.freezed.dart';
part 'voice_foundations_models.g.dart';

/// Server-authoritative activity from `GET /voice-foundations/{uid}/activities`.
/// Mirrors `VOICE_FOUNDATIONS_ACTIVITIES` in
/// `koras-api/services/voice_foundations_catalog.py`.
@freezed
class VoiceFoundationsActivity with _$VoiceFoundationsActivity {
  const factory VoiceFoundationsActivity({
    required String id,
    required int day,
    required String type,
    required String title,
    @JsonKey(name: 'duration_minutes') String? durationMinutes,
    @JsonKey(name: 'recording_target_seconds') int? recordingTargetSeconds,
  }) = _VoiceFoundationsActivity;

  factory VoiceFoundationsActivity.fromJson(Map<String, dynamic> j) =>
      _$VoiceFoundationsActivityFromJson(j);
}

/// Server-computed progress payload.
@freezed
class VoiceFoundationsProgress with _$VoiceFoundationsProgress {
  const factory VoiceFoundationsProgress({
    @JsonKey(name: 'completedActivityIds')
    @Default([])
    List<String> completedActivityIds,
    @JsonKey(name: 'unlockedDays') @Default([]) List<int> unlockedDays,
    @JsonKey(name: 'currentDay') @Default(1) int currentDay,
    @JsonKey(name: 'completionPercent') @Default(0) num completionPercent,
    @JsonKey(name: 'nextActivityId') String? nextActivityId,
    @JsonKey(name: 'activityStatus')
    @Default({})
    Map<String, String> activityStatus,
    @JsonKey(name: 'totalDays') @Default(7) int totalDays,
  }) = _VoiceFoundationsProgress;

  factory VoiceFoundationsProgress.fromJson(Map<String, dynamic> j) =>
      _$VoiceFoundationsProgressFromJson(j);
}

/// One `voice_foundations_attempts` row.
@freezed
class VoiceFoundationsAttempt with _$VoiceFoundationsAttempt {
  const factory VoiceFoundationsAttempt({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'activity_id') String? activityId,
    int? day,
    @JsonKey(name: 'attempt_status') String? attemptStatus,
    @JsonKey(name: 'analysis_status') String? analysisStatus,
    @JsonKey(name: 'analysis_error') String? analysisError,
    @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
    @JsonKey(name: 'duration_seconds') int? durationSeconds,
    @JsonKey(name: 'audio_object_key') String? audioObjectKey,
    @JsonKey(name: 'audio_mime_type') String? audioMimeType,
    Map<String, dynamic>? scores,
    Map<String, dynamic>? metrics,
    String? transcript,
    @JsonKey(name: 'transcript_analysis') Map<String, dynamic>? transcriptAnalysis,
    @JsonKey(name: 'coach_feedback') String? coachFeedback,
    String? archetype,
    @JsonKey(name: 'raw_response') Map<String, dynamic>? rawResponse,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _VoiceFoundationsAttempt;

  factory VoiceFoundationsAttempt.fromJson(Map<String, dynamic> j) =>
      _$VoiceFoundationsAttemptFromJson(j);
}

/// Presigned R2 PUT bundle returned by `attempt/start`.
@freezed
class VoiceFoundationsUpload with _$VoiceFoundationsUpload {
  const factory VoiceFoundationsUpload({
    required String url,
    @JsonKey(name: 'object_key') required String objectKey,
    @JsonKey(name: 'content_type') required String contentType,
  }) = _VoiceFoundationsUpload;

  factory VoiceFoundationsUpload.fromJson(Map<String, dynamic> j) =>
      _$VoiceFoundationsUploadFromJson(j);
}

@freezed
class VoiceFoundationsStartResponse with _$VoiceFoundationsStartResponse {
  const factory VoiceFoundationsStartResponse({
    required VoiceFoundationsAttempt attempt,
    required VoiceFoundationsUpload upload,
  }) = _VoiceFoundationsStartResponse;

  factory VoiceFoundationsStartResponse.fromJson(Map<String, dynamic> j) =>
      _$VoiceFoundationsStartResponseFromJson(j);
}
