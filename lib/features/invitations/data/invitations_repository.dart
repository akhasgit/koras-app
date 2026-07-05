import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/supabase_service.dart';
import '../../../shared/models/enums.dart';

part 'invitations_repository.g.dart';

@riverpod
InvitationsRepository invitationsRepository(Ref ref) =>
    InvitationsRepository(ref.watch(supabaseProvider));

/// Invitations go through edge functions (cross-email reads need `service_role`).
/// See 06 / 08.
class InvitationsRepository {
  InvitationsRepository(this._sb);
  final SupabaseClient _sb;

  /// Accept an invitation by token. 404 = expired/used, 403 = email mismatch.
  Future<void> accept(String token) async {
    final res = await _sb.functions
        .invoke('invitations-accept', body: {'token': token});
    if (res.status != 200) throw mapEdgeError(res);
  }

  /// Send an invitation (org-admin/manager). Returns the invitation id.
  Future<String> send({
    required String email,
    required UserRole role,
    String? groupId,
  }) async {
    final res = await _sb.functions.invoke('invitations-send', body: {
      'email': email,
      'role': role.name,
      if (groupId != null) 'groupId': groupId,
    });
    if (res.status != 200) throw mapEdgeError(res);
    return (res.data as Map)['invitationId'] as String;
  }
}
