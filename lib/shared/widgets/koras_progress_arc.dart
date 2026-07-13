import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Small circular progress arc with a centred child (e.g. "45%").
/// Port of `ProgressArc` in `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasProgressArc extends StatelessWidget {
  const KorasProgressArc({
    super.key,
    required this.value, // 0–100
    this.size = 64,
    this.strokeWidth = 6,
    this.color,
    this.child,
  });

  final num value;
  final double size;
  final double strokeWidth;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _ArcPainter(
          fraction: (value / 100).clamp(0.0, 1.0).toDouble(),
          track: k.line,
          sweep: color ?? k.ember,
          strokeWidth: strokeWidth,
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  const _ArcPainter({
    required this.fraction,
    required this.track,
    required this.sweep,
    required this.strokeWidth,
  });

  final double fraction;
  final Color track, sweep;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - strokeWidth) / 2;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = track
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * fraction,
      false,
      Paint()
        ..color = sweep
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_ArcPainter old) =>
      old.fraction != fraction || old.sweep != sweep || old.track != track;
}
