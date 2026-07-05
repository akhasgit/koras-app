// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabularyWordImpl _$$VocabularyWordImplFromJson(Map<String, dynamic> json) =>
    _$VocabularyWordImpl(
      word: json['word'] as String,
      partOfSpeech: json['part_of_speech'] as String?,
      definition: json['definition'] as String?,
      ipa: json['ipa'] as String?,
      exampleSentence: json['example_sentence'] as String?,
      whyChosen: json['why_chosen'] as String?,
      cefr: json['cefr'] as String?,
      register: json['register'] as String?,
      difficulty: json['difficulty'] as String?,
    );

Map<String, dynamic> _$$VocabularyWordImplToJson(
        _$VocabularyWordImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'part_of_speech': instance.partOfSpeech,
      'definition': instance.definition,
      'ipa': instance.ipa,
      'example_sentence': instance.exampleSentence,
      'why_chosen': instance.whyChosen,
      'cefr': instance.cefr,
      'register': instance.register,
      'difficulty': instance.difficulty,
    };

_$VocabularyWordProgressImpl _$$VocabularyWordProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyWordProgressImpl(
      dailySetId: json['daily_set_id'] as String?,
      word: json['word'] as String,
      stage: json['stage'] as String? ?? 'learn',
      position: (json['position'] as num?)?.toInt(),
      masteredAt: json['mastered_at'] == null
          ? null
          : DateTime.parse(json['mastered_at'] as String),
    );

Map<String, dynamic> _$$VocabularyWordProgressImplToJson(
        _$VocabularyWordProgressImpl instance) =>
    <String, dynamic>{
      'daily_set_id': instance.dailySetId,
      'word': instance.word,
      'stage': instance.stage,
      'position': instance.position,
      'mastered_at': instance.masteredAt?.toIso8601String(),
    };

_$VocabularyDailySetImpl _$$VocabularyDailySetImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyDailySetImpl(
      id: json['id'] as String,
      setDate: json['set_date'] as String?,
      status: json['status'] as String?,
      words: (json['words'] as List<dynamic>?)
              ?.map((e) => VocabularyWord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      generatedAt: json['generated_at'] == null
          ? null
          : DateTime.parse(json['generated_at'] as String),
    );

Map<String, dynamic> _$$VocabularyDailySetImplToJson(
        _$VocabularyDailySetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'set_date': instance.setDate,
      'status': instance.status,
      'words': instance.words,
      'generated_at': instance.generatedAt?.toIso8601String(),
    };

_$VocabularyTodayResponseImpl _$$VocabularyTodayResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyTodayResponseImpl(
      dailySet:
          VocabularyDailySet.fromJson(json['set'] as Map<String, dynamic>),
      words: (json['words'] as List<dynamic>?)
              ?.map((e) => VocabularyWord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      progress: (json['progress'] as List<dynamic>?)
              ?.map((e) =>
                  VocabularyWordProgress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$VocabularyTodayResponseImplToJson(
        _$VocabularyTodayResponseImpl instance) =>
    <String, dynamic>{
      'set': instance.dailySet,
      'words': instance.words,
      'progress': instance.progress,
    };

_$VocabularyAttemptImpl _$$VocabularyAttemptImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyAttemptImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      dailySetId: json['daily_set_id'] as String?,
      word: json['word'] as String?,
      kind: json['kind'] as String,
      source: json['source'] as String?,
      attemptStatus: json['attempt_status'] as String?,
      analysisStatus: json['analysis_status'] as String?,
      analysisError: json['analysis_error'] as String?,
      recordingUploadStatus: json['recording_upload_status'] as String?,
      audioObjectKey: json['audio_object_key'] as String?,
      audioMimeType: json['audio_mime_type'] as String?,
      durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
      transcript: json['transcript'] as String?,
      scores: json['scores'] as Map<String, dynamic>?,
      metrics: json['metrics'] as Map<String, dynamic>?,
      analysis: json['analysis'] as Map<String, dynamic>?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$VocabularyAttemptImplToJson(
        _$VocabularyAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'daily_set_id': instance.dailySetId,
      'word': instance.word,
      'kind': instance.kind,
      'source': instance.source,
      'attempt_status': instance.attemptStatus,
      'analysis_status': instance.analysisStatus,
      'analysis_error': instance.analysisError,
      'recording_upload_status': instance.recordingUploadStatus,
      'audio_object_key': instance.audioObjectKey,
      'audio_mime_type': instance.audioMimeType,
      'duration_seconds': instance.durationSeconds,
      'transcript': instance.transcript,
      'scores': instance.scores,
      'metrics': instance.metrics,
      'analysis': instance.analysis,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$VocabularyUploadImpl _$$VocabularyUploadImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyUploadImpl(
      url: json['url'] as String,
      objectKey: json['object_key'] as String,
      contentType: json['content_type'] as String,
    );

Map<String, dynamic> _$$VocabularyUploadImplToJson(
        _$VocabularyUploadImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'object_key': instance.objectKey,
      'content_type': instance.contentType,
    };

_$VocabularyStartResponseImpl _$$VocabularyStartResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyStartResponseImpl(
      attempt:
          VocabularyAttempt.fromJson(json['attempt'] as Map<String, dynamic>),
      upload: VocabularyUpload.fromJson(json['upload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VocabularyStartResponseImplToJson(
        _$VocabularyStartResponseImpl instance) =>
    <String, dynamic>{
      'attempt': instance.attempt,
      'upload': instance.upload,
    };

_$VocabularyProgressSummaryImpl _$$VocabularyProgressSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyProgressSummaryImpl(
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      level: (json['level'] as num?)?.toInt() ?? 1,
      currentStreak: (json['current_streak'] as num?)?.toInt() ?? 0,
      bestStreak: (json['best_streak'] as num?)?.toInt() ?? 0,
      masteredCount: (json['mastered_count'] as num?)?.toInt() ?? 0,
      lastActiveDate: json['last_active_date'] as String?,
    );

Map<String, dynamic> _$$VocabularyProgressSummaryImplToJson(
        _$VocabularyProgressSummaryImpl instance) =>
    <String, dynamic>{
      'xp': instance.xp,
      'level': instance.level,
      'current_streak': instance.currentStreak,
      'best_streak': instance.bestStreak,
      'mastered_count': instance.masteredCount,
      'last_active_date': instance.lastActiveDate,
    };

_$VocabularyLibraryEntryImpl _$$VocabularyLibraryEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$VocabularyLibraryEntryImpl(
      word: json['word'] as String,
      wordData: json['word_data'] as Map<String, dynamic>?,
      status: json['status'] as String?,
      box: (json['box'] as num?)?.toInt(),
      nextReviewDate: json['next_review_date'] as String?,
      timesReviewed: (json['times_reviewed'] as num?)?.toInt() ?? 0,
      timesCorrect: (json['times_correct'] as num?)?.toInt() ?? 0,
      timesForgotten: (json['times_forgotten'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$VocabularyLibraryEntryImplToJson(
        _$VocabularyLibraryEntryImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'word_data': instance.wordData,
      'status': instance.status,
      'box': instance.box,
      'next_review_date': instance.nextReviewDate,
      'times_reviewed': instance.timesReviewed,
      'times_correct': instance.timesCorrect,
      'times_forgotten': instance.timesForgotten,
    };
