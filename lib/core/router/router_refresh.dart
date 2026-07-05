import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/domain/auth_session.dart';
import '../../shared/providers/current_org_status.dart';
import '../../shared/providers/current_profile.dart';

part 'router_refresh.g.dart';

/// Bridges Riverpod auth/profile/org state to go_router's `refreshListenable`.
/// Re-runs `_topLevelRedirect` whenever any of these change. See 04.
@Riverpod(keepAlive: true)
class RouterRefresh extends _$RouterRefresh with ChangeNotifier {
  @override
  void build() {
    ref.listen(authSessionProvider, (_, __) => notifyListeners());
    ref.listen(currentProfileProvider, (_, __) => notifyListeners());
    ref.listen(currentOrgStatusProvider, (_, __) => notifyListeners());
  }
}
