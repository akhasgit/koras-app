// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$learnerHomeHash() => r'db98824229c901ce73e2e57adeeb38876c9729c1';

/// Learner home fetches latest assessment + insights + daily plan in parallel.
/// The plan is server-owned and degrades gracefully if its edge function isn't
/// deployed yet. See 20.
///
/// Copied from [learnerHome].
@ProviderFor(learnerHome)
final learnerHomeProvider = AutoDisposeFutureProvider<LearnerHomeData>.internal(
  learnerHome,
  name: r'learnerHomeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$learnerHomeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LearnerHomeRef = AutoDisposeFutureProviderRef<LearnerHomeData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
