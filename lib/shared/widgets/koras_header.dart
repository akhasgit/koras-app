import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';
import '../../core/theme/typography.dart';
import 'glass/glass_card.dart';

/// Screen header — optional back button, uppercase kicker, italic serif title,
/// optional subtitle and a trailing widget (e.g. the avatar menu).
/// Port of `Header` in `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasHeader extends StatelessWidget {
  const KorasHeader({
    super.key,
    required this.title,
    this.kicker,
    this.subtitle,
    this.italic = true,
    this.big = false,
    this.onBack,
    this.trailing,
  });

  final String title;
  final String? kicker;
  final String? subtitle;
  final bool italic;
  final bool big;
  final VoidCallback? onBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final titleStyle = (italic ? korasSerifItalic : korasSerif)(
      big ? 30 : 23,
      height: 1.05,
      color: k.ink900,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (onBack != null) ...[
            GlassCard(
              radius: 999,
              padding: EdgeInsets.zero,
              onTap: onBack,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(Icons.chevron_left, color: k.ink900),
              ),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (kicker != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      kicker!.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: k.muted, letterSpacing: 1.6),
                    ),
                  ),
                Text(title, style: titleStyle),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      subtitle!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: k.muted),
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
