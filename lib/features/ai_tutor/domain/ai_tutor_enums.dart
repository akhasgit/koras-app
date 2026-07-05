import 'package:json_annotation/json_annotation.dart';

/// AI Tutor enums + constants (mirror of `ai-tutor-types.ts`). See 13 / 27.

enum AiTutorMode {
  @JsonValue('speaking_foundations')
  speakingFoundations,
  @JsonValue('free_practice')
  freePractice,
  @JsonValue('ielts_mock')
  ieltsMock,
}

enum AiTutorSessionStatus {
  @JsonValue('started')
  started,
  @JsonValue('active')
  active,
  @JsonValue('analyzing')
  analyzing,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
}

enum RecordingUploadStatus {
  @JsonValue('none')
  none,
  @JsonValue('pending')
  pending,
  @JsonValue('uploaded')
  uploaded,
  @JsonValue('failed')
  failed,
  @JsonValue('skipped')
  skipped,
}

enum TurnRole {
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
}

/// Wire values for edge-function bodies.
extension AiTutorModeWire on AiTutorMode {
  String get wire => switch (this) {
        AiTutorMode.speakingFoundations => 'speaking_foundations',
        AiTutorMode.freePractice => 'free_practice',
        AiTutorMode.ieltsMock => 'ielts_mock',
      };
}

abstract final class AiTutorConstants {
  static const minUserTurnsForAnalysis = 2;
  static const minTotalUserTranscriptLength = 20;
  static const maxTranscriptLength = 10000;
  static const maxTurnTranscriptLength = 5000;
}
