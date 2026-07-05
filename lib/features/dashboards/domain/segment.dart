import '../../../shared/models/enums.dart';

/// Client-side mirror of `public.get_user_segment()` (migration 0011). UI
/// convenience only — the authoritative access answer is the RLS-filtered
/// `program_access` rows (see 23).
ProgramSegment? deriveSegment({required UserRole role, String? orgType}) {
  if (role == UserRole.superAdmin) return null;
  if (role == UserRole.individual) return ProgramSegment.individual;
  return switch (orgType) {
    'school' || 'university' => ProgramSegment.students,
    'business' || 'other' => ProgramSegment.professionals,
    _ => null,
  };
}
