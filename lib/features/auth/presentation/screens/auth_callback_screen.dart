import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/widgets/koras_loading.dart';

/// Loading state while `supabase_flutter` completes the OAuth code exchange.
/// Once `authSessionProvider` emits, RouterRefresh fires and `_topLevelRedirect`
/// routes to the role-home (or onboarding). See 04 / 05.
class AuthCallbackScreen extends ConsumerStatefulWidget {
  const AuthCallbackScreen({super.key});

  @override
  ConsumerState<AuthCallbackScreen> createState() => _AuthCallbackScreenState();
}

class _AuthCallbackScreenState extends ConsumerState<AuthCallbackScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 50), () {
        if (mounted) context.go('/app/dashboard');
      });
    });
  }

  @override
  Widget build(BuildContext context) => const KorasLoading();
}
