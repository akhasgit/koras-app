import 'package:json_annotation/json_annotation.dart';

/// Canonical enum catalogue — the single source of truth shared across features.
/// Mirrors Postgres enums / constrained columns (migrations 0001–0016).
/// Feature-specific enums (AI Tutor, IELTS, Interview Prep) live in their
/// feature `domain/` folders. See `all_docs/mobile/27-glossary-and-conventions.md`.

// ── Identity & tenancy ──────────────────────────────────────────────────────

enum UserRole {
  @JsonValue('individual')
  individual,
  @JsonValue('org_admin')
  orgAdmin,
  @JsonValue('org_manager')
  orgManager,
  @JsonValue('org_member')
  orgMember,
  @JsonValue('super_admin')
  superAdmin,
}

enum OrgType {
  @JsonValue('school')
  school,
  @JsonValue('university')
  university,
  @JsonValue('business')
  business,
  @JsonValue('other')
  other,
}

enum OrgStatus {
  @JsonValue('active')
  active,
  @JsonValue('pending')
  pending,
  @JsonValue('suspended')
  suspended,
}

enum InvitationStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('revoked')
  revoked,
  @JsonValue('expired')
  expired,
}

/// Derived client-side to mirror `get_user_segment()`; access is decided by RLS
/// rows (see 23), this only mirrors the segment for catalogue display.
enum ProgramSegment {
  @JsonValue('individual')
  individual,
  @JsonValue('students')
  students,
  @JsonValue('professionals')
  professionals,
}

/// UI-only persona used to pick nav tabs (see 20). NOT a DB column — computed,
/// never serialized, so no `@JsonValue`.
enum NormalizedDashboardRole {
  individual,
  student,
  teacher,
  schoolAdmin,
  orgMember,
  orgAdmin,
}

// ── Programs & access ───────────────────────────────────────────────────────

enum ProgramStatus {
  @JsonValue('live')
  live,
  @JsonValue('incoming')
  incoming,
}

// ── Daily lesson plan (0016) ────────────────────────────────────────────────

enum DailyPlanStatus {
  @JsonValue('active')
  active,
  @JsonValue('superseded')
  superseded,
  @JsonValue('archived')
  archived,
}

enum DailyPlanItemType {
  @JsonValue('program_session')
  programSession,
  @JsonValue('review')
  review,
  @JsonValue('reflection')
  reflection,
  @JsonValue('streak_save')
  streakSave,
}

enum DailyPlanItemStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('skipped')
  skipped,
}

enum DailyPlanGenerationSource {
  @JsonValue('lazy_dashboard')
  lazyDashboard,
  @JsonValue('manual_regenerate')
  manualRegenerate,
  @JsonValue('admin_test')
  adminTest,
  @JsonValue('scheduled_future')
  scheduledFuture,
}

// ── Learner insights (0012) ─────────────────────────────────────────────────

enum ScoreTrend {
  @JsonValue('improving')
  improving,
  @JsonValue('stable')
  stable,
  @JsonValue('declining')
  declining,
}

// ── Onboarding (onboarding-config.ts) ───────────────────────────────────────

enum OnboardingGoal {
  @JsonValue('build_confidence')
  buildConfidence,
  @JsonValue('reduce_accent')
  reduceAccent,
  @JsonValue('interview_prep')
  interviewPrep,
  @JsonValue('presentations')
  presentations,
  @JsonValue('creator')
  creator,
  @JsonValue('other')
  other,
}

enum OnboardingBackground {
  @JsonValue('native_english')
  nativeEnglish,
  @JsonValue('esl_advanced')
  eslAdvanced,
  @JsonValue('esl_intermediate')
  eslIntermediate,
  @JsonValue('student')
  student,
  @JsonValue('professional')
  professional,
}

enum OnboardingChallenge {
  @JsonValue('fillers')
  fillers,
  @JsonValue('pace')
  pace,
  @JsonValue('clarity')
  clarity,
  @JsonValue('confidence')
  confidence,
  @JsonValue('monotone')
  monotone,
  @JsonValue('accent')
  accent,
}

enum OnboardingInterestedProgram {
  @JsonValue('exam_prep')
  examPrep,
  @JsonValue('interview_prep')
  interviewPrep,
  @JsonValue('public_speaking')
  publicSpeaking,
  @JsonValue('speech_recovery')
  speechRecovery,
  @JsonValue('creators')
  creators,
  @JsonValue('accent_reduction')
  accentReduction,
  @JsonValue('not_sure')
  notSure,
}
