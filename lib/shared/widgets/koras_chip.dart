import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Segmented filter chip. Port of `Chip` in
/// `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasChip extends StatelessWidget {
  const KorasChip({
    super.key,
    required this.label,
    this.active = false,
    this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Material(
      color: active ? k.ember : k.glassFill,
      shape: StadiumBorder(
        side: active ? BorderSide.none : BorderSide(color: k.line),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: active ? k.onAccent : k.ink700,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
