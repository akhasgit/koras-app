import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../../auth/data/auth_repository.dart';

/// Shown when the caller's organization is suspended. See 04 / 06.
class SuspendedScreen extends ConsumerWidget {
  const SuspendedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KorasScreen(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Icon(LucideIcons.triangleAlert, size: 48),
        const SizedBox(height: 16),
        Text('Account paused',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'Your organization\'s access is currently suspended. '
          'Please contact your administrator.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        KorasButton.secondary(
          onPressed: () => ref.read(authRepositoryProvider).signOut(),
          child: const Text('Sign out'),
        ),
      ],
    );
  }
}
