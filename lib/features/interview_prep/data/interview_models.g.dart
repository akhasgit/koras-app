// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InterviewScenarioImpl _$$InterviewScenarioImplFromJson(
        Map<String, dynamic> json) =>
    _$InterviewScenarioImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      title: json['title'] as String,
      jobRole: json['job_role'] as String?,
      company: json['company'] as String?,
      interviewType:
          $enumDecodeNullable(_$InterviewTypeEnumMap, json['interview_type']),
      experienceLevel: $enumDecodeNullable(
          _$InterviewExperienceLevelEnumMap, json['experience_level']),
      jobDescription: json['job_description'] as String?,
      isDefault: json['is_default'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$InterviewScenarioImplToJson(
        _$InterviewScenarioImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'job_role': instance.jobRole,
      'company': instance.company,
      'interview_type': _$InterviewTypeEnumMap[instance.interviewType],
      'experience_level':
          _$InterviewExperienceLevelEnumMap[instance.experienceLevel],
      'job_description': instance.jobDescription,
      'is_default': instance.isDefault,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$InterviewTypeEnumMap = {
  InterviewType.general: 'general',
  InterviewType.internship: 'internship',
  InterviewType.job: 'job',
  InterviewType.university: 'university',
  InterviewType.scholarship: 'scholarship',
  InterviewType.leadership: 'leadership',
  InterviewType.custom: 'custom',
};

const _$InterviewExperienceLevelEnumMap = {
  InterviewExperienceLevel.student: 'student',
  InterviewExperienceLevel.entryLevel: 'entry_level',
  InterviewExperienceLevel.midLevel: 'mid_level',
  InterviewExperienceLevel.senior: 'senior',
};

_$InterviewQuestionImpl _$$InterviewQuestionImplFromJson(
        Map<String, dynamic> json) =>
    _$InterviewQuestionImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      questionType: $enumDecodeNullable(
          _$InterviewQuestionTypeEnumMap, json['question_type']),
      framework:
          $enumDecodeNullable(_$InterviewFrameworkEnumMap, json['framework']),
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$$InterviewQuestionImplToJson(
        _$InterviewQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'question_type': _$InterviewQuestionTypeEnumMap[instance.questionType],
      'framework': _$InterviewFrameworkEnumMap[instance.framework],
      'hint': instance.hint,
    };

const _$InterviewQuestionTypeEnumMap = {
  InterviewQuestionType.general: 'general',
  InterviewQuestionType.behavioral: 'behavioral',
  InterviewQuestionType.roleSpecific: 'role_specific',
  InterviewQuestionType.motivation: 'motivation',
  InterviewQuestionType.strengths: 'strengths',
  InterviewQuestionType.weakness: 'weakness',
  InterviewQuestionType.teamwork: 'teamwork',
  InterviewQuestionType.leadership: 'leadership',
  InterviewQuestionType.scenario: 'scenario',
  InterviewQuestionType.technicalProject: 'technical_project',
  InterviewQuestionType.companyFit: 'company_fit',
};

const _$InterviewFrameworkEnumMap = {
  InterviewFramework.star: 'STAR',
  InterviewFramework.presentPastProofFuture: 'present_past_proof_future',
  InterviewFramework.pointReasonExample: 'point_reason_example',
};

_$InterviewScoresImpl _$$InterviewScoresImplFromJson(
        Map<String, dynamic> json) =>
    _$InterviewScoresImpl(
      overall: (json['overall'] as num?)?.toInt() ?? 0,
      delivery: (json['delivery'] as num?)?.toInt() ?? 0,
      relevance: (json['relevance'] as num?)?.toInt() ?? 0,
      structure: (json['structure'] as num?)?.toInt() ?? 0,
      specificity: (json['specificity'] as num?)?.toInt() ?? 0,
      confidence: (json['confidence'] as num?)?.toInt() ?? 0,
      fluency: (json['fluency'] as num?)?.toInt() ?? 0,
      grammar: (json['grammar'] as num?)?.toInt() ?? 0,
      conciseness: (json['conciseness'] as num?)?.toInt() ?? 0,
      professionalism: (json['professionalism'] as num?)?.toInt() ?? 0,
      star: (json['star'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InterviewScoresImplToJson(
        _$InterviewScoresImpl instance) =>
    <String, dynamic>{
      'overall': instance.overall,
      'delivery': instance.delivery,
      'relevance': instance.relevance,
      'structure': instance.structure,
      'specificity': instance.specificity,
      'confidence': instance.confidence,
      'fluency': instance.fluency,
      'grammar': instance.grammar,
      'conciseness': instance.conciseness,
      'professionalism': instance.professionalism,
      'star': instance.star,
    };

_$InterviewAttemptImpl _$$InterviewAttemptImplFromJson(
        Map<String, dynamic> json) =>
    _$InterviewAttemptImpl(
      id: json['id'] as String,
      questionId: json['question_id'] as String?,
      recordingUploadStatus: $enumDecodeNullable(
              _$InterviewRecordingUploadStatusEnumMap,
              json['recording_upload_status']) ??
          InterviewRecordingUploadStatus.none,
      analysisStatus: $enumDecodeNullable(
              _$InterviewAnalysisStatusEnumMap, json['analysis_status']) ??
          InterviewAnalysisStatus.created,
      attemptStatus: $enumDecodeNullable(
              _$InterviewAttemptStatusEnumMap, json['attempt_status']) ??
          InterviewAttemptStatus.started,
      overallScore: (json['overall_score'] as num?)?.toInt(),
      transcript: json['transcript'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$InterviewAttemptImplToJson(
        _$InterviewAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'recording_upload_status': _$InterviewRecordingUploadStatusEnumMap[
          instance.recordingUploadStatus]!,
      'analysis_status':
          _$InterviewAnalysisStatusEnumMap[instance.analysisStatus]!,
      'attempt_status':
          _$InterviewAttemptStatusEnumMap[instance.attemptStatus]!,
      'overall_score': instance.overallScore,
      'transcript': instance.transcript,
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$InterviewRecordingUploadStatusEnumMap = {
  InterviewRecordingUploadStatus.none: 'none',
  InterviewRecordingUploadStatus.uploading: 'uploading',
  InterviewRecordingUploadStatus.uploaded: 'uploaded',
  InterviewRecordingUploadStatus.failed: 'failed',
  InterviewRecordingUploadStatus.skipped: 'skipped',
};

const _$InterviewAnalysisStatusEnumMap = {
  InterviewAnalysisStatus.created: 'created',
  InterviewAnalysisStatus.queued: 'queued',
  InterviewAnalysisStatus.analyzing: 'analyzing',
  InterviewAnalysisStatus.completed: 'completed',
  InterviewAnalysisStatus.failed: 'failed',
};

const _$InterviewAttemptStatusEnumMap = {
  InterviewAttemptStatus.started: 'started',
  InterviewAttemptStatus.recorded: 'recorded',
  InterviewAttemptStatus.submitted: 'submitted',
  InterviewAttemptStatus.completed: 'completed',
  InterviewAttemptStatus.failed: 'failed',
};

_$InterviewPracticeSessionStateImpl
    _$$InterviewPracticeSessionStateImplFromJson(Map<String, dynamic> json) =>
        _$InterviewPracticeSessionStateImpl(
          scenarioId: json['scenarioId'] as String,
          practiceSessionId: json['practiceSessionId'] as String,
          currentQuestionIndex:
              (json['currentQuestionIndex'] as num?)?.toInt() ?? 0,
          answeredQuestionIds: (json['answeredQuestionIds'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
          attemptIdsByQuestionId:
              (json['attemptIdsByQuestionId'] as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as String),
                  ) ??
                  const {},
          updatedAt: json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
        );

Map<String, dynamic> _$$InterviewPracticeSessionStateImplToJson(
        _$InterviewPracticeSessionStateImpl instance) =>
    <String, dynamic>{
      'scenarioId': instance.scenarioId,
      'practiceSessionId': instance.practiceSessionId,
      'currentQuestionIndex': instance.currentQuestionIndex,
      'answeredQuestionIds': instance.answeredQuestionIds,
      'attemptIdsByQuestionId': instance.attemptIdsByQuestionId,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
