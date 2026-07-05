// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_foundations_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoiceFoundationsActivityImpl _$$VoiceFoundationsActivityImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceFoundationsActivityImpl(
      id: json['id'] as String,
      day: (json['day'] as num).toInt(),
      type: json['type'] as String,
      title: json['title'] as String,
      durationMinutes: json['duration_minutes'] as String?,
      recordingTargetSeconds:
          (json['recording_target_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VoiceFoundationsActivityImplToJson(
        _$VoiceFoundationsActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'type': instance.type,
      'title': instance.title,
      'duration_minutes': instance.durationMinutes,
      'recording_target_seconds': instance.recordingTargetSeconds,
    };

_$VoiceFoundationsProgressImpl _$$VoiceFoundationsProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceFoundationsProgressImpl(
      completedActivityIds: (json['completedActivityIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      unlockedDays: (json['unlockedDays'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      currentDay: (json['currentDay'] as num?)?.toInt() ?? 1,
      completionPercent: json['completionPercent'] as num? ?? 0,
      nextActivityId: json['nextActivityId'] as String?,
      activityStatus: (json['activityStatus'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      totalDays: (json['totalDays'] as num?)?.toInt() ?? 7,
    );

Map<String, dynamic> _$$VoiceFoundationsProgressImplToJson(
        _$VoiceFoundationsProgressImpl instance) =>
    <String, dynamic>{
      'completedActivityIds': instance.completedActivityIds,
      'unlockedDays': instance.unlockedDays,
      'currentDay': instance.currentDay,
      'completionPercent': instance.completionPercent,
      'nextActivityId': instance.nextActivityId,
      'activityStatus': instance.activityStatus,
      'totalDays': instance.totalDays,
    };

_$VoiceFoundationsAttemptImpl _$$VoiceFoundationsAttemptImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceFoundationsAttemptImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      activityId: json['activity_id'] as String?,
      day: (json['day'] as num?)?.toInt(),
      attemptStatus: json['attempt_status'] as String?,
      analysisStatus: json['analysis_status'] as String?,
      analysisError: json['analysis_error'] as String?,
      recordingUploadStatus: json['recording_upload_status'] as String?,
      durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
      audioObjectKey: json['audio_object_key'] as String?,
      audioMimeType: json['audio_mime_type'] as String?,
      scores: json['scores'] as Map<String, dynamic>?,
      metrics: json['metrics'] as Map<String, dynamic>?,
      transcript: json['transcript'] as String?,
      transcriptAnalysis: json['transcript_analysis'] as Map<String, dynamic>?,
      coachFeedback: json['coach_feedback'] as String?,
      archetype: json['archetype'] as String?,
      rawResponse: json['raw_response'] as Map<String, dynamic>?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$VoiceFoundationsAttemptImplToJson(
        _$VoiceFoundationsAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'activity_id': instance.activityId,
      'day': instance.day,
      'attempt_status': instance.attemptStatus,
      'analysis_status': instance.analysisStatus,
      'analysis_error': instance.analysisError,
      'recording_upload_status': instance.recordingUploadStatus,
      'duration_seconds': instance.durationSeconds,
      'audio_object_key': instance.audioObjectKey,
      'audio_mime_type': instance.audioMimeType,
      'scores': instance.scores,
      'metrics': instance.metrics,
      'transcript': instance.transcript,
      'transcript_analysis': instance.transcriptAnalysis,
      'coach_feedback': instance.coachFeedback,
      'archetype': instance.archetype,
      'raw_response': instance.rawResponse,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$VoiceFoundationsUploadImpl _$$VoiceFoundationsUploadImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceFoundationsUploadImpl(
      url: json['url'] as String,
      objectKey: json['object_key'] as String,
      contentType: json['content_type'] as String,
    );

Map<String, dynamic> _$$VoiceFoundationsUploadImplToJson(
        _$VoiceFoundationsUploadImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'object_key': instance.objectKey,
      'content_type': instance.contentType,
    };

_$VoiceFoundationsStartResponseImpl
    _$$VoiceFoundationsStartResponseImplFromJson(Map<String, dynamic> json) =>
        _$VoiceFoundationsStartResponseImpl(
          attempt: VoiceFoundationsAttempt.fromJson(
              json['attempt'] as Map<String, dynamic>),
          upload: VoiceFoundationsUpload.fromJson(
              json['upload'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$VoiceFoundationsStartResponseImplToJson(
        _$VoiceFoundationsStartResponseImpl instance) =>
    <String, dynamic>{
      'attempt': instance.attempt,
      'upload': instance.upload,
    };
