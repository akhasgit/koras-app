// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_refinement_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoiceRefinementBaselineImpl _$$VoiceRefinementBaselineImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceRefinementBaselineImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      audioObjectKey: json['audio_object_key'] as String?,
      audioMimeType: json['audio_mime_type'] as String?,
      recordingUploadStatus: json['recording_upload_status'] as String?,
      attemptStatus: json['attempt_status'] as String?,
      analysisStatus: json['analysis_status'] as String?,
      analysisError: json['analysis_error'] as String?,
      promptKind: json['prompt_kind'] as String?,
      scores: json['scores'] as Map<String, dynamic>?,
      metrics: json['metrics'] as Map<String, dynamic>?,
      transcript: json['transcript'] as String?,
      coachFeedback: json['coach_feedback'] as String?,
      naturalRange: json['natural_range'] as Map<String, dynamic>?,
      archetype: json['archetype'] as String?,
      rawResponse: json['raw_response'] as Map<String, dynamic>?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$VoiceRefinementBaselineImplToJson(
        _$VoiceRefinementBaselineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'audio_object_key': instance.audioObjectKey,
      'audio_mime_type': instance.audioMimeType,
      'recording_upload_status': instance.recordingUploadStatus,
      'attempt_status': instance.attemptStatus,
      'analysis_status': instance.analysisStatus,
      'analysis_error': instance.analysisError,
      'prompt_kind': instance.promptKind,
      'scores': instance.scores,
      'metrics': instance.metrics,
      'transcript': instance.transcript,
      'coach_feedback': instance.coachFeedback,
      'natural_range': instance.naturalRange,
      'archetype': instance.archetype,
      'raw_response': instance.rawResponse,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$VoiceRefinementUploadImpl _$$VoiceRefinementUploadImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceRefinementUploadImpl(
      url: json['url'] as String,
      objectKey: json['object_key'] as String,
      contentType: json['content_type'] as String,
    );

Map<String, dynamic> _$$VoiceRefinementUploadImplToJson(
        _$VoiceRefinementUploadImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'object_key': instance.objectKey,
      'content_type': instance.contentType,
    };

_$VoiceRefinementBaselineStartImpl _$$VoiceRefinementBaselineStartImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceRefinementBaselineStartImpl(
      baseline: VoiceRefinementBaseline.fromJson(
          json['baseline'] as Map<String, dynamic>),
      upload: VoiceRefinementUpload.fromJson(
          json['upload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VoiceRefinementBaselineStartImplToJson(
        _$VoiceRefinementBaselineStartImpl instance) =>
    <String, dynamic>{
      'baseline': instance.baseline,
      'upload': instance.upload,
    };

_$VoiceRefinementTargetIntentImpl _$$VoiceRefinementTargetIntentImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceRefinementTargetIntentImpl(
      pitchSemitones: (json['pitch_semitones'] as num?)?.toDouble() ?? 0.0,
      speedRatio: (json['speed_ratio'] as num?)?.toDouble() ?? 1.0,
      resonance: (json['resonance'] as num?)?.toDouble() ?? 0.0,
      brightness: (json['brightness'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$VoiceRefinementTargetIntentImplToJson(
        _$VoiceRefinementTargetIntentImpl instance) =>
    <String, dynamic>{
      'pitch_semitones': instance.pitchSemitones,
      'speed_ratio': instance.speedRatio,
      'resonance': instance.resonance,
      'brightness': instance.brightness,
    };

_$VoiceRefinementPlanImpl _$$VoiceRefinementPlanImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceRefinementPlanImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      targetId: json['target_id'] as String?,
      baselineId: json['baseline_id'] as String?,
      status: json['status'] as String?,
      targetIntent: json['target_intent'] as Map<String, dynamic>?,
      activities: (json['activities'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$VoiceRefinementPlanImplToJson(
        _$VoiceRefinementPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'target_id': instance.targetId,
      'baseline_id': instance.baselineId,
      'status': instance.status,
      'target_intent': instance.targetIntent,
      'activities': instance.activities,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$VoiceRefinementAttemptImpl _$$VoiceRefinementAttemptImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceRefinementAttemptImpl(
      id: json['id'] as String,
      planId: json['plan_id'] as String?,
      activityId: json['activity_id'] as String?,
      day: (json['day'] as num?)?.toInt(),
      isCheckpoint: json['is_checkpoint'] as bool?,
      attemptStatus: json['attempt_status'] as String?,
      analysisStatus: json['analysis_status'] as String?,
      analysisError: json['analysis_error'] as String?,
      recordingUploadStatus: json['recording_upload_status'] as String?,
      scores: json['scores'] as Map<String, dynamic>?,
      metrics: json['metrics'] as Map<String, dynamic>?,
      transcript: json['transcript'] as String?,
      coachFeedback: json['coach_feedback'] as String?,
    );

Map<String, dynamic> _$$VoiceRefinementAttemptImplToJson(
        _$VoiceRefinementAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_id': instance.planId,
      'activity_id': instance.activityId,
      'day': instance.day,
      'is_checkpoint': instance.isCheckpoint,
      'attempt_status': instance.attemptStatus,
      'analysis_status': instance.analysisStatus,
      'analysis_error': instance.analysisError,
      'recording_upload_status': instance.recordingUploadStatus,
      'scores': instance.scores,
      'metrics': instance.metrics,
      'transcript': instance.transcript,
      'coach_feedback': instance.coachFeedback,
    };

_$VoiceRefinementAttemptStartImpl _$$VoiceRefinementAttemptStartImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceRefinementAttemptStartImpl(
      attempt: VoiceRefinementAttempt.fromJson(
          json['attempt'] as Map<String, dynamic>),
      upload: VoiceRefinementUpload.fromJson(
          json['upload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VoiceRefinementAttemptStartImplToJson(
        _$VoiceRefinementAttemptStartImpl instance) =>
    <String, dynamic>{
      'attempt': instance.attempt,
      'upload': instance.upload,
    };
