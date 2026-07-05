import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/koras_theme.dart';

/// Frosted "Liquid Glass" surface — translucent fill, backdrop blur, hairline
/// border, a top sheen highlight and a soft drop shadow.
///
/// Port of `Glass` / `glassStyle()` in
/// `handoffs/koras-mobile-handoff/koras-ui.jsx` + `koras-tokens.jsx`.
class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.strong = false,
    this.radius = 24,
    this.blur = 26,
    this.padding = const EdgeInsets.all(20),
    this.onTap,
    this.clipContent = true,
  });

  final Widget child;

  /// Uses the more opaque fill (hero cards).
  final bool strong;
  final double radius;
  final double blur;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  /// When false, children can overflow the rounded bounds (e.g. blur blobs
  /// are handled by the caller). Defaults to clipping to the radius.
  final bool clipContent;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final br = BorderRadius.circular(radius);

    Widget content = Padding(padding: padding, child: child);
    if (onTap != null) {
      content = Material(
        color: Colors.transparent,
        child: InkWell(borderRadius: br, onTap: onTap, child: content),
      );
    }

    final surface = Container(
      decoration: BoxDecoration(
        color: strong ? k.glassFillStrong : k.glassFill,
        borderRadius: br,
        border: Border.all(color: k.glassBorder, width: 0.75),
      ),
      // Subtle top sheen — fades out by ~30% of the card height.
      foregroundDecoration: BoxDecoration(
        borderRadius: br,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            k.glassSheen.withValues(alpha: 0.35),
            k.glassSheen.withValues(alpha: 0),
          ],
          stops: const [0, 0.3],
        ),
      ),
      child: content,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: br,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF141428).withValues(alpha: 0.10),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: br,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur / 2, sigmaY: blur / 2),
          child: surface,
        ),
      ),
    );
  }
}
