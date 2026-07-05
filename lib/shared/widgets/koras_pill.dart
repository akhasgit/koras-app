import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

enum PillTone { glass, accent, success, warn, solid }

/// Small rounded status/label pill with an optional leading icon.
/// Port of `Pill` in `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasPill extends StatelessWidget {
  const KorasPill({
    super.key,
    required this.label,
    this.tone = PillTone.glass,
    this.icon,
  });

  final String label;
  final PillTone tone;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final (bg, fg, border) = switch (tone) {
      PillTone.glass => (
          k.glassFillStrong,
          k.ink900,
          k.glassBorder,
        ),
      PillTone.accent => (
          k.accentDeep.withValues(alpha: 0.12),
          k.accentDeep,
          k.accentDeep.withValues(alpha: 0.18),
        ),
      PillTone.success => (
          k.success.withValues(alpha: 0.16),
          k.success,
          k.success.withValues(alpha: 0.22),
        ),
      PillTone.warn => (
          k.warn.withValues(alpha: 0.16),
          k.warn,
          k.warn.withValues(alpha: 0.22),
        ),
      PillTone.solid => (k.ink900, k.cream, k.ink900),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: fg,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
          ),
        ],
      ),
    );
  }
}
