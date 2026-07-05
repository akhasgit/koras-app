import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/supabase_service.dart';
import '../../../shared/models/enums.dart';
import '../../../shared/providers/current_profile.dart';
import '../domain/program_catalog.dart';

part 'program_access_providers.g.dart';

/// Whether the caller may enter [programId]. super_admin / test accounts see
/// everything; otherwise RLS on `program_access` does the filtering. See 23.
@riverpod
Future<bool> hasProgramAccess(Ref ref, String programId) async {
  final profile = await ref.watch(currentProfileProvider.future);
  if (profile == null) return false;
  if (profile.role == UserRole.superAdmin || profile.isTestAccount) return true;
  final row = await ref
      .watch(supabaseProvider)
      .from('program_access')
      .select('program_id')
      .eq('program_id', programId)
      .limit(1)
      .maybeSingle();
  return row != null;
}

@riverpod
Future<Set<String>> accessibleProgramIds(Ref ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  if (profile == null) return const {};
  if (profile.role == UserRole.superAdmin || profile.isTestAccount) {
    return kPrograms.map((p) => p.id).toSet();
  }
  final rows = await ref
      .watch(supabaseProvider)
      .from('program_access')
      .select('program_id');
  return (rows as List).map((r) => r['program_id'] as String).toSet();
}
