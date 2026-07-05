// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ielts_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IeltsReportFeedbackImpl _$$IeltsReportFeedbackImplFromJson(
        Map<String, dynamic> json) =>
    _$IeltsReportFeedbackImpl(
      summary: json['summary'] as String? ?? '',
      strengths: (json['strengths'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      improvements: (json['improvements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$IeltsReportFeedbackImplToJson(
        _$IeltsReportFeedbackImpl instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'strengths': instance.strengths,
      'improvements': instance.improvements,
    };

_$IeltsReportImpl _$$IeltsReportImplFromJson(Map<String, dynamic> json) =>
    _$IeltsReportImpl(
      overallScore: json['overallScore'] as num? ?? 0,
      practiceBandEstimate: json['practiceBandEstimate'] as num? ?? 0,
      criteriaScores: (json['criteriaScores'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as num),
          ) ??
          const {},
      criteriaBand: (json['criteriaBand'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as num),
          ) ??
          const {},
      feedback: json['feedback'] == null
          ? const IeltsReportFeedback()
          : IeltsReportFeedback.fromJson(
              json['feedback'] as Map<String, dynamic>),
      transcript: json['transcript'] as String?,
      detectedLanguages: (json['detectedLanguages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      codeSwitchingDetected: json['codeSwitchingDetected'] as bool? ?? false,
    );

Map<String, dynamic> _$$IeltsReportImplToJson(_$IeltsReportImpl instance) =>
    <String, dynamic>{
      'overallScore': instance.overallScore,
      'practiceBandEstimate': instance.practiceBandEstimate,
      'criteriaScores': instance.criteriaScores,
      'criteriaBand': instance.criteriaBand,
      'feedback': instance.feedback,
      'transcript': instance.transcript,
      'detectedLanguages': instance.detectedLanguages,
      'codeSwitchingDetected': instance.codeSwitchingDetected,
    };

_$IeltsProgressImpl _$$IeltsProgressImplFromJson(Map<String, dynamic> json) =>
    _$IeltsProgressImpl(
      userId: json['user_id'] as String?,
      lessonsCompleted: (json['lessons_completed'] as num?)?.toInt() ?? 0,
      totalAttempts: (json['total_attempts'] as num?)?.toInt() ?? 0,
      bestBand: (json['best_band'] as num?)?.toDouble(),
      latestBand: (json['latest_band'] as num?)?.toDouble(),
      xpTotal: (json['xp_total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$IeltsProgressImplToJson(_$IeltsProgressImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'lessons_completed': instance.lessonsCompleted,
      'total_attempts': instance.totalAttempts,
      'best_band': instance.bestBand,
      'latest_band': instance.latestBand,
      'xp_total': instance.xpTotal,
    };

_$IeltsAttemptImpl _$$IeltsAttemptImplFromJson(Map<String, dynamic> json) =>
    _$IeltsAttemptImpl(
      id: json['id'] as String,
      lessonId: json['lesson_id'] as String?,
      part: $enumDecodeNullable(_$IeltsPartEnumMap, json['part']),
      practiceBand: (json['practice_band'] as num?)?.toDouble(),
      overallScore: (json['overall_score'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$IeltsAttemptImplToJson(_$IeltsAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lesson_id': instance.lessonId,
      'part': _$IeltsPartEnumMap[instance.part],
      'practice_band': instance.practiceBand,
      'overall_score': instance.overallScore,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$IeltsPartEnumMap = {
  IeltsPart.overview: 'overview',
  IeltsPart.part1: 'part_1',
  IeltsPart.part2: 'part_2',
  IeltsPart.part3: 'part_3',
  IeltsPart.mock: 'mock',
};

_$IeltsMockTestImpl _$$IeltsMockTestImplFromJson(Map<String, dynamic> json) =>
    _$IeltsMockTestImpl(
      id: json['id'] as String,
      status: $enumDecode(_$IeltsMockStatusEnumMap, json['status']),
      part1AttemptId: json['part1_attempt_id'] as String?,
      part2AttemptId: json['part2_attempt_id'] as String?,
      part3AttemptId: json['part3_attempt_id'] as String?,
      overallBand: (json['overall_band'] as num?)?.toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$IeltsMockTestImplToJson(_$IeltsMockTestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$IeltsMockStatusEnumMap[instance.status]!,
      'part1_attempt_id': instance.part1AttemptId,
      'part2_attempt_id': instance.part2AttemptId,
      'part3_attempt_id': instance.part3AttemptId,
      'overall_band': instance.overallBand,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$IeltsMockStatusEnumMap = {
  IeltsMockStatus.started: 'started',
  IeltsMockStatus.completed: 'completed',
  IeltsMockStatus.abandoned: 'abandoned',
};
