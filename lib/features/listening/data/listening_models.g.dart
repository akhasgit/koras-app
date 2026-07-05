// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListeningQuestionOptionImpl _$$ListeningQuestionOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningQuestionOptionImpl(
      id: json['id'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$ListeningQuestionOptionImplToJson(
        _$ListeningQuestionOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

_$ListeningQuestionImpl _$$ListeningQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningQuestionImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      prompt: json['prompt'] as String,
      targetSkill: json['targetSkill'] as String?,
      segmentIndex: (json['segmentIndex'] as num?)?.toInt(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) =>
              ListeningQuestionOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctOptionId: json['correctOptionId'] as String?,
      expectedPoints: (json['expectedPoints'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sampleStrongAnswer: json['sampleStrongAnswer'] as String?,
    );

Map<String, dynamic> _$$ListeningQuestionImplToJson(
        _$ListeningQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'prompt': instance.prompt,
      'targetSkill': instance.targetSkill,
      'segmentIndex': instance.segmentIndex,
      'options': instance.options,
      'correctOptionId': instance.correctOptionId,
      'expectedPoints': instance.expectedPoints,
      'sampleStrongAnswer': instance.sampleStrongAnswer,
    };

_$ListeningSegmentImpl _$$ListeningSegmentImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningSegmentImpl(
      index: (json['index'] as num).toInt(),
      text: json['text'] as String,
      maxReplays: (json['maxReplays'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ListeningSegmentImplToJson(
        _$ListeningSegmentImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'text': instance.text,
      'maxReplays': instance.maxReplays,
    };

_$ListeningPassageImpl _$$ListeningPassageImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningPassageImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      topic: json['topic'] as String?,
      difficulty: (json['difficulty'] as num).toInt(),
      deliveryMode: json['deliveryMode'] as String?,
      language: json['language'] as String?,
      voice: json['voice'] as String?,
      estimatedMinutes: json['estimatedMinutes'] as num?,
      fullText: json['fullText'] as String?,
      maxReplays: (json['maxReplays'] as num?)?.toInt(),
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => ListeningSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      questions: (json['questions'] as List<dynamic>?)
              ?.map(
                  (e) => ListeningQuestion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ListeningPassageImplToJson(
        _$ListeningPassageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'topic': instance.topic,
      'difficulty': instance.difficulty,
      'deliveryMode': instance.deliveryMode,
      'language': instance.language,
      'voice': instance.voice,
      'estimatedMinutes': instance.estimatedMinutes,
      'fullText': instance.fullText,
      'maxReplays': instance.maxReplays,
      'segments': instance.segments,
      'questions': instance.questions,
    };

_$ListeningPassageProgressImpl _$$ListeningPassageProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningPassageProgressImpl(
      passageId: json['passage_id'] as String?,
      attempts: (json['attempts'] as num?)?.toInt() ?? 0,
      bestScore: (json['best_score'] as num?)?.toInt(),
      lastAttemptAt: json['last_attempt_at'] == null
          ? null
          : DateTime.parse(json['last_attempt_at'] as String),
      lastStatus: json['last_status'] as String?,
    );

Map<String, dynamic> _$$ListeningPassageProgressImplToJson(
        _$ListeningPassageProgressImpl instance) =>
    <String, dynamic>{
      'passage_id': instance.passageId,
      'attempts': instance.attempts,
      'best_score': instance.bestScore,
      'last_attempt_at': instance.lastAttemptAt?.toIso8601String(),
      'last_status': instance.lastStatus,
    };

_$ListeningPassagesResponseImpl _$$ListeningPassagesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningPassagesResponseImpl(
      passages: (json['passages'] as List<dynamic>?)
              ?.map((e) => ListeningPassage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      progressByPassage: (json['progress_by_passage'] as Map<String, dynamic>?)
              ?.map(
            (k, e) => MapEntry(k,
                ListeningPassageProgress.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      weakestSkills: (json['weakest_skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      userProgress: json['user_progress'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ListeningPassagesResponseImplToJson(
        _$ListeningPassagesResponseImpl instance) =>
    <String, dynamic>{
      'passages': instance.passages,
      'progress_by_passage': instance.progressByPassage,
      'weakest_skills': instance.weakestSkills,
      'user_progress': instance.userProgress,
    };

_$ListeningAttemptImpl _$$ListeningAttemptImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningAttemptImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      passageId: json['passage_id'] as String?,
      difficulty: (json['difficulty'] as num?)?.toInt(),
      deliveryMode: json['delivery_mode'] as String?,
      playbackSpeed: json['playback_speed'] as num?,
      replayCount: (json['replay_count'] as num?)?.toInt(),
      status: json['status'] as String?,
      overallScore: (json['overall_score'] as num?)?.toInt(),
      skillBreakdown: json['skill_breakdown'] as Map<String, dynamic>?,
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$$ListeningAttemptImplToJson(
        _$ListeningAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'passage_id': instance.passageId,
      'difficulty': instance.difficulty,
      'delivery_mode': instance.deliveryMode,
      'playback_speed': instance.playbackSpeed,
      'replay_count': instance.replayCount,
      'status': instance.status,
      'overall_score': instance.overallScore,
      'skill_breakdown': instance.skillBreakdown,
      'completed_at': instance.completedAt?.toIso8601String(),
    };

_$ListeningAnswerImpl _$$ListeningAnswerImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningAnswerImpl(
      id: json['id'] as String?,
      attemptId: json['attempt_id'] as String?,
      questionId: json['question_id'] as String?,
      questionType: json['question_type'] as String?,
      targetSkill: json['target_skill'] as String?,
      selectedOptionId: json['selected_option_id'] as String?,
      isCorrect: json['is_correct'] as bool?,
      transcript: json['transcript'] as String?,
      score: (json['score'] as num?)?.toInt(),
      analysis: json['analysis'] as Map<String, dynamic>?,
      recordingR2Key: json['recording_r2_key'] as String?,
    );

Map<String, dynamic> _$$ListeningAnswerImplToJson(
        _$ListeningAnswerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attempt_id': instance.attemptId,
      'question_id': instance.questionId,
      'question_type': instance.questionType,
      'target_skill': instance.targetSkill,
      'selected_option_id': instance.selectedOptionId,
      'is_correct': instance.isCorrect,
      'transcript': instance.transcript,
      'score': instance.score,
      'analysis': instance.analysis,
      'recording_r2_key': instance.recordingR2Key,
    };

_$ListeningVoiceUploadImpl _$$ListeningVoiceUploadImplFromJson(
        Map<String, dynamic> json) =>
    _$ListeningVoiceUploadImpl(
      url: json['url'] as String,
      objectKey: json['object_key'] as String,
      contentType: json['content_type'] as String,
    );

Map<String, dynamic> _$$ListeningVoiceUploadImplToJson(
        _$ListeningVoiceUploadImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'object_key': instance.objectKey,
      'content_type': instance.contentType,
    };
