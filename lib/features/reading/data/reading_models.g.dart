// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReadingProfileImpl _$$ReadingProfileImplFromJson(Map<String, dynamic> json) =>
    _$ReadingProfileImpl(
      userId: json['user_id'] as String?,
      intent: json['intent'] as String?,
      goals:
          (json['goals'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      persona: json['persona'] as String,
      gradeLevel: (json['grade_level'] as num?)?.toInt(),
      calibrationAttemptId: json['calibration_attempt_id'] as String?,
    );

Map<String, dynamic> _$$ReadingProfileImplToJson(
        _$ReadingProfileImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'intent': instance.intent,
      'goals': instance.goals,
      'persona': instance.persona,
      'grade_level': instance.gradeLevel,
      'calibration_attempt_id': instance.calibrationAttemptId,
    };

_$ReadingIntakeDefaultsImpl _$$ReadingIntakeDefaultsImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadingIntakeDefaultsImpl(
      intent: json['intent'] as String?,
      goals:
          (json['goals'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      persona: json['persona'] as String?,
      gradeLevel: (json['gradeLevel'] as num?)?.toInt(),
      hasBaseline: json['hasBaseline'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReadingIntakeDefaultsImplToJson(
        _$ReadingIntakeDefaultsImpl instance) =>
    <String, dynamic>{
      'intent': instance.intent,
      'goals': instance.goals,
      'persona': instance.persona,
      'gradeLevel': instance.gradeLevel,
      'hasBaseline': instance.hasBaseline,
    };

_$ReadingStageSummaryImpl _$$ReadingStageSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadingStageSummaryImpl(
      id: json['id'] as String,
      position: (json['position'] as num).toInt(),
      title: json['title'] as String,
      theme: json['theme'] as String?,
      focusAreas: (json['focus_areas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: json['status'] as String? ?? 'locked',
      generationError: json['generation_error'] as String?,
    );

Map<String, dynamic> _$$ReadingStageSummaryImplToJson(
        _$ReadingStageSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'title': instance.title,
      'theme': instance.theme,
      'focus_areas': instance.focusAreas,
      'status': instance.status,
      'generation_error': instance.generationError,
    };

_$ReadingProgramImpl _$$ReadingProgramImplFromJson(Map<String, dynamic> json) =>
    _$ReadingProgramImpl(
      id: json['id'] as String,
      status: json['status'] as String? ?? 'generating',
      generationError: json['generation_error'] as String?,
      stages: (json['stages'] as List<dynamic>?)
              ?.map((e) =>
                  ReadingStageSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReadingProgramImplToJson(
        _$ReadingProgramImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'generation_error': instance.generationError,
      'stages': instance.stages,
    };

_$ReadingStepImpl _$$ReadingStepImplFromJson(Map<String, dynamic> json) =>
    _$ReadingStepImpl(
      stepId: json['step_id'] as String,
      type: json['type'] as String? ?? 'free_read',
      title: json['title'] as String?,
      xp: (json['xp'] as num?)?.toInt() ?? 6,
      passage: json['passage'] as String?,
      sentence: json['sentence'] as String?,
      guideWpm: (json['guide_wpm'] as num?)?.toInt(),
      targetNotes: json['target_notes'] as String?,
    );

Map<String, dynamic> _$$ReadingStepImplToJson(_$ReadingStepImpl instance) =>
    <String, dynamic>{
      'step_id': instance.stepId,
      'type': instance.type,
      'title': instance.title,
      'xp': instance.xp,
      'passage': instance.passage,
      'sentence': instance.sentence,
      'guide_wpm': instance.guideWpm,
      'target_notes': instance.targetNotes,
    };

_$ReadingLessonImpl _$$ReadingLessonImplFromJson(Map<String, dynamic> json) =>
    _$ReadingLessonImpl(
      lessonId: json['lesson_id'] as String,
      title: json['title'] as String?,
      focus: json['focus'] as String?,
      estimatedMin: (json['estimated_min'] as num?)?.toInt(),
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      steps: (json['steps'] as List<dynamic>?)
              ?.map((e) => ReadingStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReadingLessonImplToJson(_$ReadingLessonImpl instance) =>
    <String, dynamic>{
      'lesson_id': instance.lessonId,
      'title': instance.title,
      'focus': instance.focus,
      'estimated_min': instance.estimatedMin,
      'xp': instance.xp,
      'steps': instance.steps,
    };

_$ReadingLessonProgressImpl _$$ReadingLessonProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadingLessonProgressImpl(
      lessonId: json['lesson_id'] as String,
      completedStepIds: (json['completed_step_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: json['status'] as String? ?? 'in_progress',
      bestScores: json['best_scores'] as Map<String, dynamic>?,
      xp: (json['xp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ReadingLessonProgressImplToJson(
        _$ReadingLessonProgressImpl instance) =>
    <String, dynamic>{
      'lesson_id': instance.lessonId,
      'completed_step_ids': instance.completedStepIds,
      'status': instance.status,
      'best_scores': instance.bestScores,
      'xp': instance.xp,
    };

_$ReadingStageImpl _$$ReadingStageImplFromJson(Map<String, dynamic> json) =>
    _$ReadingStageImpl(
      id: json['id'] as String,
      position: (json['position'] as num).toInt(),
      title: json['title'] as String,
      theme: json['theme'] as String?,
      focusAreas: (json['focus_areas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: json['status'] as String? ?? 'locked',
      generationError: json['generation_error'] as String?,
      lessons: (json['lessons'] as List<dynamic>?)
              ?.map((e) => ReadingLesson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      targetVocab: (json['target_vocab'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      progress: (json['progress'] as List<dynamic>?)
              ?.map((e) =>
                  ReadingLessonProgress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReadingStageImplToJson(_$ReadingStageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'title': instance.title,
      'theme': instance.theme,
      'focus_areas': instance.focusAreas,
      'status': instance.status,
      'generation_error': instance.generationError,
      'lessons': instance.lessons,
      'target_vocab': instance.targetVocab,
      'progress': instance.progress,
    };

_$ReadingWordFeedbackImpl _$$ReadingWordFeedbackImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadingWordFeedbackImpl(
      word: json['word'] as String,
      index: (json['index'] as num).toInt(),
      status: json['status'] as String? ?? 'correct',
      heard: json['heard'] as String?,
      pauseBeforeMs: (json['pause_before_ms'] as num?)?.toInt(),
      hesitation: json['hesitation'] as bool? ?? false,
    );

Map<String, dynamic> _$$ReadingWordFeedbackImplToJson(
        _$ReadingWordFeedbackImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'index': instance.index,
      'status': instance.status,
      'heard': instance.heard,
      'pause_before_ms': instance.pauseBeforeMs,
      'hesitation': instance.hesitation,
    };

_$ReadingAttemptImpl _$$ReadingAttemptImplFromJson(Map<String, dynamic> json) =>
    _$ReadingAttemptImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      programId: json['program_id'] as String?,
      stageId: json['stage_id'] as String?,
      lessonId: json['lesson_id'] as String?,
      stepId: json['step_id'] as String?,
      attemptType: json['attempt_type'] as String? ?? 'free_read',
      passageText: json['passage_text'] as String?,
      guideWpm: (json['guide_wpm'] as num?)?.toInt(),
      recordingUploadStatus: json['recording_upload_status'] as String?,
      attemptStatus: json['attempt_status'] as String?,
      analysisStatus: json['analysis_status'] as String?,
      analysisError: json['analysis_error'] as String?,
      transcript: json['transcript'] as String?,
      matchPct: (json['match_pct'] as num?)?.toInt(),
      hesitanceScore: (json['hesitance_score'] as num?)?.toInt(),
      paceScore: (json['pace_score'] as num?)?.toInt(),
      flowScore: (json['flow_score'] as num?)?.toInt(),
      overallScore: (json['overall_score'] as num?)?.toInt(),
      paceDeltaPct: (json['pace_delta_pct'] as num?)?.toInt(),
      wordFeedback: (json['word_feedback'] as List<dynamic>?)
              ?.map((e) =>
                  ReadingWordFeedback.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      analysis: json['analysis'] as Map<String, dynamic>?,
      durationSeconds: json['duration_seconds'] as num?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ReadingAttemptImplToJson(
        _$ReadingAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'program_id': instance.programId,
      'stage_id': instance.stageId,
      'lesson_id': instance.lessonId,
      'step_id': instance.stepId,
      'attempt_type': instance.attemptType,
      'passage_text': instance.passageText,
      'guide_wpm': instance.guideWpm,
      'recording_upload_status': instance.recordingUploadStatus,
      'attempt_status': instance.attemptStatus,
      'analysis_status': instance.analysisStatus,
      'analysis_error': instance.analysisError,
      'transcript': instance.transcript,
      'match_pct': instance.matchPct,
      'hesitance_score': instance.hesitanceScore,
      'pace_score': instance.paceScore,
      'flow_score': instance.flowScore,
      'overall_score': instance.overallScore,
      'pace_delta_pct': instance.paceDeltaPct,
      'word_feedback': instance.wordFeedback,
      'analysis': instance.analysis,
      'duration_seconds': instance.durationSeconds,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$ReadingUploadImpl _$$ReadingUploadImplFromJson(Map<String, dynamic> json) =>
    _$ReadingUploadImpl(
      url: json['url'] as String,
      objectKey: json['object_key'] as String,
      contentType: json['content_type'] as String,
    );

Map<String, dynamic> _$$ReadingUploadImplToJson(_$ReadingUploadImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'object_key': instance.objectKey,
      'content_type': instance.contentType,
    };

_$ReadingStartResponseImpl _$$ReadingStartResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadingStartResponseImpl(
      attempt: ReadingAttempt.fromJson(json['attempt'] as Map<String, dynamic>),
      upload: ReadingUpload.fromJson(json['upload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReadingStartResponseImplToJson(
        _$ReadingStartResponseImpl instance) =>
    <String, dynamic>{
      'attempt': instance.attempt,
      'upload': instance.upload,
    };

_$ReadingProgressImpl _$$ReadingProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$ReadingProgressImpl(
      totalXp: (json['total_xp'] as num?)?.toInt() ?? 0,
      currentStreakDays: (json['current_streak_days'] as num?)?.toInt() ?? 0,
      longestStreakDays: (json['longest_streak_days'] as num?)?.toInt() ?? 0,
      lastPracticedAt: json['last_practiced_at'] == null
          ? null
          : DateTime.parse(json['last_practiced_at'] as String),
      totalAttempts: (json['total_attempts'] as num?)?.toInt() ?? 0,
      lessonsCompleted: (json['lessons_completed'] as num?)?.toInt() ?? 0,
      stagesCompleted: (json['stages_completed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ReadingProgressImplToJson(
        _$ReadingProgressImpl instance) =>
    <String, dynamic>{
      'total_xp': instance.totalXp,
      'current_streak_days': instance.currentStreakDays,
      'longest_streak_days': instance.longestStreakDays,
      'last_practiced_at': instance.lastPracticedAt?.toIso8601String(),
      'total_attempts': instance.totalAttempts,
      'lessons_completed': instance.lessonsCompleted,
      'stages_completed': instance.stagesCompleted,
    };
