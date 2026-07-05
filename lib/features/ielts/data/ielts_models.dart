import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/ielts_enums.dart';

part 'ielts_models.freezed.dart';
part 'ielts_models.g.dart';

@freezed
class IeltsReportFeedback with _$IeltsReportFeedback {
  const factory IeltsReportFeedback({
    @Default('') String summary,
    @Default([]) List<String> strengths,
    @Default([]) List<String> improvements,
  }) = _IeltsReportFeedback;

  factory IeltsReportFeedback.fromJson(Map<String, dynamic> j) =>
      _$IeltsReportFeedbackFromJson(j);
}

/// Returned by `ielts-attempt-submit` (camelCase wire shape). See 14.
@freezed
class IeltsReport with _$IeltsReport {
  const factory IeltsReport({
    @Default(0) num overallScore,
    @Default(0) num practiceBandEstimate,
    @Default({}) Map<String, num> criteriaScores,
    @Default({}) Map<String, num> criteriaBand,
    @Default(IeltsReportFeedback()) IeltsReportFeedback feedback,
    String? transcript,
    @Default([]) List<String> detectedLanguages,
    @Default(false) bool codeSwitchingDetected,
  }) = _IeltsReport;

  factory IeltsReport.fromJson(Map<String, dynamic> j) =>
      _$IeltsReportFromJson(j);
}

/// Row from `ielts_user_progress`.
@freezed
class IeltsProgress with _$IeltsProgress {
  const factory IeltsProgress({
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'lessons_completed') @Default(0) int lessonsCompleted,
    @JsonKey(name: 'total_attempts') @Default(0) int totalAttempts,
    @JsonKey(name: 'best_band') double? bestBand,
    @JsonKey(name: 'latest_band') double? latestBand,
    @JsonKey(name: 'xp_total') @Default(0) int xpTotal,
  }) = _IeltsProgress;

  factory IeltsProgress.fromJson(Map<String, dynamic> j) =>
      _$IeltsProgressFromJson(j);
}

/// Row from `ielts_lesson_attempts`.
@freezed
class IeltsAttempt with _$IeltsAttempt {
  const factory IeltsAttempt({
    required String id,
    @JsonKey(name: 'lesson_id') String? lessonId,
    IeltsPart? part,
    @JsonKey(name: 'practice_band') double? practiceBand,
    @JsonKey(name: 'overall_score') int? overallScore,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _IeltsAttempt;

  factory IeltsAttempt.fromJson(Map<String, dynamic> j) =>
      _$IeltsAttemptFromJson(j);
}

/// Row from `ielts_mock_tests`.
@freezed
class IeltsMockTest with _$IeltsMockTest {
  const factory IeltsMockTest({
    required String id,
    required IeltsMockStatus status,
    @JsonKey(name: 'part1_attempt_id') String? part1AttemptId,
    @JsonKey(name: 'part2_attempt_id') String? part2AttemptId,
    @JsonKey(name: 'part3_attempt_id') String? part3AttemptId,
    @JsonKey(name: 'overall_band') double? overallBand,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _IeltsMockTest;

  factory IeltsMockTest.fromJson(Map<String, dynamic> j) =>
      _$IeltsMockTestFromJson(j);
}
