// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppProfileImpl _$$AppProfileImplFromJson(Map<String, dynamic> json) =>
    _$AppProfileImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      orgId: json['org_id'] as String?,
      groupId: json['group_id'] as String?,
      roleTitle: json['role_title'] as String?,
      onboardingCompleted: json['onboarding_completed'] as bool? ?? false,
      isTestAccount: json['is_test_account'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppProfileImplToJson(_$AppProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'org_id': instance.orgId,
      'group_id': instance.groupId,
      'role_title': instance.roleTitle,
      'onboarding_completed': instance.onboardingCompleted,
      'is_test_account': instance.isTestAccount,
    };

const _$UserRoleEnumMap = {
  UserRole.individual: 'individual',
  UserRole.orgAdmin: 'org_admin',
  UserRole.orgManager: 'org_manager',
  UserRole.orgMember: 'org_member',
  UserRole.superAdmin: 'super_admin',
};
