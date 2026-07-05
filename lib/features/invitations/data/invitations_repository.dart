import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/koras_api_client.dart';
import '../../../shared/models/enums.dart';

part 'invitations_repository.g.dart';

@riverpod
InvitationsRepository invitationsRepository(Ref ref) =>
    InvitationsRepository(ref.watch(korasApiClientProvider));

/// Invitations route through koras-api.
/// See `docs/MOBILE_API_ALIGNMENT_PLAN.md` §4.6.
class InvitationsRepository {
  InvitationsRepository(this._api);
  final KorasApiClient _api;

  String get _uid => _api.userId;

  /// Accept an invitation by token. Public route (no uid prefix).
  Future<void> accept(String token) async {
    await _api.apiPost('/invitations/accept', {'token': token});
  }

  /// Send invitation(s) (org-admin/manager).
  Future<void> send({
    required String email,
    required UserRole role,
    String? groupId,
  }) async {
    await _api.apiPost('/org/$_uid/invitations/send', {
      'emails': [email],
      'role': role.name,
      if (groupId != null) 'groupId': groupId,
    });
  }
}
