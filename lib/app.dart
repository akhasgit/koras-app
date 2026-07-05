import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/koras_theme.dart';
import 'services/deep_link_service.dart';

class KorasApp extends ConsumerWidget {
  const KorasApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    // Start listening for incoming deep links (OAuth callback + invites).
    ref.watch(deepLinkServiceProvider);

    return MaterialApp.router(
      title: 'Koras',
      debugShowCheckedModeBanner: false,
      theme: buildKorasTheme(),
      routerConfig: router,
    );
  }
}
