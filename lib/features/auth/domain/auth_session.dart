import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/supabase_service.dart';

part 'auth_session.g.dart';

/// The current Supabase [Session] (or null), kept live across the app. Emits on
/// every auth change. [currentProfileProvider] watches this provider and
/// refetches automatically — do not invalidate it from here (circular dep).
/// See 05.
@Riverpod(keepAlive: true)
class AuthSession extends _$AuthSession {
  StreamSubscription<AuthState>? _sub;

  @override
  Session? build() {
    final client = ref.watch(supabaseProvider);
    _sub = client.auth.onAuthStateChange.listen((event) {
      state = event.session;
    });
    ref.onDispose(() => _sub?.cancel());
    return client.auth.currentSession;
  }
}
