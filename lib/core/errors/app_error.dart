import 'package:supabase_flutter/supabase_flutter.dart';

/// One sealed error type, mapped at the repository boundary.
/// See `all_docs/mobile/08-api-clients.md` and `27-glossary-and-conventions.md`.
sealed class AppError implements Exception {
  const AppError(this.message);
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

class AuthError extends AppError {
  const AuthError(super.message);
}

class NetworkError extends AppError {
  const NetworkError(super.message);
}

class NotFoundError extends AppError {
  const NotFoundError(super.message);
}

/// RLS / 403.
class PermissionError extends AppError {
  const PermissionError(super.message);
}

/// 409.
class ConflictError extends AppError {
  const ConflictError(super.message);
}

/// 410 — presigned object past its lifecycle (see 21).
class GoneError extends AppError {
  const GoneError(super.message);
}

/// 5xx / Modal / edge function failure.
class ServerError extends AppError {
  const ServerError(super.message);
}

class UnknownError extends AppError {
  const UnknownError(super.message);
}

/// Map a non-2xx `functions.invoke` response to an [AppError].
/// `functions.invoke` does NOT throw on non-2xx — callers must check `res.status`.
AppError mapEdgeError(FunctionResponse res) {
  final data = res.data;
  final body = data is Map ? data['error']?.toString() : null;
  return switch (res.status) {
    401 => AuthError(body ?? 'Not signed in'),
    403 => PermissionError(body ?? 'Not allowed'),
    404 => NotFoundError(body ?? 'Not found'),
    409 => ConflictError(body ?? 'Conflict'),
    410 => GoneError(body ?? 'Resource expired'),
    final int s when s >= 500 => ServerError(body ?? 'Server error'),
    _ => UnknownError(body ?? 'Request failed (${res.status})'),
  };
}

/// Map a [PostgrestException] (direct RLS reads/writes) to an [AppError].
AppError mapPostgrestError(PostgrestException e) {
  if (e.code == 'PGRST301' || e.code == '42501') {
    return const PermissionError('Not allowed');
  }
  if (e.code == 'PGRST116') {
    return const NotFoundError('Not found');
  }
  return ServerError(e.message);
}

/// Map any thrown object at the repository boundary.
AppError mapError(Object error) {
  return switch (error) {
    AppError() => error,
    PostgrestException() => mapPostgrestError(error),
    AuthException() => AuthError(error.message),
    _ => UnknownError(error.toString()),
  };
}

/// User-facing copy for Supabase auth failures (sign-in, sign-up, reset).
String prettifyAuthError(String message) {
  final lower = message.toLowerCase();
  if (lower.contains('invalid login')) return 'Wrong email or password.';
  if (lower.contains('email not confirmed')) {
    return 'Please confirm your email — check your inbox for the link.';
  }
  if (lower.contains('already registered') ||
      lower.contains('already been registered')) {
    return 'That email already has an account. Try signing in instead.';
  }
  if (lower.contains('not signed in')) return 'Please sign in again.';
  return message;
}

/// User-facing copy for an error.
String errorToMessage(Object error) {
  final e = error is AppError ? error : mapError(error);
  return switch (e) {
    AuthError(message: final m) => prettifyAuthError(m),
    NetworkError() => 'Network problem. Check your connection and retry.',
    NotFoundError() => 'We couldn\'t find that.',
    PermissionError(message: 'Microphone permission denied') =>
      'Microphone access is required. Please enable it in Settings.',
    PermissionError() => 'You don\'t have access to this.',
    ConflictError() => 'That action is already in progress.',
    GoneError() => 'This has expired.',
    ServerError() => 'Something went wrong on our end. Try again.',
    UnknownError() => e.message,
  };
}

/// Returns true if [error] is a device microphone permission denial.
bool isMicrophonePermissionError(Object error) {
  final e = error is AppError ? error : mapError(error);
  return e is PermissionError && e.message == 'Microphone permission denied';
}
