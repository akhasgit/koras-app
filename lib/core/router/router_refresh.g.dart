// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_refresh.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerRefreshHash() => r'fa1152aab12d2b5e6f730a07a2c78c3af9ba4f94';

/// Bridges Riverpod auth/profile/org state to go_router's `refreshListenable`.
/// Re-runs `_topLevelRedirect` whenever any of these change. See 04.
///
/// Copied from [RouterRefresh].
@ProviderFor(RouterRefresh)
final routerRefreshProvider = NotifierProvider<RouterRefresh, void>.internal(
  RouterRefresh.new,
  name: r'routerRefreshProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routerRefreshHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RouterRefresh = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
