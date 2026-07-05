import 'package:json_annotation/json_annotation.dart';

/// Interview Prep enums (mirror of `interview-prep/types.ts`). See 15 / 27.

enum InterviewQuestionType {
  @JsonValue('general')
  general,
  @JsonValue('behavioral')
  behavioral,
  @JsonValue('role_specific')
  roleSpecific,
  @JsonValue('motivation')
  motivation,
  @JsonValue('strengths')
  strengths,
  @JsonValue('weakness')
  weakness,
  @JsonValue('teamwork')
  teamwork,
  @JsonValue('leadership')
  leadership,
  @JsonValue('scenario')
  scenario,
  @JsonValue('technical_project')
  technicalProject,
  @JsonValue('company_fit')
  companyFit,
}

enum InterviewFramework {
  @JsonValue('STAR')
  star,
  @JsonValue('present_past_proof_future')
  presentPastProofFuture,
  @JsonValue('point_reason_example')
  pointReasonExample,
}

enum InterviewType {
  @JsonValue('general')
  general,
  @JsonValue('internship')
  internship,
  @JsonValue('job')
  job,
  @JsonValue('university')
  university,
  @JsonValue('scholarship')
  scholarship,
  @JsonValue('leadership')
  leadership,
  @JsonValue('custom')
  custom,
}

enum InterviewExperienceLevel {
  @JsonValue('student')
  student,
  @JsonValue('entry_level')
  entryLevel,
  @JsonValue('mid_level')
  midLevel,
  @JsonValue('senior')
  senior,
}

enum InterviewRecordingUploadStatus {
  @JsonValue('none')
  none,
  @JsonValue('uploading')
  uploading,
  @JsonValue('uploaded')
  uploaded,
  @JsonValue('failed')
  failed,
  @JsonValue('skipped')
  skipped,
}

enum InterviewAnalysisStatus {
  @JsonValue('created')
  created,
  @JsonValue('queued')
  queued,
  @JsonValue('analyzing')
  analyzing,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
}

enum InterviewAttemptStatus {
  @JsonValue('started')
  started,
  @JsonValue('recorded')
  recorded,
  @JsonValue('submitted')
  submitted,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
}
