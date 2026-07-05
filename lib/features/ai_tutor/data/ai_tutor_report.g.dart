// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_tutor_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiTutorScoresImpl _$$AiTutorScoresImplFromJson(Map<String, dynamic> json) =>
    _$AiTutorScoresImpl(
      relevance: (json['relevance'] as num).toInt(),
      eloquence: (json['eloquence'] as num).toInt(),
      fluency: (json['fluency'] as num).toInt(),
      grammar: (json['grammar'] as num).toInt(),
      tense: (json['tense'] as num).toInt(),
      fillerControl: (json['fillerControl'] as num).toInt(),
      clarity: (json['clarity'] as num).toInt(),
      confidence: (json['confidence'] as num).toInt(),
      vocabulary: (json['vocabulary'] as num).toInt(),
      listening: (json['listening'] as num).toInt(),
    );

Map<String, dynamic> _$$AiTutorScoresImplToJson(_$AiTutorScoresImpl instance) =>
    <String, dynamic>{
      'relevance': instance.relevance,
      'eloquence': instance.eloquence,
      'fluency': instance.fluency,
      'grammar': instance.grammar,
      'tense': instance.tense,
      'fillerControl': instance.fillerControl,
      'clarity': instance.clarity,
      'confidence': instance.confidence,
      'vocabulary': instance.vocabulary,
      'listening': instance.listening,
    };

_$AiTutorFeedbackImpl _$$AiTutorFeedbackImplFromJson(
        Map<String, dynamic> json) =>
    _$AiTutorFeedbackImpl(
      summary: json['summary'] as String? ?? '',
      strengths: (json['strengths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      improvements: (json['improvements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      repeatedMistakes: (json['repeatedMistakes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      bestAnswer: json['bestAnswer'] as String?,
      rewrittenAnswer: json['rewrittenAnswer'] as String?,
      nextRecommendedLesson: json['nextRecommendedLesson'] as String?,
    );

Map<String, dynamic> _$$AiTutorFeedbackImplToJson(
        _$AiTutorFeedbackImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'strengths': instance.strengths,
      'improvements': instance.improvements,
      'repeatedMistakes': instance.repeatedMistakes,
      'bestAnswer': instance.bestAnswer,
      'rewrittenAnswer': instance.rewrittenAnswer,
      'nextRecommendedLesson': instance.nextRecommendedLesson,
    };

_$AiTutorReportImpl _$$AiTutorReportImplFromJson(Map<String, dynamic> json) =>
    _$AiTutorReportImpl(
      overall: (json['overall'] as num).toInt(),
      scores: AiTutorScores.fromJson(json['scores'] as Map<String, dynamic>),
      metrics: json['metrics'] as Map<String, dynamic>?,
      feedback:
          AiTutorFeedback.fromJson(json['feedback'] as Map<String, dynamic>),
      turnFeedback: (json['turnFeedback'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AiTutorReportImplToJson(_$AiTutorReportImpl instance) =>
    <String, dynamic>{
      'overall': instance.overall,
      'scores': instance.scores,
      'metrics': instance.metrics,
      'feedback': instance.feedback,
      'turnFeedback': instance.turnFeedback,
    };

_$AiTutorTurnImpl _$$AiTutorTurnImplFromJson(Map<String, dynamic> json) =>
    _$AiTutorTurnImpl(
      sessionId: json['session_id'] as String?,
      role: $enumDecode(_$TurnRoleEnumMap, json['role']),
      turnIndex: (json['turn_index'] as num).toInt(),
      transcript: json['transcript'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$AiTutorTurnImplToJson(_$AiTutorTurnImpl instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'role': _$TurnRoleEnumMap[instance.role]!,
      'turn_index': instance.turnIndex,
      'transcript': instance.transcript,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$TurnRoleEnumMap = {
  TurnRole.user: 'user',
  TurnRole.assistant: 'assistant',
};

_$AiTutorSessionImpl _$$AiTutorSessionImplFromJson(Map<String, dynamic> json) =>
    _$AiTutorSessionImpl(
      id: json['id'] as String,
      mode: $enumDecode(_$AiTutorModeEnumMap, json['mode']),
      status: $enumDecode(_$AiTutorSessionStatusEnumMap, json['status']),
      overallScore: (json['overall_score'] as num?)?.toInt(),
      durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$AiTutorSessionImplToJson(
        _$AiTutorSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': _$AiTutorModeEnumMap[instance.mode]!,
      'status': _$AiTutorSessionStatusEnumMap[instance.status]!,
      'overall_score': instance.overallScore,
      'duration_seconds': instance.durationSeconds,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$AiTutorModeEnumMap = {
  AiTutorMode.speakingFoundations: 'speaking_foundations',
  AiTutorMode.freePractice: 'free_practice',
  AiTutorMode.ieltsMock: 'ielts_mock',
};

const _$AiTutorSessionStatusEnumMap = {
  AiTutorSessionStatus.started: 'started',
  AiTutorSessionStatus.active: 'active',
  AiTutorSessionStatus.analyzing: 'analyzing',
  AiTutorSessionStatus.completed: 'completed',
  AiTutorSessionStatus.failed: 'failed',
};
