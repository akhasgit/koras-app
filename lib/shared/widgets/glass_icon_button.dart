import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Circular glass action chip (header trailing actions, e.g. "+", filter).
class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 40,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: k.glassFillStrong,
            shape: BoxShape.circle,
            border: Border.all(color: k.glassBorder, width: 0.75),
          ),
          child: Icon(icon, size: size * 0.45, color: k.ink900),
        ),
      ),
    );
  }
}
