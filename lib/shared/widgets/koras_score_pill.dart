import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';
import '../../core/theme/typography.dart';

/// Compact score pill — coloured dot + uppercase label + serif value.
/// Port of `ScorePillMini` in `handoffs/koras-mobile-handoff/koras-learner.jsx`.
class KorasScorePill extends StatelessWidget {
  const KorasScorePill({
    super.key,
    required this.label,
    required this.value,
    this.primary = false,
  });

  final String label;
  final int value;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final col = k.scoreColor(value);
    return Container(
      height: 30,
      padding: const EdgeInsets.only(left: 10, right: 12),
      decoration: BoxDecoration(
        color: primary
            ? col.withValues(alpha: 0.14)
            : Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: primary ? col.withValues(alpha: 0.25) : k.line,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: col, shape: BoxShape.circle),
          ),
          const SizedBox(width: 7),
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: k.muted,
                ),
          ),
          const SizedBox(width: 7),
          Text('$value', style: korasSerif(15, color: k.ink900)),
        ],
      ),
    );
  }
}
