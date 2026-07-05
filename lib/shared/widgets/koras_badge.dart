import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

enum BadgeTone { neutral, ember, success, warning, danger }

/// Status pill.
class KorasBadge extends StatelessWidget {
  const KorasBadge(
      {super.key, required this.label, this.tone = BadgeTone.neutral});

  final String label;
  final BadgeTone tone;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final (bg, fg) = switch (tone) {
      BadgeTone.neutral => (k.paperWarm, k.ink700),
      BadgeTone.ember => (k.emberSoft, k.emberPressed),
      BadgeTone.success => (k.success.withValues(alpha: 0.15), k.success),
      BadgeTone.warning => (k.warning.withValues(alpha: 0.18), k.warning),
      BadgeTone.danger => (k.danger.withValues(alpha: 0.15), k.danger),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: fg, fontWeight: FontWeight.w600),
      ),
    );
  }
}
