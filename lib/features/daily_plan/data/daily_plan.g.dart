// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyPlanItemImpl _$$DailyPlanItemImplFromJson(Map<String, dynamic> json) =>
    _$DailyPlanItemImpl(
      itemId: json['item_id'] as String,
      type: $enumDecode(_$DailyPlanItemTypeEnumMap, json['type']),
      programId: json['program_id'] as String?,
      route: json['route'] as String?,
      title: json['title'] as String,
      reason: json['reason'] as String,
      estimatedMinutes: (json['estimated_minutes'] as num?)?.toInt(),
      priority: (json['priority'] as num?)?.toInt(),
      status:
          $enumDecodeNullable(_$DailyPlanItemStatusEnumMap, json['status']) ??
              DailyPlanItemStatus.pending,
    );

Map<String, dynamic> _$$DailyPlanItemImplToJson(_$DailyPlanItemImpl instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'type': _$DailyPlanItemTypeEnumMap[instance.type]!,
      'program_id': instance.programId,
      'route': instance.route,
      'title': instance.title,
      'reason': instance.reason,
      'estimated_minutes': instance.estimatedMinutes,
      'priority': instance.priority,
      'status': _$DailyPlanItemStatusEnumMap[instance.status]!,
    };

const _$DailyPlanItemTypeEnumMap = {
  DailyPlanItemType.programSession: 'program_session',
  DailyPlanItemType.review: 'review',
  DailyPlanItemType.reflection: 'reflection',
  DailyPlanItemType.streakSave: 'streak_save',
};

const _$DailyPlanItemStatusEnumMap = {
  DailyPlanItemStatus.pending: 'pending',
  DailyPlanItemStatus.completed: 'completed',
  DailyPlanItemStatus.skipped: 'skipped',
};

_$DailyPlanImpl _$$DailyPlanImplFromJson(Map<String, dynamic> json) =>
    _$DailyPlanImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      status: $enumDecode(_$DailyPlanStatusEnumMap, json['status']),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => DailyPlanItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      summary: json['summary'] as String?,
      focusArea: json['focus_area'] as String?,
      advice: json['advice'] as String?,
      completedCount: (json['completed_count'] as num?)?.toInt() ?? 0,
      totalItems: (json['total_items'] as num?)?.toInt() ?? 0,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      generatedAt: json['generated_at'] == null
          ? null
          : DateTime.parse(json['generated_at'] as String),
    );

Map<String, dynamic> _$$DailyPlanImplToJson(_$DailyPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'status': _$DailyPlanStatusEnumMap[instance.status]!,
      'items': instance.items,
      'summary': instance.summary,
      'focus_area': instance.focusArea,
      'advice': instance.advice,
      'completed_count': instance.completedCount,
      'total_items': instance.totalItems,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'generated_at': instance.generatedAt?.toIso8601String(),
    };

const _$DailyPlanStatusEnumMap = {
  DailyPlanStatus.active: 'active',
  DailyPlanStatus.superseded: 'superseded',
  DailyPlanStatus.archived: 'archived',
};
