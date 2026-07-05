// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppInvitation _$AppInvitationFromJson(Map<String, dynamic> json) {
  return _AppInvitation.fromJson(json);
}

/// @nodoc
mixin _$AppInvitation {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'org_id')
  String get orgId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  String? get groupId => throw _privateConstructorUsedError;
  InvitationStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'org_name')
  String? get orgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_name')
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AppInvitation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppInvitationCopyWith<AppInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInvitationCopyWith<$Res> {
  factory $AppInvitationCopyWith(
          AppInvitation value, $Res Function(AppInvitation) then) =
      _$AppInvitationCopyWithImpl<$Res, AppInvitation>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'org_id') String orgId,
      String email,
      UserRole role,
      @JsonKey(name: 'group_id') String? groupId,
      InvitationStatus status,
      @JsonKey(name: 'org_name') String? orgName,
      @JsonKey(name: 'group_name') String? groupName,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$AppInvitationCopyWithImpl<$Res, $Val extends AppInvitation>
    implements $AppInvitationCopyWith<$Res> {
  _$AppInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orgId = null,
    Object? email = null,
    Object? role = null,
    Object? groupId = freezed,
    Object? status = null,
    Object? orgName = freezed,
    Object? groupName = freezed,
    Object? expiresAt = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
      orgName: freezed == orgName
          ? _value.orgName
          : orgName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppInvitationImplCopyWith<$Res>
    implements $AppInvitationCopyWith<$Res> {
  factory _$$AppInvitationImplCopyWith(
          _$AppInvitationImpl value, $Res Function(_$AppInvitationImpl) then) =
      __$$AppInvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'org_id') String orgId,
      String email,
      UserRole role,
      @JsonKey(name: 'group_id') String? groupId,
      InvitationStatus status,
      @JsonKey(name: 'org_name') String? orgName,
      @JsonKey(name: 'group_name') String? groupName,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$AppInvitationImplCopyWithImpl<$Res>
    extends _$AppInvitationCopyWithImpl<$Res, _$AppInvitationImpl>
    implements _$$AppInvitationImplCopyWith<$Res> {
  __$$AppInvitationImplCopyWithImpl(
      _$AppInvitationImpl _value, $Res Function(_$AppInvitationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orgId = null,
    Object? email = null,
    Object? role = null,
    Object? groupId = freezed,
    Object? status = null,
    Object? orgName = freezed,
    Object? groupName = freezed,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$AppInvitationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      orgId: null == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
      orgName: freezed == orgName
          ? _value.orgName
          : orgName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppInvitationImpl implements _AppInvitation {
  const _$AppInvitationImpl(
      {required this.id,
      @JsonKey(name: 'org_id') required this.orgId,
      required this.email,
      required this.role,
      @JsonKey(name: 'group_id') this.groupId,
      this.status = InvitationStatus.pending,
      @JsonKey(name: 'org_name') this.orgName,
      @JsonKey(name: 'group_name') this.groupName,
      @JsonKey(name: 'expires_at') this.expiresAt,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$AppInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppInvitationImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'org_id')
  final String orgId;
  @override
  final String email;
  @override
  final UserRole role;
  @override
  @JsonKey(name: 'group_id')
  final String? groupId;
  @override
  @JsonKey()
  final InvitationStatus status;
  @override
  @JsonKey(name: 'org_name')
  final String? orgName;
  @override
  @JsonKey(name: 'group_name')
  final String? groupName;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AppInvitation(id: $id, orgId: $orgId, email: $email, role: $role, groupId: $groupId, status: $status, orgName: $orgName, groupName: $groupName, expiresAt: $expiresAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInvitationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orgName, orgName) || other.orgName == orgName) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, orgId, email, role, groupId,
      status, orgName, groupName, expiresAt, createdAt);

  /// Create a copy of AppInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInvitationImplCopyWith<_$AppInvitationImpl> get copyWith =>
      __$$AppInvitationImplCopyWithImpl<_$AppInvitationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppInvitationImplToJson(
      this,
    );
  }
}

abstract class _AppInvitation implements AppInvitation {
  const factory _AppInvitation(
          {required final String id,
          @JsonKey(name: 'org_id') required final String orgId,
          required final String email,
          required final UserRole role,
          @JsonKey(name: 'group_id') final String? groupId,
          final InvitationStatus status,
          @JsonKey(name: 'org_name') final String? orgName,
          @JsonKey(name: 'group_name') final String? groupName,
          @JsonKey(name: 'expires_at') final DateTime? expiresAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$AppInvitationImpl;

  factory _AppInvitation.fromJson(Map<String, dynamic> json) =
      _$AppInvitationImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'org_id')
  String get orgId;
  @override
  String get email;
  @override
  UserRole get role;
  @override
  @JsonKey(name: 'group_id')
  String? get groupId;
  @override
  InvitationStatus get status;
  @override
  @JsonKey(name: 'org_name')
  String? get orgName;
  @override
  @JsonKey(name: 'group_name')
  String? get groupName;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of AppInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppInvitationImplCopyWith<_$AppInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
