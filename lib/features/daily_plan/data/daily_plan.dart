import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/enums.dart';

part 'daily_plan.freezed.dart';
part 'daily_plan.g.dart';

/// Mirrors `daily_lesson_plans` items (migration 0016). See 07 / 16.
@freezed
class DailyPlanItem with _$DailyPlanItem {
  const factory DailyPlanItem({
    @JsonKey(name: 'item_id') required String itemId,
    required DailyPlanItemType type,
    @JsonKey(name: 'program_id') String? programId,
    String? route,
    required String title,
    required String reason,
    @JsonKey(name: 'estimated_minutes') int? estimatedMinutes,
    int? priority,
    @Default(DailyPlanItemStatus.pending) DailyPlanItemStatus status,
  }) = _DailyPlanItem;

  factory DailyPlanItem.fromJson(Map<String, dynamic> json) =>
      _$DailyPlanItemFromJson(json);
}

@freezed
class DailyPlan with _$DailyPlan {
  const factory DailyPlan({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required DailyPlanStatus status,
    @Default([]) List<DailyPlanItem> items,
    String? summary,
    @JsonKey(name: 'focus_area') String? focusArea,
    String? advice,
    @JsonKey(name: 'completed_count') @Default(0) int completedCount,
    @JsonKey(name: 'total_items') @Default(0) int totalItems,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'generated_at') DateTime? generatedAt,
  }) = _DailyPlan;

  factory DailyPlan.fromJson(Map<String, dynamic> json) =>
      _$DailyPlanFromJson(json);
}
