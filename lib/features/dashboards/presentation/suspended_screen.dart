import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
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
        Container(
          width: 88,
          height: 88,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.koras.glassFillStrong,
            borderRadius: BorderRadius.circular(26),
            border:
                Border.all(color: context.koras.glassBorder, width: 0.75),
          ),
          child: Icon(LucideIcons.triangleAlert,
              size: 36, color: context.koras.warn),
        ),
        const SizedBox(height: 20),
        Text('Account paused',
            style: korasSerifItalic(24, color: context.koras.ink900)),
        const SizedBox(height: 8),
        Text(
          'Your organization\'s access is currently suspended. '
          'Please contact your administrator.',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: context.koras.ink700),
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
