import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/supabase_service.dart';
import '../../../shared/models/app_group.dart';
import '../../../shared/models/app_profile.dart';
import '../../../shared/providers/current_profile.dart';

part 'org_repository.g.dart';

@riverpod
OrgRepository orgRepository(Ref ref) =>
    OrgRepository(ref.watch(supabaseProvider));

class OrgRepository {
  OrgRepository(this._sb);
  final SupabaseClient _sb;

  Future<List<AppProfile>> members(String orgId) async {
    try {
      final rows = await _sb
          .from('profiles')
          .select()
          .eq('org_id', orgId)
          .order('full_name');
      return (rows as List)
          .map((r) => AppProfile.fromJson(r as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  Future<List<AppGroup>> groups(String orgId) async {
    try {
      final rows =
          await _sb.from('groups').select().eq('org_id', orgId).order('name');
      return (rows as List)
          .map((r) => AppGroup.fromJson(r as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }
}

@riverpod
Future<List<AppProfile>> orgMembers(Ref ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  final orgId = profile?.orgId;
  if (orgId == null) return const [];
  return ref.watch(orgRepositoryProvider).members(orgId);
}

@riverpod
Future<List<AppGroup>> orgGroups(Ref ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  final orgId = profile?.orgId;
  if (orgId == null) return const [];
  return ref.watch(orgRepositoryProvider).groups(orgId);
}
