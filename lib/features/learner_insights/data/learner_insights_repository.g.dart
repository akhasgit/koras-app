// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learner_insights_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$learnerInsightsRepositoryHash() =>
    r'0dd6f2a259b958c5f85ba093a82787778c40aebd';

/// See also [learnerInsightsRepository].
@ProviderFor(learnerInsightsRepository)
final learnerInsightsRepositoryProvider =
    AutoDisposeProvider<LearnerInsightsRepository>.internal(
  learnerInsightsRepository,
  name: r'learnerInsightsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$learnerInsightsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LearnerInsightsRepositoryRef
    = AutoDisposeProviderRef<LearnerInsightsRepository>;
String _$learnerInsightsHash() => r'1a2d19b78246bc560729eab15f61e1689be4d967';

/// See also [learnerInsights].
@ProviderFor(learnerInsights)
final learnerInsightsProvider =
    AutoDisposeFutureProvider<LearnerInsights?>.internal(
  learnerInsights,
  name: r'learnerInsightsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$learnerInsightsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LearnerInsightsRef = AutoDisposeFutureProviderRef<LearnerInsights?>;
String _$studentInsightsHash() => r'e67cf69883229b8c0f04d59a96c96ecd4bc22ed2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Teacher view of a student's insights (RLS allows reads for owned groups).
///
/// Copied from [studentInsights].
@ProviderFor(studentInsights)
const studentInsightsProvider = StudentInsightsFamily();

/// Teacher view of a student's insights (RLS allows reads for owned groups).
///
/// Copied from [studentInsights].
class StudentInsightsFamily extends Family<AsyncValue<LearnerInsights?>> {
  /// Teacher view of a student's insights (RLS allows reads for owned groups).
  ///
  /// Copied from [studentInsights].
  const StudentInsightsFamily();

  /// Teacher view of a student's insights (RLS allows reads for owned groups).
  ///
  /// Copied from [studentInsights].
  StudentInsightsProvider call(
    String userId,
  ) {
    return StudentInsightsProvider(
      userId,
    );
  }

  @override
  StudentInsightsProvider getProviderOverride(
    covariant StudentInsightsProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'studentInsightsProvider';
}

/// Teacher view of a student's insights (RLS allows reads for owned groups).
///
/// Copied from [studentInsights].
class StudentInsightsProvider
    extends AutoDisposeFutureProvider<LearnerInsights?> {
  /// Teacher view of a student's insights (RLS allows reads for owned groups).
  ///
  /// Copied from [studentInsights].
  StudentInsightsProvider(
    String userId,
  ) : this._internal(
          (ref) => studentInsights(
            ref as StudentInsightsRef,
            userId,
          ),
          from: studentInsightsProvider,
          name: r'studentInsightsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$studentInsightsHash,
          dependencies: StudentInsightsFamily._dependencies,
          allTransitiveDependencies:
              StudentInsightsFamily._allTransitiveDependencies,
          userId: userId,
        );

  StudentInsightsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<LearnerInsights?> Function(StudentInsightsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StudentInsightsProvider._internal(
        (ref) => create(ref as StudentInsightsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LearnerInsights?> createElement() {
    return _StudentInsightsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentInsightsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StudentInsightsRef on AutoDisposeFutureProviderRef<LearnerInsights?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _StudentInsightsProviderElement
    extends AutoDisposeFutureProviderElement<LearnerInsights?>
    with StudentInsightsRef {
  _StudentInsightsProviderElement(super.provider);

  @override
  String get userId => (origin as StudentInsightsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
