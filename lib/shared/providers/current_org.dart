import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/supabase_service.dart';
import '../models/app_organization.dart';
import 'current_profile.dart';

part 'current_org.g.dart';

/// The caller's organization (or null — most users have none). RLS: members
/// read their own org. See 06.
@Riverpod(keepAlive: true)
Future<AppOrganization?> currentOrg(Ref ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  if (profile?.orgId == null) return null;
  final row = await ref
      .watch(supabaseProvider)
      .from('organizations')
      .select()
      .eq('id', profile!.orgId!)
      .maybeSingle();
  return row == null ? null : AppOrganization.fromJson(row);
}
