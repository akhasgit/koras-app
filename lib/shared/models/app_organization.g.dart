// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppOrganizationImpl _$$AppOrganizationImplFromJson(
        Map<String, dynamic> json) =>
    _$AppOrganizationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$OrgTypeEnumMap, json['type']),
      status: $enumDecodeNullable(_$OrgStatusEnumMap, json['status']) ??
          OrgStatus.active,
      logoUrl: json['logo_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$AppOrganizationImplToJson(
        _$AppOrganizationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$OrgTypeEnumMap[instance.type]!,
      'status': _$OrgStatusEnumMap[instance.status]!,
      'logo_url': instance.logoUrl,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$OrgTypeEnumMap = {
  OrgType.school: 'school',
  OrgType.university: 'university',
  OrgType.business: 'business',
  OrgType.other: 'other',
};

const _$OrgStatusEnumMap = {
  OrgStatus.active: 'active',
  OrgStatus.pending: 'pending',
  OrgStatus.suspended: 'suspended',
};
