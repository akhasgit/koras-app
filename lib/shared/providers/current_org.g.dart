// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_org.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentOrgHash() => r'9c9e250b3ce46f0e97fefbcd074339fd596eed87';

/// The caller's organization (or null — most users have none). RLS: members
/// read their own org. See 06.
///
/// Copied from [currentOrg].
@ProviderFor(currentOrg)
final currentOrgProvider = FutureProvider<AppOrganization?>.internal(
  currentOrg,
  name: r'currentOrgProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentOrgHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentOrgRef = FutureProviderRef<AppOrganization?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
