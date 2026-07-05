import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Score arc (0–100): line-coloured track + ember sweep.
class KorasScoreRing extends StatelessWidget {
  const KorasScoreRing({
    super.key,
    required this.value,
    this.label,
    this.size = 160,
  });

  final int value;
  final String? label;
  final double size;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final clamped = value.clamp(0, 100);
    return Semantics(
      label: '${label ?? 'Score'} $clamped out of 100',
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _RingPainter(
            value: clamped / 100,
            track: k.line,
            sweep: k.ember,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$clamped',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: k.ink900),
                ),
                if (label != null)
                  Text(
                    label!,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: k.ink500),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.value, required this.track, required this.sweep});

  final double value;
  final Color track;
  final Color sweep;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 12.0;
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = (size.shortestSide - stroke) / 2;
    final trackPaint = Paint()
      ..color = track
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;
    final sweepPaint = Paint()
      ..color = sweep
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, trackPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * value,
      false,
      sweepPaint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.value != value || old.sweep != sweep || old.track != track;
}
