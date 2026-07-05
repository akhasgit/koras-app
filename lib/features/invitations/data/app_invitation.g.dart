// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppInvitationImpl _$$AppInvitationImplFromJson(Map<String, dynamic> json) =>
    _$AppInvitationImpl(
      id: json['id'] as String,
      orgId: json['org_id'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      groupId: json['group_id'] as String?,
      status: $enumDecodeNullable(_$InvitationStatusEnumMap, json['status']) ??
          InvitationStatus.pending,
      orgName: json['org_name'] as String?,
      groupName: json['group_name'] as String?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$AppInvitationImplToJson(_$AppInvitationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'group_id': instance.groupId,
      'status': _$InvitationStatusEnumMap[instance.status]!,
      'org_name': instance.orgName,
      'group_name': instance.groupName,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.individual: 'individual',
  UserRole.orgAdmin: 'org_admin',
  UserRole.orgManager: 'org_manager',
  UserRole.orgMember: 'org_member',
  UserRole.superAdmin: 'super_admin',
};

const _$InvitationStatusEnumMap = {
  InvitationStatus.pending: 'pending',
  InvitationStatus.accepted: 'accepted',
  InvitationStatus.revoked: 'revoked',
  InvitationStatus.expired: 'expired',
};
