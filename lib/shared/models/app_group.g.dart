// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppGroupImpl _$$AppGroupImplFromJson(Map<String, dynamic> json) =>
    _$AppGroupImpl(
      id: json['id'] as String,
      orgId: json['org_id'] as String,
      managerId: json['manager_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$AppGroupImplToJson(_$AppGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'org_id': instance.orgId,
      'manager_id': instance.managerId,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
    };
