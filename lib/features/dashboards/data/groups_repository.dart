import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/supabase_service.dart';
import '../../../shared/models/app_group.dart';
import '../../../shared/models/app_profile.dart';
import '../../../shared/providers/current_profile.dart';

part 'groups_repository.g.dart';

@riverpod
GroupsRepository groupsRepository(Ref ref) =>
    GroupsRepository(ref.watch(supabaseProvider));

class GroupsRepository {
  GroupsRepository(this._sb);
  final SupabaseClient _sb;

  Future<AppGroup> create({
    required String orgId,
    required String name,
    String? description,
  }) async {
    try {
      final row = await _sb
          .from('groups')
          .insert({
            'org_id': orgId,
            'manager_id': _sb.auth.currentUser?.id,
            'name': name,
            if (description != null) 'description': description,
          })
          .select()
          .single();
      return AppGroup.fromJson(row);
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  Future<AppGroup?> byId(String id) async {
    try {
      final row = await _sb.from('groups').select().eq('id', id).maybeSingle();
      return row == null ? null : AppGroup.fromJson(row);
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  Future<List<AppProfile>> students(String groupId) async {
    try {
      final rows = await _sb
          .from('profiles')
          .select()
          .eq('group_id', groupId)
          .eq('role', 'org_member')
          .order('full_name');
      return (rows as List)
          .map((r) => AppProfile.fromJson(r as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }
}

@riverpod
Future<AppGroup?> groupById(Ref ref, String id) =>
    ref.watch(groupsRepositoryProvider).byId(id);

@riverpod
Future<List<AppProfile>> groupStudents(Ref ref, String groupId) =>
    ref.watch(groupsRepositoryProvider).students(groupId);

/// The current manager's org id, needed when creating a group.
@riverpod
Future<String?> currentOrgId(Ref ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  return profile?.orgId;
}
