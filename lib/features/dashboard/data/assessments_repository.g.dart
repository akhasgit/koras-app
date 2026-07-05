// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessments_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assessmentsRepositoryHash() =>
    r'50ccc75ff4686285b0e51965449ee5ebdf1de4e5';

/// See also [assessmentsRepository].
@ProviderFor(assessmentsRepository)
final assessmentsRepositoryProvider =
    AutoDisposeProvider<AssessmentsRepository>.internal(
  assessmentsRepository,
  name: r'assessmentsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$assessmentsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AssessmentsRepositoryRef
    = AutoDisposeProviderRef<AssessmentsRepository>;
String _$latestAssessmentHash() => r'6f527c53530118f59e540a554674ee5c1f1d6857';

/// See also [latestAssessment].
@ProviderFor(latestAssessment)
final latestAssessmentProvider =
    AutoDisposeFutureProvider<VoiceAssessment?>.internal(
  latestAssessment,
  name: r'latestAssessmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$latestAssessmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LatestAssessmentRef = AutoDisposeFutureProviderRef<VoiceAssessment?>;
String _$assessmentHistoryHash() => r'c462bac308d5e18b8e738c864299b0a876ed1232';

/// See also [assessmentHistory].
@ProviderFor(assessmentHistory)
final assessmentHistoryProvider =
    AutoDisposeFutureProvider<List<VoiceAssessment>>.internal(
  assessmentHistory,
  name: r'assessmentHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$assessmentHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AssessmentHistoryRef
    = AutoDisposeFutureProviderRef<List<VoiceAssessment>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
