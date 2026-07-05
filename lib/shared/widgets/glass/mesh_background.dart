import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

/// Layered mesh-gradient backdrop painted behind every glass screen.
///
/// Transcribed from the warm-light `mesh` stack in
/// `handoffs/koras-mobile-handoff/koras-tokens.jsx`: a base vertical gradient
/// plus three soft radial blooms (two warm, one cool) anchored to the corners.
class MeshBackground extends StatelessWidget {
  const MeshBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Base vertical wash.
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [KorasColors.meshBaseTop, KorasColors.meshBaseBottom],
            ),
          ),
        ),
        // Warm bloom — top-left.
        const _Bloom(
          center: Alignment(-0.84, -1.12),
          radius: 1.1,
          color: KorasColors.meshWarm1,
          stop: 0.55,
        ),
        // Warm bloom — top-right.
        const _Bloom(
          center: Alignment(1.0, -1.0),
          radius: 1.0,
          color: KorasColors.meshWarm2,
          stop: 0.5,
        ),
        // Cool bloom — bottom-centre.
        const _Bloom(
          center: Alignment(0.0, 1.24),
          radius: 1.1,
          color: KorasColors.meshCool,
          stop: 0.6,
        ),
        if (child != null) child!,
      ],
    );
  }
}

class _Bloom extends StatelessWidget {
  const _Bloom({
    required this.center,
    required this.radius,
    required this.color,
    required this.stop,
  });

  final Alignment center;
  final double radius;
  final Color color;
  final double stop;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: center,
          radius: radius,
          colors: [color, color.withValues(alpha: 0)],
          stops: [0, stop],
        ),
      ),
    );
  }
}
