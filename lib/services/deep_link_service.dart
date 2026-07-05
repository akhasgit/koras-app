import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/env/env.dart';
import '../core/router/app_router.dart';

part 'deep_link_service.g.dart';

/// Maps incoming `app_links` URIs onto routes. Only navigates — access
/// decisions are re-checked by `_topLevelRedirect`. See 04 / 05.
@Riverpod(keepAlive: true)
class DeepLinkService extends _$DeepLinkService {
  StreamSubscription<Uri>? _sub;

  @override
  void build() {
    final links = AppLinks();
    _sub = links.uriLinkStream.listen(_handle);
    // Handle the link that cold-started the app (if any).
    links.getInitialLink().then((uri) {
      if (uri != null) _handle(uri);
    });
    ref.onDispose(() => _sub?.cancel());
  }

  void _handle(Uri uri) {
    final router = ref.read(appRouterProvider);
    final isScheme = uri.scheme == Env.deepLinkScheme;
    if (isScheme &&
        uri.host == 'auth' &&
        uri.pathSegments.contains('callback')) {
      router.go('/auth/callback');
    } else if (isScheme &&
        uri.pathSegments.length >= 2 &&
        uri.pathSegments.first == 'invite') {
      router.go('/auth/invite/${uri.pathSegments[1]}');
    } else if (isScheme &&
        uri.host == 'invite' &&
        uri.pathSegments.isNotEmpty) {
      router.go('/auth/invite/${uri.pathSegments.first}');
    } else if (uri.scheme == 'https' &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'app') {
      router.go(uri.path);
    }
  }
}
