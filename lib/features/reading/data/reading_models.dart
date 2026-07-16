import 'package:freezed_annotation/freezed_annotation.dart';

part 'reading_models.freezed.dart';
part 'reading_models.g.dart';

/// A `reading_profiles` row — the reading intake (intent, goals, persona).
/// Mirrors the table in `0022_reading_program.sql`.
@freezed
class ReadingProfile with _$ReadingProfile {
  const factory ReadingProfile({
    @JsonKey(name: 'user_id') String? userId,
    String? intent,
    @Default([]) List<String> goals,
    required String persona,
    @JsonKey(name: 'grade_level') int? gradeLevel,
    @JsonKey(name: 'calibration_attempt_id') String? calibrationAttemptId,
  }) = _ReadingProfile;

  factory ReadingProfile.fromJson(Map<String, dynamic> j) =>
      _$ReadingProfileFromJson(j);
}

/// Server-assembled prefill for the confirm-and-edit intake (§6.1).
/// `GET /reading/{uid}/intake-defaults` → `{ "defaults": {…}, "hasBaseline" }`.
@freezed
class ReadingIntakeDefaults with _$ReadingIntakeDefaults {
  const factory ReadingIntakeDefaults({
    String? intent,
    @Default([]) List<String> goals,
    String? persona,
    @JsonKey(name: 'gradeLevel') int? gradeLevel,
    @JsonKey(name: 'hasBaseline') @Default(false) bool hasBaseline,
  }) = _ReadingIntakeDefaults;

  const ReadingIntakeDefaults._();

  factory ReadingIntakeDefaults.fromJson(Map<String, dynamic> j) =>
      _$ReadingIntakeDefaultsFromJson(j);

  /// Parse the `{defaults: {...}, hasBaseline: bool}` envelope.
  factory ReadingIntakeDefaults.fromResponse(Map<String, dynamic> data) {
    final defaults =
        (data['defaults'] as Map?)?.cast<String, dynamic>() ?? const {};
    return ReadingIntakeDefaults.fromJson({
      ...defaults,
      'hasBaseline': data['hasBaseline'] == true,
    });
  }

  /// True when we hold enough to open the single review card instead of the
  /// blank three-step wizard.
  bool get hasMeaningfulDefaults =>
      (intent != null && intent!.isNotEmpty) ||
      goals.isNotEmpty ||
      (persona != null && persona!.isNotEmpty);
}

/// One stage summary inside `GET /reading/{uid}/program` — enough to render a
/// path node (content is fetched per-stage).
@freezed
class ReadingStageSummary with _$ReadingStageSummary {
  const factory ReadingStageSummary({
    required String id,
    required int position,
    required String title,
    String? theme,
    @JsonKey(name: 'focus_areas') @Default([]) List<String> focusAreas,
    /// locked | generating | unlocked | completed
    @Default('locked') String status,
    @JsonKey(name: 'generation_error') String? generationError,
  }) = _ReadingStageSummary;

  factory ReadingStageSummary.fromJson(Map<String, dynamic> j) =>
      _$ReadingStageSummaryFromJson(j);
}

/// A `reading_programs` row plus its stage summaries (the poll target while
/// "Building your programme…").
@freezed
class ReadingProgram with _$ReadingProgram {
  const factory ReadingProgram({
    required String id,
    /// generating | active | completed | failed
    @Default('generating') String status,
    @JsonKey(name: 'generation_error') String? generationError,
    @Default([]) List<ReadingStageSummary> stages,
  }) = _ReadingProgram;

  const ReadingProgram._();

  factory ReadingProgram.fromJson(Map<String, dynamic> j) =>
      _$ReadingProgramFromJson(j);

  bool get isGenerating => status == 'generating';
  bool get isActive => status == 'active';
  bool get isCompleted => status == 'completed';

  /// Fallback template programme was seeded after a generation failure (§3.3):
  /// still usable, but the path shows a subtle "starter programme" note.
  bool get isStarterProgramme => isActive && generationError != null;

  /// The stage the learner should be working on: first unlocked, else first
  /// generating, else the last completed one.
  ReadingStageSummary? get currentStage {
    final ordered = [...stages]..sort((a, b) => a.position - b.position);
    for (final s in ordered) {
      if (s.status == 'unlocked') return s;
    }
    for (final s in ordered) {
      if (s.status == 'generating') return s;
    }
    return ordered.isEmpty ? null : ordered.last;
  }
}

/// One step inside a lesson. XP lives on steps; lesson XP is their sum (§2.2).
@freezed
class ReadingStep with _$ReadingStep {
  const factory ReadingStep({
    @JsonKey(name: 'step_id') required String stepId,
    /// free_read | guided_read | echo | cold_read | punctuation |
    /// speed_ladder | vocab_context (§5 catalogue)
    @Default('free_read') String type,
    String? title,
    @Default(6) int xp,
    String? passage,
    String? sentence,
    @JsonKey(name: 'guide_wpm') int? guideWpm,
    @JsonKey(name: 'target_notes') String? targetNotes,
  }) = _ReadingStep;

