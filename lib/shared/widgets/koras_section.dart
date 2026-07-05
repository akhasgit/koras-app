import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Centres content at `containerMax` (1152) with phone padding.
class KorasSection extends StatelessWidget {
  const KorasSection({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final maxWidth = context.koras.containerMax;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
