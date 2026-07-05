import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/supabase_service.dart';
import '../../../shared/providers/current_profile.dart';

part 'auth_session.g.dart';

/// The current Supabase [Session] (or null), kept live across the app. Emits on
/// every auth change; refreshes the profile only on identity changes. See 05.
@Riverpod(keepAlive: true)
class AuthSession extends _$AuthSession {
  StreamSubscription<AuthState>? _sub;

  @override
  Session? build() {
    final client = ref.watch(supabaseProvider);
    _sub = client.auth.onAuthStateChange.listen((event) {
      state = event.session;
      if (event.event == AuthChangeEvent.signedIn ||
          event.event == AuthChangeEvent.signedOut) {
        ref.invalidate(currentProfileProvider);
      }
    });
    ref.onDispose(() => _sub?.cancel());
    return client.auth.currentSession;
  }
}
