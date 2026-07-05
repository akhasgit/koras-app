// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ielts_lessons.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IeltsLessonImpl _$$IeltsLessonImplFromJson(Map<String, dynamic> json) =>
    _$IeltsLessonImpl(
      id: json['id'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String,
      unit: (json['unit'] as num).toInt(),
      unitTitle: json['unitTitle'] as String,
      part: $enumDecode(_$IeltsPartEnumMap, json['part']),
      estimatedMinutes: (json['estimatedMinutes'] as num).toInt(),
      skillTags:
          (json['skillTags'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      learningObjective: json['learningObjective'] as String,
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => IeltsBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      scoringFocus: (json['scoringFocus'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      unlockOrder: (json['unlockOrder'] as num).toInt(),
      xpReward: (json['xpReward'] as num).toInt(),
    );

Map<String, dynamic> _$$IeltsLessonImplToJson(_$IeltsLessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'unit': instance.unit,
      'unitTitle': instance.unitTitle,
      'part': _$IeltsPartEnumMap[instance.part]!,
      'estimatedMinutes': instance.estimatedMinutes,
      'skillTags': instance.skillTags,
      'description': instance.description,
      'learningObjective': instance.learningObjective,
      'blocks': instance.blocks,
      'scoringFocus': instance.scoringFocus,
      'unlockOrder': instance.unlockOrder,
      'xpReward': instance.xpReward,
    };

const _$IeltsPartEnumMap = {
  IeltsPart.overview: 'overview',
  IeltsPart.part1: 'part_1',
  IeltsPart.part2: 'part_2',
  IeltsPart.part3: 'part_3',
  IeltsPart.mock: 'mock',
};
