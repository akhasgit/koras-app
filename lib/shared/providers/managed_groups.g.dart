// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_groups.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$managedGroupsHash() => r'a1dfcfcee8f6334595da97407a9d24683f9011f2';

/// Groups a class manager owns. RLS: `manager_id = auth.uid()`. See 06 / 20.
///
/// Copied from [managedGroups].
@ProviderFor(managedGroups)
final managedGroupsProvider = FutureProvider<List<AppGroup>>.internal(
  managedGroups,
  name: r'managedGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$managedGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ManagedGroupsRef = FutureProviderRef<List<AppGroup>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
