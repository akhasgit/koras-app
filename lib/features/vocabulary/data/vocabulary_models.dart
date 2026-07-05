import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary_models.freezed.dart';
part 'vocabulary_models.g.dart';

/// One of the 5 words generated for the day.
/// Mirrors `WordObject` in `koras-ai/models/vocabulary.py`.
@freezed
class VocabularyWord with _$VocabularyWord {
  const factory VocabularyWord({
    required String word,
    @JsonKey(name: 'part_of_speech') String? partOfSpeech,
    String? definition,
    String? ipa,
    @JsonKey(name: 'example_sentence') String? exampleSentence,
    @JsonKey(name: 'why_chosen') String? whyChosen,
    String? cefr,
    String? register,
    String? difficulty,
  }) = _VocabularyWord;

  factory VocabularyWord.fromJson(Map<String, dynamic> j) =>
      _$VocabularyWordFromJson(j);
}

/// Per-word progress inside a daily set.
@freezed
class VocabularyWordProgress with _$VocabularyWordProgress {
  const factory VocabularyWordProgress({
    @JsonKey(name: 'daily_set_id') String? dailySetId,
    required String word,
    @Default('learn') String stage,
    int? position,
    @JsonKey(name: 'mastered_at') DateTime? masteredAt,
  }) = _VocabularyWordProgress;

  factory VocabularyWordProgress.fromJson(Map<String, dynamic> j) =>
      _$VocabularyWordProgressFromJson(j);
}

/// A `vocabulary_daily_sets` row plus its words.
@freezed
class VocabularyDailySet with _$VocabularyDailySet {
  const factory VocabularyDailySet({
    required String id,
    @JsonKey(name: 'set_date') String? setDate,
    String? status,
    @Default([]) List<VocabularyWord> words,
    @JsonKey(name: 'generated_at') DateTime? generatedAt,
  }) = _VocabularyDailySet;

  factory VocabularyDailySet.fromJson(Map<String, dynamic> j) =>
      _$VocabularyDailySetFromJson(j);
}

@freezed
class VocabularyTodayResponse with _$VocabularyTodayResponse {
  const factory VocabularyTodayResponse({
    @JsonKey(name: 'set') required VocabularyDailySet dailySet,
    @Default([]) List<VocabularyWord> words,
    @Default([]) List<VocabularyWordProgress> progress,
  }) = _VocabularyTodayResponse;

  factory VocabularyTodayResponse.fromJson(Map<String, dynamic> j) =>
      _$VocabularyTodayResponseFromJson(j);
}

@freezed
class VocabularyAttempt with _$VocabularyAttempt {
  const factory VocabularyAttempt({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'daily_set_id') String? dailySetId,
    String? word,
    required String kind,
    String? source,
    @JsonKey(name: 'attempt_status') String? attemptStatus,
    @JsonKey(name: 'analysis_status') String? analysisStatus,
    @JsonKey(name: 'analysis_error') String? analysisError,
    @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
    @JsonKey(name: 'audio_object_key') String? audioObjectKey,
    @JsonKey(name: 'audio_mime_type') String? audioMimeType,
    @JsonKey(name: 'duration_seconds') int? durationSeconds,
    String? transcript,
    Map<String, dynamic>? scores,
    Map<String, dynamic>? metrics,
    Map<String, dynamic>? analysis,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _VocabularyAttempt;

  factory VocabularyAttempt.fromJson(Map<String, dynamic> j) =>
      _$VocabularyAttemptFromJson(j);
}

@freezed
class VocabularyUpload with _$VocabularyUpload {
  const factory VocabularyUpload({
    required String url,
    @JsonKey(name: 'object_key') required String objectKey,
    @JsonKey(name: 'content_type') required String contentType,
  }) = _VocabularyUpload;

  factory VocabularyUpload.fromJson(Map<String, dynamic> j) =>
      _$VocabularyUploadFromJson(j);
}

@freezed
class VocabularyStartResponse with _$VocabularyStartResponse {
  const factory VocabularyStartResponse({
    required VocabularyAttempt attempt,
    required VocabularyUpload upload,
  }) = _VocabularyStartResponse;

  factory VocabularyStartResponse.fromJson(Map<String, dynamic> j) =>
      _$VocabularyStartResponseFromJson(j);
}

@freezed
class VocabularyProgressSummary with _$VocabularyProgressSummary {
  const factory VocabularyProgressSummary({
    @Default(0) int xp,
    @Default(1) int level,
    @JsonKey(name: 'current_streak') @Default(0) int currentStreak,
    @JsonKey(name: 'best_streak') @Default(0) int bestStreak,
    @JsonKey(name: 'mastered_count') @Default(0) int masteredCount,
    @JsonKey(name: 'last_active_date') String? lastActiveDate,
  }) = _VocabularyProgressSummary;

  factory VocabularyProgressSummary.fromJson(Map<String, dynamic> j) =>
      _$VocabularyProgressSummaryFromJson(j);
}

@freezed
class VocabularyLibraryEntry with _$VocabularyLibraryEntry {
  const factory VocabularyLibraryEntry({
    required String word,
    @JsonKey(name: 'word_data') Map<String, dynamic>? wordData,
    String? status,
    int? box,
    @JsonKey(name: 'next_review_date') String? nextReviewDate,
    @JsonKey(name: 'times_reviewed') @Default(0) int timesReviewed,
    @JsonKey(name: 'times_correct') @Default(0) int timesCorrect,
    @JsonKey(name: 'times_forgotten') @Default(0) int timesForgotten,
  }) = _VocabularyLibraryEntry;

  factory VocabularyLibraryEntry.fromJson(Map<String, dynamic> j) =>
      _$VocabularyLibraryEntryFromJson(j);
}
