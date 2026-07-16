// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$readingRepositoryHash() => r'126144d1dd6400d607db514ba3f062af698fd0c1';

/// See also [readingRepository].
@ProviderFor(readingRepository)
final readingRepositoryProvider =
    AutoDisposeProvider<ReadingRepository>.internal(
  readingRepository,
  name: r'readingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$readingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReadingRepositoryRef = AutoDisposeProviderRef<ReadingRepository>;
String _$readingIntakeDefaultsHash() =>
    r'523e71db05445428e548655ff217518b2706eb58';

/// See also [readingIntakeDefaults].
@ProviderFor(readingIntakeDefaults)
final readingIntakeDefaultsProvider =
    AutoDisposeFutureProvider<ReadingIntakeDefaults>.internal(
  readingIntakeDefaults,
  name: r'readingIntakeDefaultsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$readingIntakeDefaultsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReadingIntakeDefaultsRef
    = AutoDisposeFutureProviderRef<ReadingIntakeDefaults>;
String _$readingProgramHash() => r'45a843d4415532054191cf9b738758e8d638adf6';

/// See also [readingProgram].
@ProviderFor(readingProgram)
final readingProgramProvider =
    AutoDisposeFutureProvider<ReadingProgram?>.internal(
  readingProgram,
  name: r'readingProgramProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$readingProgramHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReadingProgramRef = AutoDisposeFutureProviderRef<ReadingProgram?>;
String _$readingStageHash() => r'ea0ed0c26b3f21f09d466360fe5f5e80b71eb7b9';

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

/// See also [readingStage].
@ProviderFor(readingStage)
const readingStageProvider = ReadingStageFamily();

/// See also [readingStage].
class ReadingStageFamily extends Family<AsyncValue<ReadingStage>> {
  /// See also [readingStage].
  const ReadingStageFamily();

  /// See also [readingStage].
  ReadingStageProvider call(
    String stageId,
  ) {
    return ReadingStageProvider(
      stageId,
    );
  }

  @override
  ReadingStageProvider getProviderOverride(
    covariant ReadingStageProvider provider,
  ) {
    return call(
      provider.stageId,
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
  String? get name => r'readingStageProvider';
}

/// See also [readingStage].
class ReadingStageProvider extends AutoDisposeFutureProvider<ReadingStage> {
  /// See also [readingStage].
  ReadingStageProvider(
    String stageId,
  ) : this._internal(
          (ref) => readingStage(
            ref as ReadingStageRef,
            stageId,
          ),
          from: readingStageProvider,
          name: r'readingStageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$readingStageHash,
          dependencies: ReadingStageFamily._dependencies,
          allTransitiveDependencies:
              ReadingStageFamily._allTransitiveDependencies,
          stageId: stageId,
        );

  ReadingStageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stageId,
  }) : super.internal();

  final String stageId;

  @override
  Override overrideWith(
    FutureOr<ReadingStage> Function(ReadingStageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReadingStageProvider._internal(
        (ref) => create(ref as ReadingStageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stageId: stageId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ReadingStage> createElement() {
    return _ReadingStageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReadingStageProvider && other.stageId == stageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReadingStageRef on AutoDisposeFutureProviderRef<ReadingStage> {
  /// The parameter `stageId` of this provider.
  String get stageId;
}

class _ReadingStageProviderElement
    extends AutoDisposeFutureProviderElement<ReadingStage>
    with ReadingStageRef {
  _ReadingStageProviderElement(super.provider);

  @override
  String get stageId => (origin as ReadingStageProvider).stageId;
}

String _$readingProgressHash() => r'93330d8526186e6874b146cf8c124db8a4823a0a';

/// See also [readingProgress].
@ProviderFor(readingProgress)
final readingProgressProvider =
    AutoDisposeFutureProvider<ReadingProgress>.internal(
  readingProgress,
  name: r'readingProgressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$readingProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReadingProgressRef = AutoDisposeFutureProviderRef<ReadingProgress>;
String _$readingAttemptHash() => r'bef701ced1496679c7fc5f9e7a2f52617899f6e6';

/// See also [readingAttempt].
@ProviderFor(readingAttempt)
const readingAttemptProvider = ReadingAttemptFamily();

/// See also [readingAttempt].
class ReadingAttemptFamily extends Family<AsyncValue<ReadingAttempt>> {
  /// See also [readingAttempt].
  const ReadingAttemptFamily();

  /// See also [readingAttempt].
  ReadingAttemptProvider call(
    String attemptId,
  ) {
    return ReadingAttemptProvider(
      attemptId,
    );
  }

  @override
  ReadingAttemptProvider getProviderOverride(
    covariant ReadingAttemptProvider provider,
  ) {
    return call(
      provider.attemptId,
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
  String? get name => r'readingAttemptProvider';
}

/// See also [readingAttempt].
class ReadingAttemptProvider extends AutoDisposeFutureProvider<ReadingAttempt> {
  /// See also [readingAttempt].
  ReadingAttemptProvider(
    String attemptId,
  ) : this._internal(
          (ref) => readingAttempt(
            ref as ReadingAttemptRef,
            attemptId,
          ),
          from: readingAttemptProvider,
          name: r'readingAttemptProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$readingAttemptHash,
          dependencies: ReadingAttemptFamily._dependencies,
          allTransitiveDependencies:
              ReadingAttemptFamily._allTransitiveDependencies,
          attemptId: attemptId,
        );

  ReadingAttemptProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.attemptId,
  }) : super.internal();

  final String attemptId;

  @override
  Override overrideWith(
    FutureOr<ReadingAttempt> Function(ReadingAttemptRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReadingAttemptProvider._internal(
        (ref) => create(ref as ReadingAttemptRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        attemptId: attemptId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ReadingAttempt> createElement() {
    return _ReadingAttemptProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReadingAttemptProvider && other.attemptId == attemptId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, attemptId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReadingAttemptRef on AutoDisposeFutureProviderRef<ReadingAttempt> {
  /// The parameter `attemptId` of this provider.
  String get attemptId;
}

class _ReadingAttemptProviderElement
    extends AutoDisposeFutureProviderElement<ReadingAttempt>
    with ReadingAttemptRef {
  _ReadingAttemptProviderElement(super.provider);

  @override
  String get attemptId => (origin as ReadingAttemptProvider).attemptId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
