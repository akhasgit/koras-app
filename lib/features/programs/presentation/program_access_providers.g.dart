// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_access_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hasProgramAccessHash() => r'c63a629bd7d98f70759afecc8f368536312c28f9';

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

/// Whether the caller may enter [programId]. super_admin / test accounts see
/// everything; otherwise RLS on `program_access` does the filtering. See 23.
///
/// Copied from [hasProgramAccess].
@ProviderFor(hasProgramAccess)
const hasProgramAccessProvider = HasProgramAccessFamily();

/// Whether the caller may enter [programId]. super_admin / test accounts see
/// everything; otherwise RLS on `program_access` does the filtering. See 23.
///
/// Copied from [hasProgramAccess].
class HasProgramAccessFamily extends Family<AsyncValue<bool>> {
  /// Whether the caller may enter [programId]. super_admin / test accounts see
  /// everything; otherwise RLS on `program_access` does the filtering. See 23.
  ///
  /// Copied from [hasProgramAccess].
  const HasProgramAccessFamily();

  /// Whether the caller may enter [programId]. super_admin / test accounts see
  /// everything; otherwise RLS on `program_access` does the filtering. See 23.
  ///
  /// Copied from [hasProgramAccess].
  HasProgramAccessProvider call(
    String programId,
  ) {
    return HasProgramAccessProvider(
      programId,
    );
  }

  @override
  HasProgramAccessProvider getProviderOverride(
    covariant HasProgramAccessProvider provider,
  ) {
    return call(
      provider.programId,
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
  String? get name => r'hasProgramAccessProvider';
}

/// Whether the caller may enter [programId]. super_admin / test accounts see
/// everything; otherwise RLS on `program_access` does the filtering. See 23.
///
/// Copied from [hasProgramAccess].
class HasProgramAccessProvider extends AutoDisposeFutureProvider<bool> {
  /// Whether the caller may enter [programId]. super_admin / test accounts see
  /// everything; otherwise RLS on `program_access` does the filtering. See 23.
  ///
  /// Copied from [hasProgramAccess].
  HasProgramAccessProvider(
    String programId,
  ) : this._internal(
          (ref) => hasProgramAccess(
            ref as HasProgramAccessRef,
            programId,
          ),
          from: hasProgramAccessProvider,
          name: r'hasProgramAccessProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$hasProgramAccessHash,
          dependencies: HasProgramAccessFamily._dependencies,
          allTransitiveDependencies:
              HasProgramAccessFamily._allTransitiveDependencies,
          programId: programId,
        );

  HasProgramAccessProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.programId,
  }) : super.internal();

  final String programId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(HasProgramAccessRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HasProgramAccessProvider._internal(
        (ref) => create(ref as HasProgramAccessRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        programId: programId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _HasProgramAccessProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HasProgramAccessProvider && other.programId == programId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, programId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HasProgramAccessRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `programId` of this provider.
  String get programId;
}

class _HasProgramAccessProviderElement
    extends AutoDisposeFutureProviderElement<bool> with HasProgramAccessRef {
  _HasProgramAccessProviderElement(super.provider);

  @override
  String get programId => (origin as HasProgramAccessProvider).programId;
}

String _$accessibleProgramIdsHash() =>
    r'54ef06cbb21106ed26f957e0e8e86d133afcb2c8';

/// See also [accessibleProgramIds].
@ProviderFor(accessibleProgramIds)
final accessibleProgramIdsProvider =
    AutoDisposeFutureProvider<Set<String>>.internal(
  accessibleProgramIds,
  name: r'accessibleProgramIdsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accessibleProgramIdsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AccessibleProgramIdsRef = AutoDisposeFutureProviderRef<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
