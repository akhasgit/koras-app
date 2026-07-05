// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ielts_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$McOptionImpl _$$McOptionImplFromJson(Map<String, dynamic> json) =>
    _$McOptionImpl(
      id: json['id'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$McOptionImplToJson(_$McOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

_$VocabUpgradeImpl _$$VocabUpgradeImplFromJson(Map<String, dynamic> json) =>
    _$VocabUpgradeImpl(
      phrase: json['phrase'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$VocabUpgradeImplToJson(_$VocabUpgradeImpl instance) =>
    <String, dynamic>{
      'phrase': instance.phrase,
      'note': instance.note,
    };

_$ExplanationBlockImpl _$$ExplanationBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$ExplanationBlockImpl(
      title: json['title'] as String,
      body: json['body'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ExplanationBlockImplToJson(
        _$ExplanationBlockImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'type': instance.$type,
    };

_$ExampleAnswerBlockImpl _$$ExampleAnswerBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$ExampleAnswerBlockImpl(
      prompt: json['prompt'] as String,
      weakAnswer: json['weakAnswer'] as String,
      strongAnswer: json['strongAnswer'] as String,
      whyStrong: json['whyStrong'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ExampleAnswerBlockImplToJson(
        _$ExampleAnswerBlockImpl instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'weakAnswer': instance.weakAnswer,
      'strongAnswer': instance.strongAnswer,
      'whyStrong': instance.whyStrong,
      'type': instance.$type,
    };

_$WeakStrongBlockImpl _$$WeakStrongBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$WeakStrongBlockImpl(
      weak: json['weak'] as String,
      strong: json['strong'] as String,
      notes: json['notes'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$WeakStrongBlockImplToJson(
        _$WeakStrongBlockImpl instance) =>
    <String, dynamic>{
      'weak': instance.weak,
      'strong': instance.strong,
      'notes': instance.notes,
      'type': instance.$type,
    };

_$FormulaBlockImpl _$$FormulaBlockImplFromJson(Map<String, dynamic> json) =>
    _$FormulaBlockImpl(
      formulaName: json['formulaName'] as String,
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$FormulaBlockImplToJson(_$FormulaBlockImpl instance) =>
    <String, dynamic>{
      'formulaName': instance.formulaName,
      'steps': instance.steps,
      'type': instance.$type,
    };

_$MultipleChoiceBlockImpl _$$MultipleChoiceBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$MultipleChoiceBlockImpl(
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => McOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctOptionId: json['correctOptionId'] as String,
      explanation: json['explanation'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$MultipleChoiceBlockImplToJson(
        _$MultipleChoiceBlockImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'correctOptionId': instance.correctOptionId,
      'explanation': instance.explanation,
      'type': instance.$type,
    };

_$RecordAnswerBlockImpl _$$RecordAnswerBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordAnswerBlockImpl(
      prompt: json['prompt'] as String,
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      targetPart: $enumDecode(_$IeltsPartEnumMap, json['targetPart']),
      instructions: json['instructions'] as String,
      gradingRubric: json['gradingRubric'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$RecordAnswerBlockImplToJson(
        _$RecordAnswerBlockImpl instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'durationSeconds': instance.durationSeconds,
      'targetPart': _$IeltsPartEnumMap[instance.targetPart]!,
      'instructions': instance.instructions,
      'gradingRubric': instance.gradingRubric,
      'type': instance.$type,
    };

const _$IeltsPartEnumMap = {
  IeltsPart.overview: 'overview',
  IeltsPart.part1: 'part_1',
  IeltsPart.part2: 'part_2',
  IeltsPart.part3: 'part_3',
  IeltsPart.mock: 'mock',
};

_$CueCardBlockImpl _$$CueCardBlockImplFromJson(Map<String, dynamic> json) =>
    _$CueCardBlockImpl(
      topic: json['topic'] as String,
      bulletPoints: (json['bulletPoints'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      prepSeconds: (json['prepSeconds'] as num).toInt(),
      speakingSeconds: (json['speakingSeconds'] as num).toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$CueCardBlockImplToJson(_$CueCardBlockImpl instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'bulletPoints': instance.bulletPoints,
      'prepSeconds': instance.prepSeconds,
      'speakingSeconds': instance.speakingSeconds,
      'type': instance.$type,
    };

_$VocabularyUpgradeBlockImpl _$$VocabularyUpgradeBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyUpgradeBlockImpl(
      basicPhrase: json['basicPhrase'] as String,
      upgradedPhrases: (json['upgradedPhrases'] as List<dynamic>)
          .map((e) => VocabUpgrade.fromJson(e as Map<String, dynamic>))
          .toList(),
      practicePrompt: json['practicePrompt'] as String,
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$VocabularyUpgradeBlockImplToJson(
        _$VocabularyUpgradeBlockImpl instance) =>
    <String, dynamic>{
      'basicPhrase': instance.basicPhrase,
      'upgradedPhrases': instance.upgradedPhrases,
      'practicePrompt': instance.practicePrompt,
      'durationSeconds': instance.durationSeconds,
      'type': instance.$type,
    };

_$PronunciationBlockImpl _$$PronunciationBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$PronunciationBlockImpl(
      phrase: json['phrase'] as String,
      focus: $enumDecode(_$PronunciationFocusEnumMap, json['focus']),
      modelText: json['modelText'] as String,
      recordingSeconds: (json['recordingSeconds'] as num).toInt(),
      followUpPrompt: json['followUpPrompt'] as String?,
      followUpSeconds: (json['followUpSeconds'] as num?)?.toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$PronunciationBlockImplToJson(
        _$PronunciationBlockImpl instance) =>
    <String, dynamic>{
      'phrase': instance.phrase,
      'focus': _$PronunciationFocusEnumMap[instance.focus]!,
      'modelText': instance.modelText,
      'recordingSeconds': instance.recordingSeconds,
      'followUpPrompt': instance.followUpPrompt,
      'followUpSeconds': instance.followUpSeconds,
      'type': instance.$type,
    };

const _$PronunciationFocusEnumMap = {
  PronunciationFocus.stress: 'stress',
  PronunciationFocus.intonation: 'intonation',
  PronunciationFocus.clarity: 'clarity',
  PronunciationFocus.chunking: 'chunking',
};

_$AiTutorMockBlockImpl _$$AiTutorMockBlockImplFromJson(
        Map<String, dynamic> json) =>
    _$AiTutorMockBlockImpl(
      instructions: json['instructions'] as String,
      estimatedMinutes: (json['estimatedMinutes'] as num).toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$AiTutorMockBlockImplToJson(
        _$AiTutorMockBlockImpl instance) =>
    <String, dynamic>{
      'instructions': instance.instructions,
      'estimatedMinutes': instance.estimatedMinutes,
      'type': instance.$type,
    };

_$SummaryBlockImpl _$$SummaryBlockImplFromJson(Map<String, dynamic> json) =>
    _$SummaryBlockImpl(
      keyTakeaways: (json['keyTakeaways'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      nextLessonId: json['nextLessonId'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$SummaryBlockImplToJson(_$SummaryBlockImpl instance) =>
    <String, dynamic>{
      'keyTakeaways': instance.keyTakeaways,
      'nextLessonId': instance.nextLessonId,
      'type': instance.$type,
    };
