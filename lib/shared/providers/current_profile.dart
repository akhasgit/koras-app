import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/domain/auth_session.dart';
import '../../services/supabase_service.dart';
import '../models/app_profile.dart';

part 'current_profile.g.dart';

/// The single profile read shared by the router redirect, the shell, and every
/// role check — one round-trip at sign-in serves all of them. See 05.
@Riverpod(keepAlive: true)
Future<AppProfile?> currentProfile(Ref ref) async {
  final session = ref.watch(authSessionProvider);
  if (session == null) return null;
  final row = await ref
      .watch(supabaseProvider)
      .from('profiles')
      .select('id, email, full_name, avatar_url, role, org_id, group_id, '
          'role_title, onboarding_completed, is_test_account')
      .eq('id', session.user.id)
      .maybeSingle();
  return row == null ? null : AppProfile.fromJson(row);
}
