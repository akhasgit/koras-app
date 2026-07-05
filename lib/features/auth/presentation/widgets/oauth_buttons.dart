import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../shared/widgets/koras_button.dart';
import '../../data/auth_repository.dart';

/// Google + Apple sign-in. Apple is shown on iOS (App Store guideline 4.8).
class OAuthButtons extends ConsumerWidget {
  const OAuthButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(authRepositoryProvider);
    final showApple = Theme.of(context).platform == TargetPlatform.iOS;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KorasButton.secondary(
          onPressed: repo.signInWithGoogle,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LucideIcons.globe, size: 18),
              SizedBox(width: 8),
              Text('Continue with Google'),
            ],
          ),
        ),
        if (showApple) ...[
          const SizedBox(height: 12),
          KorasButton.secondary(
            onPressed: repo.signInWithApple,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.apple, size: 18),
                SizedBox(width: 8),
                Text('Continue with Apple'),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
