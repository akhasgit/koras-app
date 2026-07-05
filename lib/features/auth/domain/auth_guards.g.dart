// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_guards.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isLearnerHash() => r'5c680ed7633b28d99829dc5244174281a5e0a614';

/// See also [isLearner].
@ProviderFor(isLearner)
final isLearnerProvider = AutoDisposeProvider<bool>.internal(
  isLearner,
  name: r'isLearnerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLearnerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsLearnerRef = AutoDisposeProviderRef<bool>;
String _$isSuperAdminHash() => r'9545ddfba93a40ff8f8acca0d8ae9d94d0ca88b9';

/// See also [isSuperAdmin].
@ProviderFor(isSuperAdmin)
final isSuperAdminProvider = AutoDisposeProvider<bool>.internal(
  isSuperAdmin,
  name: r'isSuperAdminProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isSuperAdminHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsSuperAdminRef = AutoDisposeProviderRef<bool>;
String _$requireOwnedGroupHash() => r'd6c148ba033764578107eded9f363271c6294bdc';

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

/// Ports `teacher.ts`: caller must be an `org_manager` and own the group.
/// RLS enforces this server-side too; this gates UI + a clean forbidden state.
///
/// Copied from [requireOwnedGroup].
@ProviderFor(requireOwnedGroup)
const requireOwnedGroupProvider = RequireOwnedGroupFamily();

/// Ports `teacher.ts`: caller must be an `org_manager` and own the group.
/// RLS enforces this server-side too; this gates UI + a clean forbidden state.
///
/// Copied from [requireOwnedGroup].
class RequireOwnedGroupFamily extends Family<AsyncValue<AppGroup>> {
  /// Ports `teacher.ts`: caller must be an `org_manager` and own the group.
  /// RLS enforces this server-side too; this gates UI + a clean forbidden state.
  ///
  /// Copied from [requireOwnedGroup].
  const RequireOwnedGroupFamily();

  /// Ports `teacher.ts`: caller must be an `org_manager` and own the group.
  /// RLS enforces this server-side too; this gates UI + a clean forbidden state.
  ///
  /// Copied from [requireOwnedGroup].
  RequireOwnedGroupProvider call(
    String groupId,
  ) {
    return RequireOwnedGroupProvider(
      groupId,
    );
  }

  @override
  RequireOwnedGroupProvider getProviderOverride(
    covariant RequireOwnedGroupProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'requireOwnedGroupProvider';
}

/// Ports `teacher.ts`: caller must be an `org_manager` and own the group.
/// RLS enforces this server-side too; this gates UI + a clean forbidden state.
///
/// Copied from [requireOwnedGroup].
class RequireOwnedGroupProvider extends AutoDisposeFutureProvider<AppGroup> {
  /// Ports `teacher.ts`: caller must be an `org_manager` and own the group.
  /// RLS enforces this server-side too; this gates UI + a clean forbidden state.
  ///
  /// Copied from [requireOwnedGroup].
  RequireOwnedGroupProvider(
    String groupId,
  ) : this._internal(
          (ref) => requireOwnedGroup(
            ref as RequireOwnedGroupRef,
            groupId,
          ),
          from: requireOwnedGroupProvider,
          name: r'requireOwnedGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$requireOwnedGroupHash,
          dependencies: RequireOwnedGroupFamily._dependencies,
          allTransitiveDependencies:
              RequireOwnedGroupFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  RequireOwnedGroupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    FutureOr<AppGroup> Function(RequireOwnedGroupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RequireOwnedGroupProvider._internal(
        (ref) => create(ref as RequireOwnedGroupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AppGroup> createElement() {
    return _RequireOwnedGroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RequireOwnedGroupProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RequireOwnedGroupRef on AutoDisposeFutureProviderRef<AppGroup> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _RequireOwnedGroupProviderElement
    extends AutoDisposeFutureProviderElement<AppGroup>
    with RequireOwnedGroupRef {
  _RequireOwnedGroupProviderElement(super.provider);

  @override
  String get groupId => (origin as RequireOwnedGroupProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
