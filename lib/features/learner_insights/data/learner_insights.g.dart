// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_insights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearnerInsightsImpl _$$LearnerInsightsImplFromJson(
        Map<String, dynamic> json) =>
    _$LearnerInsightsImpl(
      userId: json['user_id'] as String,
      overallScoreAvg: json['overall_score_avg'] as num? ?? 0,
      scoreTrend:
          $enumDecodeNullable(_$ScoreTrendEnumMap, json['score_trend']) ??
              ScoreTrend.stable,
      currentLevel: (json['current_level'] as num?)?.toInt() ?? 1,
      xpTotal: (json['xp_total'] as num?)?.toInt() ?? 0,
      currentStreakDays: (json['current_streak_days'] as num?)?.toInt() ?? 0,
      longestStreakDays: (json['longest_streak_days'] as num?)?.toInt() ?? 0,
      totalSessions: (json['total_sessions'] as num?)?.toInt() ?? 0,
      improvementLast30d: json['improvement_last_30d'] as num? ?? 0,
      mostImprovedDimension: json['most_improved_dimension'] as String?,
      strengthsTags: (json['strengths_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      weaknessesTags: (json['weaknesses_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      scoreHistory: (json['score_history'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$LearnerInsightsImplToJson(
        _$LearnerInsightsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'overall_score_avg': instance.overallScoreAvg,
      'score_trend': _$ScoreTrendEnumMap[instance.scoreTrend]!,
      'current_level': instance.currentLevel,
      'xp_total': instance.xpTotal,
      'current_streak_days': instance.currentStreakDays,
      'longest_streak_days': instance.longestStreakDays,
      'total_sessions': instance.totalSessions,
      'improvement_last_30d': instance.improvementLast30d,
      'most_improved_dimension': instance.mostImprovedDimension,
      'strengths_tags': instance.strengthsTags,
      'weaknesses_tags': instance.weaknessesTags,
      'score_history': instance.scoreHistory,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$ScoreTrendEnumMap = {
  ScoreTrend.improving: 'improving',
  ScoreTrend.stable: 'stable',
  ScoreTrend.declining: 'declining',
};
