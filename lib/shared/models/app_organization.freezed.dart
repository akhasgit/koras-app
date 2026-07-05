// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppOrganization _$AppOrganizationFromJson(Map<String, dynamic> json) {
  return _AppOrganization.fromJson(json);
}

/// @nodoc
mixin _$AppOrganization {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  OrgType get type => throw _privateConstructorUsedError;
  OrgStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppOrganization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppOrganization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppOrganizationCopyWith<AppOrganization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppOrganizationCopyWith<$Res> {
  factory $AppOrganizationCopyWith(
          AppOrganization value, $Res Function(AppOrganization) then) =
      _$AppOrganizationCopyWithImpl<$Res, AppOrganization>;
  @useResult
  $Res call(
      {String id,
      String name,
      OrgType type,
      OrgStatus status,
      @JsonKey(name: 'logo_url') String? logoUrl,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$AppOrganizationCopyWithImpl<$Res, $Val extends AppOrganization>
    implements $AppOrganizationCopyWith<$Res> {
  _$AppOrganizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppOrganization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? logoUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OrgType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrgStatus,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppOrganizationImplCopyWith<$Res>
    implements $AppOrganizationCopyWith<$Res> {
  factory _$$AppOrganizationImplCopyWith(_$AppOrganizationImpl value,
          $Res Function(_$AppOrganizationImpl) then) =
      __$$AppOrganizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      OrgType type,
      OrgStatus status,
      @JsonKey(name: 'logo_url') String? logoUrl,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$AppOrganizationImplCopyWithImpl<$Res>
    extends _$AppOrganizationCopyWithImpl<$Res, _$AppOrganizationImpl>
    implements _$$AppOrganizationImplCopyWith<$Res> {
  __$$AppOrganizationImplCopyWithImpl(
      _$AppOrganizationImpl _value, $Res Function(_$AppOrganizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppOrganization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? status = null,
    Object? logoUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AppOrganizationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as OrgType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrgStatus,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
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
class _$AppOrganizationImpl implements _AppOrganization {
  const _$AppOrganizationImpl(
      {required this.id,
      required this.name,
      required this.type,
      this.status = OrgStatus.active,
      @JsonKey(name: 'logo_url') this.logoUrl,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$AppOrganizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppOrganizationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final OrgType type;
  @override
  @JsonKey()
  final OrgStatus status;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AppOrganization(id: $id, name: $name, type: $type, status: $status, logoUrl: $logoUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppOrganizationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, type, status, logoUrl, createdAt);

  /// Create a copy of AppOrganization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppOrganizationImplCopyWith<_$AppOrganizationImpl> get copyWith =>
      __$$AppOrganizationImplCopyWithImpl<_$AppOrganizationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppOrganizationImplToJson(
      this,
    );
  }
}

abstract class _AppOrganization implements AppOrganization {
  const factory _AppOrganization(
          {required final String id,
          required final String name,
          required final OrgType type,
          final OrgStatus status,
          @JsonKey(name: 'logo_url') final String? logoUrl,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$AppOrganizationImpl;

  factory _AppOrganization.fromJson(Map<String, dynamic> json) =
      _$AppOrganizationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  OrgType get type;
  @override
  OrgStatus get status;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of AppOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppOrganizationImplCopyWith<_$AppOrganizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
