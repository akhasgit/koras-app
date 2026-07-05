// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authSessionHash() => r'bf305e4257e853f2e5f8465d7a5d818bd23f5110';

/// The current Supabase [Session] (or null), kept live across the app. Emits on
/// every auth change; refreshes the profile only on identity changes. See 05.
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
