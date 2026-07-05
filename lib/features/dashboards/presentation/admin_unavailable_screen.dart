import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../../auth/data/auth_repository.dart';

/// The only place a super-admin lands on mobile — the panel is web-only (18).
class AdminUnavailableScreen extends ConsumerWidget {
  const AdminUnavailableScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KorasScreen(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Icon(LucideIcons.monitor, size: 48),
        const SizedBox(height: 16),
        Text('Admin lives on the web',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'The super-admin panel isn\'t available in the mobile app. '
          'Please use the Koras web app to manage the platform.',
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
