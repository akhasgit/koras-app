// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppGroup _$AppGroupFromJson(Map<String, dynamic> json) {
  return _AppGroup.fromJson(json);
}

/// @nodoc
mixin _$AppGroup {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'org_id')
  String get orgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'manager_id')
  String? get managerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppGroupCopyWith<AppGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppGroupCopyWith<$Res> {
  factory $AppGroupCopyWith(AppGroup value, $Res Function(AppGroup) then) =
      _$AppGroupCopyWithImpl<$Res, AppGroup>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'org_id') String orgId,
      @JsonKey(name: 'manager_id') String? managerId,
      String name,
      String? description,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$AppGroupCopyWithImpl<$Res, $Val extends AppGroup>
    implements $AppGroupCopyWith<$Res> {
  _$AppGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orgId = null,
    Object? managerId = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppGroupImplCopyWith<$Res>
    implements $AppGroupCopyWith<$Res> {
  factory _$$AppGroupImplCopyWith(
          _$AppGroupImpl value, $Res Function(_$AppGroupImpl) then) =
      __$$AppGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'org_id') String orgId,
      @JsonKey(name: 'manager_id') String? managerId,
      String name,
      String? description,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$AppGroupImplCopyWithImpl<$Res>
    extends _$AppGroupCopyWithImpl<$Res, _$AppGroupImpl>
    implements _$$AppGroupImplCopyWith<$Res> {
  __$$AppGroupImplCopyWithImpl(
      _$AppGroupImpl _value, $Res Function(_$AppGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orgId = null,
    Object? managerId = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AppGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppGroupImpl implements _AppGroup {
  const _$AppGroupImpl(
      {required this.id,
      @JsonKey(name: 'org_id') required this.orgId,
      @JsonKey(name: 'manager_id') this.managerId,
      required this.name,
      this.description,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$AppGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppGroupImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'org_id')
  final String orgId;
  @override
  @JsonKey(name: 'manager_id')
  final String? managerId;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AppGroup(id: $id, orgId: $orgId, managerId: $managerId, name: $name, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, orgId, managerId, name, description, createdAt);

  /// Create a copy of AppGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppGroupImplCopyWith<_$AppGroupImpl> get copyWith =>
      __$$AppGroupImplCopyWithImpl<_$AppGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppGroupImplToJson(
      this,
    );
  }
}

abstract class _AppGroup implements AppGroup {
  const factory _AppGroup(
      {required final String id,
      @JsonKey(name: 'org_id') required final String orgId,
      @JsonKey(name: 'manager_id') final String? managerId,
      required final String name,
      final String? description,
      @JsonKey(name: 'created_at') final DateTime? createdAt}) = _$AppGroupImpl;

  factory _AppGroup.fromJson(Map<String, dynamic> json) =
      _$AppGroupImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'org_id')
  String get orgId;
  @override
  @JsonKey(name: 'manager_id')
  String? get managerId;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of AppGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppGroupImplCopyWith<_$AppGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
