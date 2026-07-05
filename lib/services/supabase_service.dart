import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_service.g.dart';

/// The single app-wide [SupabaseClient]. Initialised once in `main.dart`
/// (`Supabase.initialize`); everything reads it via [supabaseProvider].
/// `supabase_flutter` manages JWT refresh on this singleton.
@Riverpod(keepAlive: true)
SupabaseClient supabase(Ref ref) => Supabase.instance.client;

/// Convenience: the current authenticated user id (or null).
@riverpod
String? currentUserId(Ref ref) {
  // Re-read whenever auth state changes.
  ref.watch(authStateChangesProvider);
  return ref.watch(supabaseProvider).auth.currentUser?.id;
}

/// Stream of Supabase auth state changes — bridges sign-in/out into Riverpod.
@Riverpod(keepAlive: true)
Stream<AuthState> authStateChanges(Ref ref) =>
    ref.watch(supabaseProvider).auth.onAuthStateChange;
