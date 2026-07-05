import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/glass/mesh_background.dart';

/// Inbox / notifications (reached from the header avatar menu). V1 placeholder —
/// wired to a data source during the page-by-page pass (plan §3.7b, Q7).
class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Stack(
      children: [
        const Positioned.fill(child: MeshBackground()),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: const Text('Inbox'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.inbox, size: 40, color: k.muted),
                const SizedBox(height: 12),
                Text('No notifications yet',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 6),
                Text(
                  'Plan refreshes and updates will show up here.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: k.muted),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
