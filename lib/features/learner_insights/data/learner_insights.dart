import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/enums.dart';

part 'learner_insights.freezed.dart';
part 'learner_insights.g.dart';

/// Mirrors the materialised `learner_insights` summary (migration 0012). Models
/// the fields the UI reads; the full column list is in the migration. See 17.
@freezed
class LearnerInsights with _$LearnerInsights {
  const factory LearnerInsights({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'overall_score_avg') @Default(0) num overallScoreAvg,
    @JsonKey(name: 'score_trend')
    @Default(ScoreTrend.stable)
    ScoreTrend scoreTrend,
    @JsonKey(name: 'current_level') @Default(1) int currentLevel,
    @JsonKey(name: 'xp_total') @Default(0) int xpTotal,
    @JsonKey(name: 'current_streak_days') @Default(0) int currentStreakDays,
    @JsonKey(name: 'longest_streak_days') @Default(0) int longestStreakDays,
    @JsonKey(name: 'total_sessions') @Default(0) int totalSessions,
    @JsonKey(name: 'improvement_last_30d') @Default(0) num improvementLast30d,
    @JsonKey(name: 'most_improved_dimension') String? mostImprovedDimension,
    @JsonKey(name: 'strengths_tags') @Default([]) List<String> strengthsTags,
    @JsonKey(name: 'weaknesses_tags') @Default([]) List<String> weaknessesTags,
    @JsonKey(name: 'score_history')
    @Default([])
    List<Map<String, dynamic>> scoreHistory,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _LearnerInsights;

  factory LearnerInsights.fromJson(Map<String, dynamic> json) =>
      _$LearnerInsightsFromJson(json);
}
