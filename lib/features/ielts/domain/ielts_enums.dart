import 'package:json_annotation/json_annotation.dart';

/// IELTS enums (mirror of `ielts-types.ts`). See 14 / 27.

enum IeltsPart {
  @JsonValue('overview')
  overview,
  @JsonValue('part_1')
  part1,
  @JsonValue('part_2')
  part2,
  @JsonValue('part_3')
  part3,
  @JsonValue('mock')
  mock,
}

enum IeltsLessonStatus {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
}

enum IeltsAttemptUploadStatus {
  @JsonValue('none')
  none,
  @JsonValue('uploaded')
  uploaded,
  @JsonValue('failed')
  failed,
  @JsonValue('skipped')
  skipped,
}

enum IeltsMockStatus {
  @JsonValue('started')
  started,
  @JsonValue('completed')
  completed,
  @JsonValue('abandoned')
  abandoned,
}

enum IeltsBlockType {
  @JsonValue('explanation')
  explanation,
  @JsonValue('example_answer')
  exampleAnswer,
  @JsonValue('weak_strong')
  weakStrong,
  @JsonValue('formula')
  formula,
  @JsonValue('multiple_choice')
  multipleChoice,
  @JsonValue('record_answer')
  recordAnswer,
  @JsonValue('cue_card')
  cueCard,
  @JsonValue('vocabulary_upgrade')
  vocabularyUpgrade,
  @JsonValue('pronunciation')
  pronunciation,
  @JsonValue('ai_tutor_mock')
  aiTutorMock,
  @JsonValue('summary')
  summary,
}

enum PronunciationFocus {
  @JsonValue('stress')
  stress,
  @JsonValue('intonation')
  intonation,
  @JsonValue('clarity')
  clarity,
  @JsonValue('chunking')
  chunking,
}

extension IeltsPartWire on IeltsPart {
  String get wire => switch (this) {
        IeltsPart.overview => 'overview',
        IeltsPart.part1 => 'part_1',
        IeltsPart.part2 => 'part_2',
        IeltsPart.part3 => 'part_3',
        IeltsPart.mock => 'mock',
      };
}
