// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyPlanItem _$DailyPlanItemFromJson(Map<String, dynamic> json) {
  return _DailyPlanItem.fromJson(json);
}

/// @nodoc
mixin _$DailyPlanItem {
  @JsonKey(name: 'item_id')
  String get itemId => throw _privateConstructorUsedError;
  DailyPlanItemType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'program_id')
  String? get programId => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_minutes')
  int? get estimatedMinutes => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  DailyPlanItemStatus get status => throw _privateConstructorUsedError;

  /// Serializes this DailyPlanItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyPlanItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyPlanItemCopyWith<DailyPlanItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPlanItemCopyWith<$Res> {
  factory $DailyPlanItemCopyWith(
          DailyPlanItem value, $Res Function(DailyPlanItem) then) =
      _$DailyPlanItemCopyWithImpl<$Res, DailyPlanItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') String itemId,
      DailyPlanItemType type,
      @JsonKey(name: 'program_id') String? programId,
      String? route,
      String title,
      String reason,
      @JsonKey(name: 'estimated_minutes') int? estimatedMinutes,
      int? priority,
      DailyPlanItemStatus status});
}

/// @nodoc
class _$DailyPlanItemCopyWithImpl<$Res, $Val extends DailyPlanItem>
    implements $DailyPlanItemCopyWith<$Res> {
  _$DailyPlanItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyPlanItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? type = null,
    Object? programId = freezed,
    Object? route = freezed,
    Object? title = null,
    Object? reason = null,
    Object? estimatedMinutes = freezed,
    Object? priority = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DailyPlanItemType,
      programId: freezed == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedMinutes: freezed == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DailyPlanItemStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyPlanItemImplCopyWith<$Res>
    implements $DailyPlanItemCopyWith<$Res> {
  factory _$$DailyPlanItemImplCopyWith(
          _$DailyPlanItemImpl value, $Res Function(_$DailyPlanItemImpl) then) =
      __$$DailyPlanItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') String itemId,
      DailyPlanItemType type,
      @JsonKey(name: 'program_id') String? programId,
      String? route,
      String title,
      String reason,
      @JsonKey(name: 'estimated_minutes') int? estimatedMinutes,
      int? priority,
      DailyPlanItemStatus status});
}