  const ReadingStep._();

  factory ReadingStep.fromJson(Map<String, dynamic> j) =>
      _$ReadingStepFromJson(j);

  /// The text the learner reads aloud for this step.
  String get readText => passage ?? sentence ?? '';
}

/// One lesson inside a stage's generated `content` jsonb.
@freezed
class ReadingLesson with _$ReadingLesson {
  const factory ReadingLesson({
    @JsonKey(name: 'lesson_id') required String lessonId,
    String? title,
    String? focus,
    @JsonKey(name: 'estimated_min') int? estimatedMin,
    @Default(0) int xp,
    @Default([]) List<ReadingStep> steps,
  }) = _ReadingLesson;

  const ReadingLesson._();

  factory ReadingLesson.fromJson(Map<String, dynamic> j) =>
      _$ReadingLessonFromJson(j);

  /// Lesson XP = sum of its steps' XP (§2.2); falls back to the stored value.
  int get totalXp =>
      steps.isEmpty ? xp : steps.fold(0, (sum, s) => sum + s.xp);
}

/// A `reading_lesson_progress` row.
@freezed
class ReadingLessonProgress with _$ReadingLessonProgress {
  const factory ReadingLessonProgress({
    @JsonKey(name: 'lesson_id') required String lessonId,
    @JsonKey(name: 'completed_step_ids') @Default([]) List<String>
        completedStepIds,
    /// in_progress | completed
    @Default('in_progress') String status,
    @JsonKey(name: 'best_scores') Map<String, dynamic>? bestScores,
    @Default(0) int xp,
  }) = _ReadingLessonProgress;

  factory ReadingLessonProgress.fromJson(Map<String, dynamic> j) =>
      _$ReadingLessonProgressFromJson(j);
}

/// Full stage — `GET /reading/{uid}/stage/{stage_id}`: summary fields plus the
/// generated content (lessons/steps) and this user's lesson progress.
@freezed
class ReadingStage with _$ReadingStage {
  const factory ReadingStage({
    required String id,
    required int position,
    required String title,
    String? theme,
    @JsonKey(name: 'focus_areas') @Default([]) List<String> focusAreas,
    @Default('locked') String status,
    @JsonKey(name: 'generation_error') String? generationError,
    @Default([]) List<ReadingLesson> lessons,
    @JsonKey(name: 'target_vocab')
    @Default([])
    List<Map<String, dynamic>> targetVocab,
    @Default([]) List<ReadingLessonProgress> progress,
  }) = _ReadingStage;

  const ReadingStage._();

  factory ReadingStage.fromJson(Map<String, dynamic> j) =>
      _$ReadingStageFromJson(j);

  /// Parse the `{stage: {..., content: {lessons, target_vocab}},
  /// lesson_progress}` envelope, flattening the content jsonb into typed
  /// lessons.
  factory ReadingStage.fromResponse(Map<String, dynamic> data) {
    final stage =
        (data['stage'] as Map?)?.cast<String, dynamic>() ?? data;
    final content =
        (stage['content'] as Map?)?.cast<String, dynamic>() ?? const {};
    final progress = (data['lesson_progress'] as List? ??
            data['progress'] as List? ??
            stage['progress'] as List? ??
            const [])
        .map((r) => (r as Map).cast<String, dynamic>())
        .toList();
    return ReadingStage.fromJson({
      ...stage,
      'lessons': content['lessons'] ?? stage['lessons'] ?? const [],
      'target_vocab':
          content['target_vocab'] ?? stage['target_vocab'] ?? const [],
      'progress': progress,
    });
  }

  ReadingLesson? lessonById(String lessonId) =>
      lessons.where((l) => l.lessonId == lessonId).firstOrNull;

  ReadingLessonProgress? progressFor(String lessonId) =>
      progress.where((p) => p.lessonId == lessonId).firstOrNull;

  bool isStepCompleted(String lessonId, String stepId) =>
      progressFor(lessonId)?.completedStepIds.contains(stepId) ?? false;

  bool isLessonCompleted(String lessonId) =>
      progressFor(lessonId)?.status == 'completed';

  /// Display code for a lesson, e.g. "3.2" — "unit/section" is display copy
  /// only; the schema keyword stays `stage` (§0 design mapping).
  String lessonCode(ReadingLesson lesson) =>
      '$position.${lessons.indexOf(lesson) + 1}';
}

/// Per-word alignment entry from the analysis (`word_feedback` jsonb).
@freezed
class ReadingWordFeedback with _$ReadingWordFeedback {
  const factory ReadingWordFeedback({
    required String word,
    required int index,
    /// correct | substituted | skipped | inserted-neighbour
    @Default('correct') String status,
    String? heard,
    @JsonKey(name: 'pause_before_ms') int? pauseBeforeMs,
    @Default(false) bool hesitation,
  }) = _ReadingWordFeedback;

