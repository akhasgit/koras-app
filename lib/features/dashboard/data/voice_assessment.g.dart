// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoiceScoresImpl _$$VoiceScoresImplFromJson(Map<String, dynamic> json) =>
    _$VoiceScoresImpl(
      overall: (json['overall'] as num).toInt(),
      pitch: (json['pitch'] as num).toInt(),
      pace: (json['pace'] as num).toInt(),
      clarity: (json['clarity'] as num).toInt(),
      resonance: (json['resonance'] as num).toInt(),
      confidence: (json['confidence'] as num).toInt(),
    );

Map<String, dynamic> _$$VoiceScoresImplToJson(_$VoiceScoresImpl instance) =>
    <String, dynamic>{
      'overall': instance.overall,
      'pitch': instance.pitch,
      'pace': instance.pace,
      'clarity': instance.clarity,
      'resonance': instance.resonance,
      'confidence': instance.confidence,
    };

_$VoiceAssessmentImpl _$$VoiceAssessmentImplFromJson(
        Map<String, dynamic> json) =>
    _$VoiceAssessmentImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      isBaseline: json['is_baseline'] as bool? ?? false,
      scores: VoiceScores.fromJson(json['scores'] as Map<String, dynamic>),
      metrics: json['metrics'] as Map<String, dynamic>?,
      transcript: json['transcript'] as String?,
      transcriptAnalysis: json['transcript_analysis'] as Map<String, dynamic>?,
      coachFeedback: json['coach_feedback'] as String?,
      archetype: json['archetype'] as String?,
      audioKey: json['audio_key'] as String?,
      audioUploadedAt: json['audio_uploaded_at'] == null
          ? null
          : DateTime.parse(json['audio_uploaded_at'] as String),
      audioExpiresAt: json['audio_expires_at'] == null
          ? null
          : DateTime.parse(json['audio_expires_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$VoiceAssessmentImplToJson(
        _$VoiceAssessmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'is_baseline': instance.isBaseline,
      'scores': instance.scores,
      'metrics': instance.metrics,
      'transcript': instance.transcript,
      'transcript_analysis': instance.transcriptAnalysis,
      'coach_feedback': instance.coachFeedback,
      'archetype': instance.archetype,
      'audio_key': instance.audioKey,
      'audio_uploaded_at': instance.audioUploadedAt?.toIso8601String(),
      'audio_expires_at': instance.audioExpiresAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
