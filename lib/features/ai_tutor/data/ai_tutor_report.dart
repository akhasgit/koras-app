import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/ai_tutor_enums.dart';

part 'ai_tutor_report.freezed.dart';
part 'ai_tutor_report.g.dart';

/// Ten conversational dimensions (0–100). Mirror of `ai-tutor-types.ts`. See 07.
@freezed
class AiTutorScores with _$AiTutorScores {
  const factory AiTutorScores({
    required int relevance,
    required int eloquence,
    required int fluency,
    required int grammar,
    required int tense,
    required int fillerControl,
    required int clarity,
    required int confidence,
    required int vocabulary,
    required int listening,
  }) = _AiTutorScores;

  factory AiTutorScores.fromJson(Map<String, dynamic> j) =>
      _$AiTutorScoresFromJson(j);
}

@freezed
class AiTutorFeedback with _$AiTutorFeedback {
  const factory AiTutorFeedback({
    @Default('') String summary,
    @Default([]) List<String> strengths,
    @Default([]) List<String> improvements,
    @Default([]) List<String> repeatedMistakes,
    String? bestAnswer,
    String? rewrittenAnswer,
    String? nextRecommendedLesson,
  }) = _AiTutorFeedback;

  factory AiTutorFeedback.fromJson(Map<String, dynamic> j) =>
      _$AiTutorFeedbackFromJson(j);
}

@freezed
class AiTutorReport with _$AiTutorReport {
  const factory AiTutorReport({
    required int overall,
    required AiTutorScores scores,
    Map<String, dynamic>? metrics,
    required AiTutorFeedback feedback,
    @Default([]) List<Map<String, dynamic>> turnFeedback,
  }) = _AiTutorReport;

  factory AiTutorReport.fromJson(Map<String, dynamic> j) =>
      _$AiTutorReportFromJson(j);
}

/// A single conversation turn (written directly to `ai_tutor_turns`).
@freezed
class AiTutorTurn with _$AiTutorTurn {
  const factory AiTutorTurn({
    @JsonKey(name: 'session_id') String? sessionId,
    required TurnRole role,
    @JsonKey(name: 'turn_index') required int turnIndex,
    required String transcript,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AiTutorTurn;

  factory AiTutorTurn.fromJson(Map<String, dynamic> j) =>
      _$AiTutorTurnFromJson(j);
}

/// A row from `ai_tutor_sessions` for the history list.
@freezed
class AiTutorSession with _$AiTutorSession {
  const factory AiTutorSession({
    required String id,
    required AiTutorMode mode,
    required AiTutorSessionStatus status,
    @JsonKey(name: 'overall_score') int? overallScore,
    @JsonKey(name: 'duration_seconds') int? durationSeconds,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _AiTutorSession;

  factory AiTutorSession.fromJson(Map<String, dynamic> j) =>
      _$AiTutorSessionFromJson(j);
}
