import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Brand card: `paperWarm` fill, 1px `line` border, 24-radius corners.
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: k.paperWarm,
        borderRadius: radius,
        border: Border.all(color: k.line),
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
