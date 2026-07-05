// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_link_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deepLinkServiceHash() => r'f1c8b958bb647568ff661c53533e84a6700cacc7';

/// Maps incoming `app_links` URIs onto routes. Only navigates — access
/// decisions are re-checked by `_topLevelRedirect`. See 04 / 05.
///
/// Copied from [DeepLinkService].
@ProviderFor(DeepLinkService)
final deepLinkServiceProvider =
    NotifierProvider<DeepLinkService, void>.internal(
  DeepLinkService.new,
  name: r'deepLinkServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deepLinkServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeepLinkService = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
