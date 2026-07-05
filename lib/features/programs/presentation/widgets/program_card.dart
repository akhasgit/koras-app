import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/theme/koras_theme.dart';
import '../../../../shared/models/enums.dart';
import '../../../../shared/widgets/koras_badge.dart';
import '../../../../shared/widgets/koras_card.dart';
import '../../domain/program_catalog.dart';

/// A program catalogue card. CTA disabled when [locked] or `incoming`.
class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key, required this.program, this.locked = false});
  final Program program;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final isIncoming = program.status == ProgramStatus.incoming;
    final disabled = locked || isIncoming || program.route == null;
    return KorasCard(
      onTap: () {
        if (disabled) {
          context.go('/app/locked?program=${program.id}');
        } else {
          context.go(program.route!);
        }
      },
      child: Row(
        children: [
          Icon(program.icon, color: disabled ? k.ink300 : k.ember, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(program.label,
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    if (isIncoming)
                      const KorasBadge(label: 'Soon', tone: BadgeTone.neutral)
                    else if (locked)
                      const KorasBadge(
                          label: 'Locked', tone: BadgeTone.warning),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  program.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: k.ink500),
                ),
              ],
            ),
          ),
          Icon(disabled ? LucideIcons.lock : LucideIcons.chevronRight,
              color: k.ink300, size: 18),
        ],
      ),
    );
  }
}
