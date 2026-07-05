import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../../programs/domain/program_catalog.dart';

/// Program-not-available landing. Routed here when `program_access` denies a
/// program, or for `incoming` catalogue entries. See 04 / 23.
class LockedScreen extends ConsumerWidget {
  const LockedScreen({super.key, this.programId});
  final String? programId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final program = findProgram(programId);
    return KorasScreen(
      title: program?.label ?? 'Not available yet',
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        const Icon(LucideIcons.lock, size: 48),
        const SizedBox(height: 16),
        Text(
          program?.description ??
              'This program isn\'t available for your account yet.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        KorasButton.secondary(
          onPressed: () => context.go('/app/dashboard'),
          child: const Text('Back to dashboard'),
        ),
      ],
    );
  }
}