  factory ReadingWordFeedback.fromJson(Map<String, dynamic> j) =>
      _$ReadingWordFeedbackFromJson(j);
}

/// A `reading_attempts` row. Lifecycle columns mirror `vocabulary_attempts`
/// so the same start → upload → analyze → poll pattern applies.
@freezed
class ReadingAttempt with _$ReadingAttempt {
  const factory ReadingAttempt({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'program_id') String? programId,
    @JsonKey(name: 'stage_id') String? stageId,
    @JsonKey(name: 'lesson_id') String? lessonId,
    @JsonKey(name: 'step_id') String? stepId,
    @JsonKey(name: 'attempt_type') @Default('free_read') String attemptType,
    @JsonKey(name: 'passage_text') String? passageText,
    @JsonKey(name: 'guide_wpm') int? guideWpm,
    @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
    @JsonKey(name: 'attempt_status') String? attemptStatus,
    @JsonKey(name: 'analysis_status') String? analysisStatus,
    @JsonKey(name: 'analysis_error') String? analysisError,
    String? transcript,
    @JsonKey(name: 'match_pct') int? matchPct,
    @JsonKey(name: 'hesitance_score') int? hesitanceScore,
    @JsonKey(name: 'pace_score') int? paceScore,
    @JsonKey(name: 'flow_score') int? flowScore,
    @JsonKey(name: 'overall_score') int? overallScore,
    @JsonKey(name: 'pace_delta_pct') int? paceDeltaPct,
    @JsonKey(name: 'word_feedback')
    @Default([])
    List<ReadingWordFeedback> wordFeedback,
    Map<String, dynamic>? analysis,
    @JsonKey(name: 'duration_seconds') num? durationSeconds,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ReadingAttempt;

  const ReadingAttempt._();

  factory ReadingAttempt.fromJson(Map<String, dynamic> j) =>
      _$ReadingAttemptFromJson(j);

  bool get isCompleted => analysisStatus == 'completed';
  bool get isFailed => analysisStatus == 'failed';

  /// Whisper heard too little to score meaningfully (edge case §6.9) — the
  /// client prompts a re-record in a quieter space.
  bool get lowSignal => analysis?['low_signal'] == true;

  /// Result chips, e.g. `["92% MATCH", "+4% PACE", "Smooth FLOW"]`. Falls back
  /// to chips derived from the stored scores when the analysis omits them.
  List<String> get chips {
    final raw = analysis?['chips'];
    if (raw is List && raw.isNotEmpty) {
      return raw.map((c) => c.toString()).toList();
    }
    return [
      if (matchPct != null) '$matchPct% MATCH',
      if (paceDeltaPct != null)
        '${paceDeltaPct! >= 0 ? '+' : ''}$paceDeltaPct% PACE',
      if (flowScore != null) '$flowBand FLOW',
    ];
  }

  String? get coachFeedback {
    final raw = analysis?['coach_feedback'];
    if (raw is String && raw.isNotEmpty) return raw;
    return null;
  }

  /// Flow band word for the "Smooth FLOW" chip.
  String get flowBand {
    final f = flowScore ?? 0;
    if (f >= 75) return 'Smooth';
    if (f >= 55) return 'Steady';
    if (f >= 35) return 'Uneven';
    return 'Choppy';
  }
}

/// Presigned R2 PUT target returned by `POST /attempt/start`.
@freezed
class ReadingUpload with _$ReadingUpload {
  const factory ReadingUpload({
    required String url,
    @JsonKey(name: 'object_key') required String objectKey,
    @JsonKey(name: 'content_type') required String contentType,
  }) = _ReadingUpload;

  factory ReadingUpload.fromJson(Map<String, dynamic> j) =>
      _$ReadingUploadFromJson(j);
}

@freezed
class ReadingStartResponse with _$ReadingStartResponse {
  const factory ReadingStartResponse({
    required ReadingAttempt attempt,
    required ReadingUpload upload,
  }) = _ReadingStartResponse;

  factory ReadingStartResponse.fromJson(Map<String, dynamic> j) =>
      _$ReadingStartResponseFromJson(j);
}

/// The `reading_user_progress` row — programme-scoped XP/streak (§6.1.5).
@freezed
class ReadingProgress with _$ReadingProgress {
  const factory ReadingProgress({
    @JsonKey(name: 'total_xp') @Default(0) int totalXp,
    @JsonKey(name: 'current_streak_days') @Default(0) int currentStreakDays,
    @JsonKey(name: 'longest_streak_days') @Default(0) int longestStreakDays,
    @JsonKey(name: 'last_practiced_at') DateTime? lastPracticedAt,
    @JsonKey(name: 'total_attempts') @Default(0) int totalAttempts,
    @JsonKey(name: 'lessons_completed') @Default(0) int lessonsCompleted,
    @JsonKey(name: 'stages_completed') @Default(0) int stagesCompleted,
  }) = _ReadingProgress;

  factory ReadingProgress.fromJson(Map<String, dynamic> j) =>
      _$ReadingProgressFromJson(j);
}
