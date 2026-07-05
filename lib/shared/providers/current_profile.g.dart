// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_profile.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentProfileHash() => r'908e8d149869b49732334303019de028b9e6ee31';

/// The single profile read shared by the router redirect, the shell, and every
/// role check — one round-trip at sign-in serves all of them. See 05.
///
/// Copied from [currentProfile].
@ProviderFor(currentProfile)
final currentProfileProvider = FutureProvider<AppProfile?>.internal(
  currentProfile,
  name: r'currentProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentProfileRef = FutureProviderRef<AppProfile?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
