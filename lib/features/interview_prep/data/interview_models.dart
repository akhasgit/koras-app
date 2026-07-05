import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/interview_enums.dart';

part 'interview_models.freezed.dart';
part 'interview_models.g.dart';

/// A saved interview scenario. Defaults have `user_id IS NULL` (read-only).
@freezed
class InterviewScenario with _$InterviewScenario {
  const factory InterviewScenario({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    required String title,
    @JsonKey(name: 'job_role') String? jobRole,
    String? company,
    @JsonKey(name: 'interview_type') InterviewType? interviewType,
    @JsonKey(name: 'experience_level')
    InterviewExperienceLevel? experienceLevel,
    @JsonKey(name: 'job_description') String? jobDescription,
    @JsonKey(name: 'is_default') @Default(false) bool isDefault,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _InterviewScenario;

  factory InterviewScenario.fromJson(Map<String, dynamic> j) =>
      _$InterviewScenarioFromJson(j);
}

@freezed
class InterviewQuestion with _$InterviewQuestion {
  const factory InterviewQuestion({
    required String id,
    required String question,
    @JsonKey(name: 'question_type') InterviewQuestionType? questionType,
    InterviewFramework? framework,
    String? hint,
  }) = _InterviewQuestion;

  factory InterviewQuestion.fromJson(Map<String, dynamic> j) =>
      _$InterviewQuestionFromJson(j);
}

@freezed
class InterviewScores with _$InterviewScores {
  const factory InterviewScores({
    @Default(0) int overall,
    @Default(0) int delivery,
    @Default(0) int relevance,
    @Default(0) int structure,
    @Default(0) int specificity,
    @Default(0) int confidence,
    @Default(0) int fluency,
    @Default(0) int grammar,
    @Default(0) int conciseness,
    @Default(0) int professionalism,
    int? star,
  }) = _InterviewScores;

  factory InterviewScores.fromJson(Map<String, dynamic> j) =>
      _$InterviewScoresFromJson(j);
}

/// Row from `interview_prep_attempts` — tracks three independent status fields.
@freezed
class InterviewAttempt with _$InterviewAttempt {
  const factory InterviewAttempt({
    required String id,
    @JsonKey(name: 'question_id') String? questionId,
    @JsonKey(name: 'recording_upload_status')
    @Default(InterviewRecordingUploadStatus.none)
    InterviewRecordingUploadStatus recordingUploadStatus,
    @JsonKey(name: 'analysis_status')
    @Default(InterviewAnalysisStatus.created)
    InterviewAnalysisStatus analysisStatus,
    @JsonKey(name: 'attempt_status')
    @Default(InterviewAttemptStatus.started)
    InterviewAttemptStatus attemptStatus,
    @JsonKey(name: 'overall_score') int? overallScore,
    String? transcript,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _InterviewAttempt;

  factory InterviewAttempt.fromJson(Map<String, dynamic> j) =>
      _$InterviewAttemptFromJson(j);

  const InterviewAttempt._();

  bool get isTerminal =>
      analysisStatus == InterviewAnalysisStatus.completed ||
      analysisStatus == InterviewAnalysisStatus.failed;
}

/// Local-only resume state, mirrors the web `localStorage` shape. See 15.
@freezed
class InterviewPracticeSessionState with _$InterviewPracticeSessionState {
  const factory InterviewPracticeSessionState({
    required String scenarioId,
    required String practiceSessionId,
    @Default(0) int currentQuestionIndex,
    @Default([]) List<String> answeredQuestionIds,
    @Default({}) Map<String, String> attemptIdsByQuestionId,
    DateTime? updatedAt,
  }) = _InterviewPracticeSessionState;

  factory InterviewPracticeSessionState.fromJson(Map<String, dynamic> j) =>
      _$InterviewPracticeSessionStateFromJson(j);
}