/// @nodoc
class __$$DailyPlanItemImplCopyWithImpl<$Res>
    extends _$DailyPlanItemCopyWithImpl<$Res, _$DailyPlanItemImpl>
    implements _$$DailyPlanItemImplCopyWith<$Res> {
  __$$DailyPlanItemImplCopyWithImpl(
      _$DailyPlanItemImpl _value, $Res Function(_$DailyPlanItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyPlanItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? type = null,
    Object? programId = freezed,
    Object? route = freezed,
    Object? title = null,
    Object? reason = null,
    Object? estimatedMinutes = freezed,
    Object? priority = freezed,
    Object? status = null,
  }) {
    return _then(_$DailyPlanItemImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DailyPlanItemType,
      programId: freezed == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedMinutes: freezed == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DailyPlanItemStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyPlanItemImpl implements _DailyPlanItem {
  const _$DailyPlanItemImpl(
      {@JsonKey(name: 'item_id') required this.itemId,
      required this.type,
      @JsonKey(name: 'program_id') this.programId,
      this.route,
      required this.title,
      required this.reason,
      @JsonKey(name: 'estimated_minutes') this.estimatedMinutes,
      this.priority,
      this.status = DailyPlanItemStatus.pending});

  factory _$DailyPlanItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyPlanItemImplFromJson(json);

  @override
  @JsonKey(name: 'item_id')
  final String itemId;
  @override
  final DailyPlanItemType type;
  @override
  @JsonKey(name: 'program_id')
  final String? programId;
  @override
  final String? route;
  @override
  final String title;
  @override
  final String reason;
  @override
  @JsonKey(name: 'estimated_minutes')
  final int? estimatedMinutes;
  @override
  final int? priority;
  @override
  @JsonKey()
  final DailyPlanItemStatus status;

  @override
  String toString() {
    return 'DailyPlanItem(itemId: $itemId, type: $type, programId: $programId, route: $route, title: $title, reason: $reason, estimatedMinutes: $estimatedMinutes, priority: $priority, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPlanItemImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.programId, programId) ||
                other.programId == programId) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, type, programId, route,
      title, reason, estimatedMinutes, priority, status);

  /// Create a copy of DailyPlanItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPlanItemImplCopyWith<_$DailyPlanItemImpl> get copyWith =>
      __$$DailyPlanItemImplCopyWithImpl<_$DailyPlanItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyPlanItemImplToJson(
      this,
    );
  }
}

abstract class _DailyPlanItem implements DailyPlanItem {
  const factory _DailyPlanItem(
      {@JsonKey(name: 'item_id') required final String itemId,
      required final DailyPlanItemType type,
      @JsonKey(name: 'program_id') final String? programId,
      final String? route,
      required final String title,
      required final String reason,
      @JsonKey(name: 'estimated_minutes') final int? estimatedMinutes,
      final int? priority,
      final DailyPlanItemStatus status}) = _$DailyPlanItemImpl;

  factory _DailyPlanItem.fromJson(Map<String, dynamic> json) =
      _$DailyPlanItemImpl.fromJson;

  @override
  @JsonKey(name: 'item_id')
  String get itemId;
  @override
  DailyPlanItemType get type;
  @override
  @JsonKey(name: 'program_id')
  String? get programId;
  @override
  String? get route;
  @override
  String get title;
  @override
  String get reason;
  @override
  @JsonKey(name: 'estimated_minutes')
  int? get estimatedMinutes;
  @override
  int? get priority;
  @override
  DailyPlanItemStatus get status;

  /// Create a copy of DailyPlanItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyPlanItemImplCopyWith<_$DailyPlanItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyPlan _$DailyPlanFromJson(Map<String, dynamic> json) {
  return _DailyPlan.fromJson(json);
}

/// @nodoc
mixin _$DailyPlan {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  DailyPlanStatus get status => throw _privateConstructorUsedError;
  List<DailyPlanItem> get items => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'focus_area')
  String? get focusArea => throw _privateConstructorUsedError;
  String? get advice => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_count')
  int get completedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_items')
  int get totalItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_at')
  DateTime? get generatedAt => throw _privateConstructorUsedError;

  /// Serializes this DailyPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyPlanCopyWith<DailyPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPlanCopyWith<$Res> {
  factory $DailyPlanCopyWith(DailyPlan value, $Res Function(DailyPlan) then) =
      _$DailyPlanCopyWithImpl<$Res, DailyPlan>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      DailyPlanStatus status,
      List<DailyPlanItem> items,
      String? summary,
      @JsonKey(name: 'focus_area') String? focusArea,
      String? advice,
      @JsonKey(name: 'completed_count') int completedCount,
      @JsonKey(name: 'total_items') int totalItems,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'generated_at') DateTime? generatedAt});
}

/// @nodoc
class _$DailyPlanCopyWithImpl<$Res, $Val extends DailyPlan>
    implements $DailyPlanCopyWith<$Res> {
  _$DailyPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? status = null,
    Object? items = null,
    Object? summary = freezed,
    Object? focusArea = freezed,
    Object? advice = freezed,
    Object? completedCount = null,
    Object? totalItems = null,
    Object? expiresAt = freezed,
    Object? generatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DailyPlanStatus,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DailyPlanItem>,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      focusArea: freezed == focusArea
          ? _value.focusArea
          : focusArea // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyPlanImplCopyWith<$Res>
    implements $DailyPlanCopyWith<$Res> {
  factory _$$DailyPlanImplCopyWith(
          _$DailyPlanImpl value, $Res Function(_$DailyPlanImpl) then) =
      __$$DailyPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      DailyPlanStatus status,
      List<DailyPlanItem> items,
      String? summary,
      @JsonKey(name: 'focus_area') String? focusArea,
      String? advice,
      @JsonKey(name: 'completed_count') int completedCount,
      @JsonKey(name: 'total_items') int totalItems,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'generated_at') DateTime? generatedAt});
}

