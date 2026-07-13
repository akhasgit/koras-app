import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Brand card — Liquid Glass surface: translucent fill, hairline glass border,
/// top sheen and a soft drop shadow. Blur-free (cheap) variant of [GlassCard]
/// so it can be used liberally in lists without stacking backdrop filters.
class KorasCard extends StatelessWidget {
  const KorasCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final radius = BorderRadius.circular(k.cardRadius);
    final body = Padding(padding: padding, child: child);
    return Container(
      decoration: BoxDecoration(
        color: k.glassFillStrong,
        borderRadius: radius,
        border: Border.all(color: k.glassBorder, width: 0.75),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF141428).withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: radius,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            k.glassSheen.withValues(alpha: 0.3),
            k.glassSheen.withValues(alpha: 0),
          ],
          stops: const [0, 0.3],
        ),
      ),
      child: onTap == null
          ? body
          : Material(
              color: Colors.transparent,
              child: InkWell(borderRadius: radius, onTap: onTap, child: body),
            ),
    );
  }
}
