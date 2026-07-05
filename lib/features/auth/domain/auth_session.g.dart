// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authSessionHash() => r'9048153e8b33ac9cf8c4dd32cc7a93b8cfffb8c3';

/// The current Supabase [Session] (or null), kept live across the app. Emits on
/// every auth change. [currentProfileProvider] watches this provider and
/// refetches automatically — do not invalidate it from here (circular dep).
/// See 05.
///
/// Copied from [AuthSession].
@ProviderFor(AuthSession)
final authSessionProvider = NotifierProvider<AuthSession, Session?>.internal(
  AuthSession.new,
  name: r'authSessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthSession = Notifier<Session?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
