import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/env/env.dart';
import '../../../services/supabase_service.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) =>
    AuthRepository(ref.watch(supabaseProvider));

/// Wraps `SupabaseClient.auth`. Email/password, Google, and Apple (Apple is ON
/// for mobile per App Store guideline 4.8). PKCE survives the deep-link round
/// trip. The `on_auth_user_created` trigger creates the `profiles` row. See 05.
class AuthRepository {
  AuthRepository(this._client);
  final SupabaseClient _client;

  Future<AuthResponse> signInWithPassword({
    required String email,
    required String password,
  }) =>
      _client.auth.signInWithPassword(email: email, password: password);

  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) =>
      _client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: Env.authCallbackUrl,
      );

  Future<bool> signInWithGoogle() => _client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: Env.authCallbackUrl,
        authScreenLaunchMode: LaunchMode.externalApplication,
      );

  Future<bool> signInWithApple() => _client.auth.signInWithOAuth(
        OAuthProvider.apple,
        redirectTo: Env.authCallbackUrl,
      );

  Future<void> resetPassword(String email) => _client.auth
      .resetPasswordForEmail(email, redirectTo: Env.authCallbackUrl);

  Future<UserResponse> updatePassword(String newPassword) =>
      _client.auth.updateUser(UserAttributes(password: newPassword));

  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      debugPrint('signOut error: $e');
    }
  }
}