/// @nodoc
class __$$DailyPlanImplCopyWithImpl<$Res>
    extends _$DailyPlanCopyWithImpl<$Res, _$DailyPlanImpl>
    implements _$$DailyPlanImplCopyWith<$Res> {
  __$$DailyPlanImplCopyWithImpl(
      _$DailyPlanImpl _value, $Res Function(_$DailyPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? status = null,
    Object? items = null,
    Object? summary = freezed,
    Object? focusArea = freezed,
    Object? advice = freezed,
    Object? completedCount = null,
    Object? totalItems = null,
    Object? expiresAt = freezed,
    Object? generatedAt = freezed,
  }) {
    return _then(_$DailyPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DailyPlanStatus,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DailyPlanItem>,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      focusArea: freezed == focusArea
          ? _value.focusArea
          : focusArea // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _value.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyPlanImpl implements _DailyPlan {
  const _$DailyPlanImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.status,
      final List<DailyPlanItem> items = const [],
      this.summary,
      @JsonKey(name: 'focus_area') this.focusArea,
      this.advice,
      @JsonKey(name: 'completed_count') this.completedCount = 0,
      @JsonKey(name: 'total_items') this.totalItems = 0,
      @JsonKey(name: 'expires_at') this.expiresAt,
      @JsonKey(name: 'generated_at') this.generatedAt})
      : _items = items;

  factory _$DailyPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyPlanImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final DailyPlanStatus status;
  final List<DailyPlanItem> _items;
  @override
  @JsonKey()
  List<DailyPlanItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? summary;
  @override
  @JsonKey(name: 'focus_area')
  final String? focusArea;
  @override
  final String? advice;
  @override
  @JsonKey(name: 'completed_count')
  final int completedCount;
  @override
  @JsonKey(name: 'total_items')
  final int totalItems;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @JsonKey(name: 'generated_at')
  final DateTime? generatedAt;

  @override
  String toString() {
    return 'DailyPlan(id: $id, userId: $userId, status: $status, items: $items, summary: $summary, focusArea: $focusArea, advice: $advice, completedCount: $completedCount, totalItems: $totalItems, expiresAt: $expiresAt, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.focusArea, focusArea) ||
                other.focusArea == focusArea) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      status,
      const DeepCollectionEquality().hash(_items),
      summary,
      focusArea,
      advice,
      completedCount,
      totalItems,
      expiresAt,
      generatedAt);

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPlanImplCopyWith<_$DailyPlanImpl> get copyWith =>
      __$$DailyPlanImplCopyWithImpl<_$DailyPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyPlanImplToJson(
      this,
    );
  }
}

abstract class _DailyPlan implements DailyPlan {
  const factory _DailyPlan(
          {required final String id,
          @JsonKey(name: 'user_id') required final String userId,
          required final DailyPlanStatus status,
          final List<DailyPlanItem> items,
          final String? summary,
          @JsonKey(name: 'focus_area') final String? focusArea,
          final String? advice,
          @JsonKey(name: 'completed_count') final int completedCount,
          @JsonKey(name: 'total_items') final int totalItems,
          @JsonKey(name: 'expires_at') final DateTime? expiresAt,
          @JsonKey(name: 'generated_at') final DateTime? generatedAt}) =
      _$DailyPlanImpl;

  factory _DailyPlan.fromJson(Map<String, dynamic> json) =
      _$DailyPlanImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  DailyPlanStatus get status;
  @override
  List<DailyPlanItem> get items;
  @override
  String? get summary;
  @override
  @JsonKey(name: 'focus_area')
  String? get focusArea;
  @override
  String? get advice;
  @override
  @JsonKey(name: 'completed_count')
  int get completedCount;
  @override
  @JsonKey(name: 'total_items')
  int get totalItems;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @override
  @JsonKey(name: 'generated_at')
  DateTime? get generatedAt;

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyPlanImplCopyWith<_$DailyPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
