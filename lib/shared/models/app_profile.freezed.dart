// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppProfile _$AppProfileFromJson(Map<String, dynamic> json) {
  return _AppProfile.fromJson(json);
}

/// @nodoc
mixin _$AppProfile {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'org_id')
  String? get orgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  String? get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_title')
  String? get roleTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'onboarding_completed')
  bool get onboardingCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_test_account')
  bool get isTestAccount => throw _privateConstructorUsedError;

  /// Serializes this AppProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppProfileCopyWith<AppProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppProfileCopyWith<$Res> {
  factory $AppProfileCopyWith(
          AppProfile value, $Res Function(AppProfile) then) =
      _$AppProfileCopyWithImpl<$Res, AppProfile>;
  @useResult
  $Res call(
      {String id,
      String email,
      UserRole role,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'org_id') String? orgId,
      @JsonKey(name: 'group_id') String? groupId,
      @JsonKey(name: 'role_title') String? roleTitle,
      @JsonKey(name: 'onboarding_completed') bool onboardingCompleted,
      @JsonKey(name: 'is_test_account') bool isTestAccount});
}

/// @nodoc
class _$AppProfileCopyWithImpl<$Res, $Val extends AppProfile>
    implements $AppProfileCopyWith<$Res> {
  _$AppProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? orgId = freezed,
    Object? groupId = freezed,
    Object? roleTitle = freezed,
    Object? onboardingCompleted = null,
    Object? isTestAccount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      roleTitle: freezed == roleTitle
          ? _value.roleTitle
          : roleTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingCompleted: null == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isTestAccount: null == isTestAccount
          ? _value.isTestAccount
          : isTestAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppProfileImplCopyWith<$Res>
    implements $AppProfileCopyWith<$Res> {
  factory _$$AppProfileImplCopyWith(
          _$AppProfileImpl value, $Res Function(_$AppProfileImpl) then) =
      __$$AppProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      UserRole role,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'org_id') String? orgId,
      @JsonKey(name: 'group_id') String? groupId,
      @JsonKey(name: 'role_title') String? roleTitle,
      @JsonKey(name: 'onboarding_completed') bool onboardingCompleted,
      @JsonKey(name: 'is_test_account') bool isTestAccount});
}

/// @nodoc
class __$$AppProfileImplCopyWithImpl<$Res>
    extends _$AppProfileCopyWithImpl<$Res, _$AppProfileImpl>
    implements _$$AppProfileImplCopyWith<$Res> {
  __$$AppProfileImplCopyWithImpl(
      _$AppProfileImpl _value, $Res Function(_$AppProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? role = null,
    Object? fullName = freezed,
    Object? avatarUrl = freezed,
    Object? orgId = freezed,
    Object? groupId = freezed,
    Object? roleTitle = freezed,
    Object? onboardingCompleted = null,
    Object? isTestAccount = null,
  }) {
    return _then(_$AppProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      roleTitle: freezed == roleTitle
          ? _value.roleTitle
          : roleTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingCompleted: null == onboardingCompleted
          ? _value.onboardingCompleted
          : onboardingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isTestAccount: null == isTestAccount
          ? _value.isTestAccount
          : isTestAccount // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppProfileImpl implements _AppProfile {
  const _$AppProfileImpl(
      {required this.id,
      required this.email,
      required this.role,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'org_id') this.orgId,
      @JsonKey(name: 'group_id') this.groupId,
      @JsonKey(name: 'role_title') this.roleTitle,
      @JsonKey(name: 'onboarding_completed') this.onboardingCompleted = false,
      @JsonKey(name: 'is_test_account') this.isTestAccount = false});

  factory _$AppProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final UserRole role;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'org_id')
  final String? orgId;
  @override
  @JsonKey(name: 'group_id')
  final String? groupId;
  @override
  @JsonKey(name: 'role_title')
  final String? roleTitle;
  @override
  @JsonKey(name: 'onboarding_completed')
  final bool onboardingCompleted;
  @override
  @JsonKey(name: 'is_test_account')
  final bool isTestAccount;

  @override
  String toString() {
    return 'AppProfile(id: $id, email: $email, role: $role, fullName: $fullName, avatarUrl: $avatarUrl, orgId: $orgId, groupId: $groupId, roleTitle: $roleTitle, onboardingCompleted: $onboardingCompleted, isTestAccount: $isTestAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.roleTitle, roleTitle) ||
                other.roleTitle == roleTitle) &&
            (identical(other.onboardingCompleted, onboardingCompleted) ||
                other.onboardingCompleted == onboardingCompleted) &&
            (identical(other.isTestAccount, isTestAccount) ||
                other.isTestAccount == isTestAccount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, role, fullName,
      avatarUrl, orgId, groupId, roleTitle, onboardingCompleted, isTestAccount);

  /// Create a copy of AppProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppProfileImplCopyWith<_$AppProfileImpl> get copyWith =>
      __$$AppProfileImplCopyWithImpl<_$AppProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppProfileImplToJson(
      this,
    );
  }
}

abstract class _AppProfile implements AppProfile {
  const factory _AppProfile(
          {required final String id,
          required final String email,
          required final UserRole role,
          @JsonKey(name: 'full_name') final String? fullName,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          @JsonKey(name: 'org_id') final String? orgId,
          @JsonKey(name: 'group_id') final String? groupId,
          @JsonKey(name: 'role_title') final String? roleTitle,
          @JsonKey(name: 'onboarding_completed') final bool onboardingCompleted,
          @JsonKey(name: 'is_test_account') final bool isTestAccount}) =
      _$AppProfileImpl;

  factory _AppProfile.fromJson(Map<String, dynamic> json) =
      _$AppProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  UserRole get role;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'org_id')
  String? get orgId;
  @override
  @JsonKey(name: 'group_id')
  String? get groupId;
  @override
  @JsonKey(name: 'role_title')
  String? get roleTitle;
  @override
  @JsonKey(name: 'onboarding_completed')
  bool get onboardingCompleted;
  @override
  @JsonKey(name: 'is_test_account')
  bool get isTestAccount;

  /// Create a copy of AppProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppProfileImplCopyWith<_$AppProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
