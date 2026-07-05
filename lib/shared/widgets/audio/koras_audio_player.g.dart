// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'koras_audio_player.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playbackUrlHash() => r'a87a2ea83f34121e57d4da69f9a4efe580a8e7ab';

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

/// Presign a GET on demand. A 410 from the edge fn → [GoneError] → "expired".
///
/// Copied from [playbackUrl].
@ProviderFor(playbackUrl)
const playbackUrlProvider = PlaybackUrlFamily();

/// Presign a GET on demand. A 410 from the edge fn → [GoneError] → "expired".
///
/// Copied from [playbackUrl].
class PlaybackUrlFamily extends Family<AsyncValue<String>> {
  /// Presign a GET on demand. A 410 from the edge fn → [GoneError] → "expired".
  ///
  /// Copied from [playbackUrl].
  const PlaybackUrlFamily();

  /// Presign a GET on demand. A 410 from the edge fn → [GoneError] → "expired".
  ///
  /// Copied from [playbackUrl].
  PlaybackUrlProvider call(
    String audioKey,
  ) {
    return PlaybackUrlProvider(
      audioKey,
    );
  }

  @override
  PlaybackUrlProvider getProviderOverride(
    covariant PlaybackUrlProvider provider,
  ) {
    return call(
      provider.audioKey,
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
  String? get name => r'playbackUrlProvider';
}

/// Presign a GET on demand. A 410 from the edge fn → [GoneError] → "expired".
///
/// Copied from [playbackUrl].
class PlaybackUrlProvider extends AutoDisposeFutureProvider<String> {
  /// Presign a GET on demand. A 410 from the edge fn → [GoneError] → "expired".
  ///
  /// Copied from [playbackUrl].
  PlaybackUrlProvider(
    String audioKey,
  ) : this._internal(
          (ref) => playbackUrl(
            ref as PlaybackUrlRef,
            audioKey,
          ),
          from: playbackUrlProvider,
          name: r'playbackUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playbackUrlHash,
          dependencies: PlaybackUrlFamily._dependencies,
          allTransitiveDependencies:
              PlaybackUrlFamily._allTransitiveDependencies,
          audioKey: audioKey,
        );

  PlaybackUrlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.audioKey,
  }) : super.internal();

  final String audioKey;

  @override
  Override overrideWith(
    FutureOr<String> Function(PlaybackUrlRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlaybackUrlProvider._internal(
        (ref) => create(ref as PlaybackUrlRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        audioKey: audioKey,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _PlaybackUrlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaybackUrlProvider && other.audioKey == audioKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, audioKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlaybackUrlRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `audioKey` of this provider.
  String get audioKey;
}

class _PlaybackUrlProviderElement
    extends AutoDisposeFutureProviderElement<String> with PlaybackUrlRef {
  _PlaybackUrlProviderElement(super.provider);

  @override
  String get audioKey => (origin as PlaybackUrlProvider).audioKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
