import 'package:freezed_annotation/freezed_annotation.dart';

part 'listening_models.freezed.dart';
part 'listening_models.g.dart';

@freezed
class ListeningQuestionOption with _$ListeningQuestionOption {
  const factory ListeningQuestionOption({
    required String id,
    required String text,
  }) = _ListeningQuestionOption;

  factory ListeningQuestionOption.fromJson(Map<String, dynamic> j) =>
      _$ListeningQuestionOptionFromJson(j);
}

@freezed
class ListeningQuestion with _$ListeningQuestion {
  const factory ListeningQuestion({
    required String id,
    required String type,
    required String prompt,
    @JsonKey(name: 'targetSkill') String? targetSkill,
    @JsonKey(name: 'segmentIndex') int? segmentIndex,
    List<ListeningQuestionOption>? options,
    @JsonKey(name: 'correctOptionId') String? correctOptionId,
    @JsonKey(name: 'expectedPoints') List<String>? expectedPoints,
    @JsonKey(name: 'sampleStrongAnswer') String? sampleStrongAnswer,
  }) = _ListeningQuestion;

  factory ListeningQuestion.fromJson(Map<String, dynamic> j) =>
      _$ListeningQuestionFromJson(j);
}

@freezed
class ListeningSegment with _$ListeningSegment {
  const factory ListeningSegment({
    required int index,
    required String text,
    @JsonKey(name: 'maxReplays') int? maxReplays,
  }) = _ListeningSegment;

  factory ListeningSegment.fromJson(Map<String, dynamic> j) =>
      _$ListeningSegmentFromJson(j);
}

@freezed
class ListeningPassage with _$ListeningPassage {
  const factory ListeningPassage({
    required String id,
    required String title,
    String? topic,
    required int difficulty,
    @JsonKey(name: 'deliveryMode') String? deliveryMode,
    String? language,
    String? voice,
    @JsonKey(name: 'estimatedMinutes') num? estimatedMinutes,
    @JsonKey(name: 'fullText') String? fullText,
    @JsonKey(name: 'maxReplays') int? maxReplays,
    List<ListeningSegment>? segments,
    @Default([]) List<ListeningQuestion> questions,
  }) = _ListeningPassage;

  factory ListeningPassage.fromJson(Map<String, dynamic> j) =>
      _$ListeningPassageFromJson(j);
}

@freezed
class ListeningPassageProgress with _$ListeningPassageProgress {
  const factory ListeningPassageProgress({
    @JsonKey(name: 'passage_id') String? passageId,
    @Default(0) int attempts,
    @JsonKey(name: 'best_score') int? bestScore,
    @JsonKey(name: 'last_attempt_at') DateTime? lastAttemptAt,
    @JsonKey(name: 'last_status') String? lastStatus,
  }) = _ListeningPassageProgress;

  factory ListeningPassageProgress.fromJson(Map<String, dynamic> j) =>
      _$ListeningPassageProgressFromJson(j);
}

@freezed
class ListeningPassagesResponse with _$ListeningPassagesResponse {
  const factory ListeningPassagesResponse({
    @Default([]) List<ListeningPassage> passages,
    @JsonKey(name: 'progress_by_passage')
    @Default({})
    Map<String, ListeningPassageProgress> progressByPassage,
    @JsonKey(name: 'weakest_skills')
    @Default([])
    List<String> weakestSkills,
    @JsonKey(name: 'user_progress') Map<String, dynamic>? userProgress,
  }) = _ListeningPassagesResponse;

  factory ListeningPassagesResponse.fromJson(Map<String, dynamic> j) =>
      _$ListeningPassagesResponseFromJson(j);
}

@freezed
class ListeningAttempt with _$ListeningAttempt {
  const factory ListeningAttempt({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'passage_id') String? passageId,
    int? difficulty,
    @JsonKey(name: 'delivery_mode') String? deliveryMode,
    @JsonKey(name: 'playback_speed') num? playbackSpeed,
    @JsonKey(name: 'replay_count') int? replayCount,
    String? status,
    @JsonKey(name: 'overall_score') int? overallScore,
    @JsonKey(name: 'skill_breakdown') Map<String, dynamic>? skillBreakdown,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
  }) = _ListeningAttempt;

  factory ListeningAttempt.fromJson(Map<String, dynamic> j) =>
      _$ListeningAttemptFromJson(j);
}

@freezed
class ListeningAnswer with _$ListeningAnswer {
  const factory ListeningAnswer({
    String? id,
    @JsonKey(name: 'attempt_id') String? attemptId,
    @JsonKey(name: 'question_id') String? questionId,
    @JsonKey(name: 'question_type') String? questionType,
    @JsonKey(name: 'target_skill') String? targetSkill,
    @JsonKey(name: 'selected_option_id') String? selectedOptionId,
    @JsonKey(name: 'is_correct') bool? isCorrect,
    String? transcript,
    int? score,
    Map<String, dynamic>? analysis,
    @JsonKey(name: 'recording_r2_key') String? recordingR2Key,
  }) = _ListeningAnswer;

  factory ListeningAnswer.fromJson(Map<String, dynamic> j) =>
      _$ListeningAnswerFromJson(j);
}

@freezed
class ListeningVoiceUpload with _$ListeningVoiceUpload {
  const factory ListeningVoiceUpload({
    required String url,
    @JsonKey(name: 'object_key') required String objectKey,
    @JsonKey(name: 'content_type') required String contentType,
  }) = _ListeningVoiceUpload;

  factory ListeningVoiceUpload.fromJson(Map<String, dynamic> j) =>
      _$ListeningVoiceUploadFromJson(j);
}
