// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupsRepositoryHash() => r'e7a627bd329134c4b4755af80005caac0f8abc9c';

/// See also [groupsRepository].
@ProviderFor(groupsRepository)
final groupsRepositoryProvider = AutoDisposeProvider<GroupsRepository>.internal(
  groupsRepository,
  name: r'groupsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GroupsRepositoryRef = AutoDisposeProviderRef<GroupsRepository>;
String _$groupByIdHash() => r'f5119aae138a4c6fb9120919ff41137d5219b627';

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

/// See also [groupById].
@ProviderFor(groupById)
const groupByIdProvider = GroupByIdFamily();

/// See also [groupById].
class GroupByIdFamily extends Family<AsyncValue<AppGroup?>> {
  /// See also [groupById].
  const GroupByIdFamily();

  /// See also [groupById].
  GroupByIdProvider call(
    String id,
  ) {
    return GroupByIdProvider(
      id,
    );
  }

  @override
  GroupByIdProvider getProviderOverride(
    covariant GroupByIdProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'groupByIdProvider';
}

/// See also [groupById].
class GroupByIdProvider extends AutoDisposeFutureProvider<AppGroup?> {
  /// See also [groupById].
  GroupByIdProvider(
    String id,
  ) : this._internal(
          (ref) => groupById(
            ref as GroupByIdRef,
            id,
          ),
          from: groupByIdProvider,
          name: r'groupByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupByIdHash,
          dependencies: GroupByIdFamily._dependencies,
          allTransitiveDependencies: GroupByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GroupByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<AppGroup?> Function(GroupByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupByIdProvider._internal(
        (ref) => create(ref as GroupByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AppGroup?> createElement() {
    return _GroupByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupByIdRef on AutoDisposeFutureProviderRef<AppGroup?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GroupByIdProviderElement
    extends AutoDisposeFutureProviderElement<AppGroup?> with GroupByIdRef {
  _GroupByIdProviderElement(super.provider);

  @override
  String get id => (origin as GroupByIdProvider).id;
}

String _$groupStudentsHash() => r'ea2ef235de51891f398ee4939a56a2256f9ed21c';

/// See also [groupStudents].
@ProviderFor(groupStudents)
const groupStudentsProvider = GroupStudentsFamily();

/// See also [groupStudents].
class GroupStudentsFamily extends Family<AsyncValue<List<AppProfile>>> {
  /// See also [groupStudents].
  const GroupStudentsFamily();

  /// See also [groupStudents].
  GroupStudentsProvider call(
    String groupId,
  ) {
    return GroupStudentsProvider(
      groupId,
    );
  }

  @override
  GroupStudentsProvider getProviderOverride(
    covariant GroupStudentsProvider provider,
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
  String? get name => r'groupStudentsProvider';
}

/// See also [groupStudents].
class GroupStudentsProvider
    extends AutoDisposeFutureProvider<List<AppProfile>> {
  /// See also [groupStudents].
  GroupStudentsProvider(
    String groupId,
  ) : this._internal(
          (ref) => groupStudents(
            ref as GroupStudentsRef,
            groupId,
          ),
          from: groupStudentsProvider,
          name: r'groupStudentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupStudentsHash,
          dependencies: GroupStudentsFamily._dependencies,
          allTransitiveDependencies:
              GroupStudentsFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupStudentsProvider._internal(
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
    FutureOr<List<AppProfile>> Function(GroupStudentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupStudentsProvider._internal(
        (ref) => create(ref as GroupStudentsRef),
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
  AutoDisposeFutureProviderElement<List<AppProfile>> createElement() {
    return _GroupStudentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupStudentsProvider && other.groupId == groupId;
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
mixin GroupStudentsRef on AutoDisposeFutureProviderRef<List<AppProfile>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupStudentsProviderElement
    extends AutoDisposeFutureProviderElement<List<AppProfile>>
    with GroupStudentsRef {
  _GroupStudentsProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupStudentsProvider).groupId;
}

String _$currentOrgIdHash() => r'b9a78b145808a2d3908a4678e77fa18202c0c03c';

/// The current manager's org id, needed when creating a group.
///
/// Copied from [currentOrgId].
@ProviderFor(currentOrgId)
final currentOrgIdProvider = AutoDisposeFutureProvider<String?>.internal(
  currentOrgId,
  name: r'currentOrgIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentOrgIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentOrgIdRef = AutoDisposeFutureProviderRef<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
