import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/supabase_service.dart';
import '../../../shared/models/app_group.dart';
import '../../../shared/models/enums.dart';
import '../../../shared/providers/current_profile.dart';

part 'auth_guards.g.dart';

/// Learner = `individual` | `org_member` (gets a Daily Lesson Plan +
/// per-program progress). Mirror of `isLearnerRole()`.
bool isLearnerRole(UserRole? role) =>
    role == UserRole.individual || role == UserRole.orgMember;

/// Staff = teachers + admins. Mirror of `isStaffRole()`.
bool isStaffRole(UserRole? role) =>
    role == UserRole.orgManager ||
    role == UserRole.orgAdmin ||
    role == UserRole.superAdmin;

@riverpod
bool isLearner(Ref ref) =>
    isLearnerRole(ref.watch(currentProfileProvider).valueOrNull?.role);

@riverpod
bool isSuperAdmin(Ref ref) =>
    ref.watch(currentProfileProvider).valueOrNull?.role == UserRole.superAdmin;

/// Ports `teacher.ts`: caller must be an `org_manager` and own the group.
/// RLS enforces this server-side too; this gates UI + a clean forbidden state.
@riverpod
Future<AppGroup> requireOwnedGroup(Ref ref, String groupId) async {
  final profile = await ref.watch(currentProfileProvider.future);
  if (profile?.role != UserRole.orgManager) {
    throw const PermissionError('Not a class manager');
  }
  final row = await ref
      .watch(supabaseProvider)
      .from('groups')
      .select('id, org_id, manager_id, name, description, created_at')
      .eq('id', groupId)
      .eq('manager_id', profile!.id)
      .maybeSingle();
  if (row == null) {
    throw const PermissionError('You don\'t manage this group');
  }
  return AppGroup.fromJson(row);
}
