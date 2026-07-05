import 'package:freezed_annotation/freezed_annotation.dart';

import 'ielts_enums.dart';

part 'ielts_block.freezed.dart';
part 'ielts_block.g.dart';

@freezed
class McOption with _$McOption {
  const factory McOption({required String id, required String text}) =
      _McOption;
  factory McOption.fromJson(Map<String, dynamic> j) => _$McOptionFromJson(j);
}

@freezed
class VocabUpgrade with _$VocabUpgrade {
  const factory VocabUpgrade({
    required String phrase,
    String? note,
  }) = _VocabUpgrade;
  factory VocabUpgrade.fromJson(Map<String, dynamic> j) =>
      _$VocabUpgradeFromJson(j);
}

/// The 11 IELTS lesson block types, keyed on a `type` discriminator. See 14.
@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.snake)
sealed class IeltsBlock with _$IeltsBlock {
  const factory IeltsBlock.explanation({
    required String title,
    required String body,
  }) = ExplanationBlock;

  const factory IeltsBlock.exampleAnswer({
    required String prompt,
    required String weakAnswer,
    required String strongAnswer,
    required String whyStrong,
  }) = ExampleAnswerBlock;

  const factory IeltsBlock.weakStrong({
    required String weak,
    required String strong,
    required String notes,
  }) = WeakStrongBlock;

  const factory IeltsBlock.formula({
    required String formulaName,
    required List<String> steps,
  }) = FormulaBlock;

  const factory IeltsBlock.multipleChoice({
    required String question,
    required List<McOption> options,
    required String correctOptionId,
    required String explanation,
  }) = MultipleChoiceBlock;

  const factory IeltsBlock.recordAnswer({
    required String prompt,
    required int durationSeconds,
    required IeltsPart targetPart,
    required String instructions,
    String? gradingRubric,
  }) = RecordAnswerBlock;

  const factory IeltsBlock.cueCard({
    required String topic,
    required List<String> bulletPoints,
    required int prepSeconds,
    required int speakingSeconds,
  }) = CueCardBlock;

  const factory IeltsBlock.vocabularyUpgrade({
    required String basicPhrase,
    required List<VocabUpgrade> upgradedPhrases,
    required String practicePrompt,
    required int durationSeconds,
  }) = VocabularyUpgradeBlock;

  const factory IeltsBlock.pronunciation({
    required String phrase,
    required PronunciationFocus focus,
    required String modelText,
    required int recordingSeconds,
    String? followUpPrompt,
    int? followUpSeconds,
  }) = PronunciationBlock;

  const factory IeltsBlock.aiTutorMock({
    required String instructions,
    required int estimatedMinutes,
  }) = AiTutorMockBlock;

  const factory IeltsBlock.summary({
    required List<String> keyTakeaways,
    String? nextLessonId,
  }) = SummaryBlock;

  factory IeltsBlock.fromJson(Map<String, dynamic> json) =>
      _$IeltsBlockFromJson(json);
}
