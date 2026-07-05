import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/supabase_service.dart';
import '../models/app_group.dart';
import '../models/enums.dart';
import 'current_profile.dart';

part 'managed_groups.g.dart';

/// Groups a class manager owns. RLS: `manager_id = auth.uid()`. See 06 / 20.
@Riverpod(keepAlive: true)
Future<List<AppGroup>> managedGroups(Ref ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  if (profile?.role != UserRole.orgManager) return const [];
  final rows = await ref
      .watch(supabaseProvider)
      .from('groups')
      .select()
      .eq('manager_id', profile!.id)
      .order('name');
  return (rows as List)
      .map((r) => AppGroup.fromJson(r as Map<String, dynamic>))
      .toList();
}
