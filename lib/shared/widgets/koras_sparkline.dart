import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Trend sparkline — polyline + soft area fill + end dot.
/// Port of `Sparkline` in `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasSparkline extends StatelessWidget {
  const KorasSparkline({
    super.key,
    required this.points,
    this.height = 48,
    this.color,
    this.fill = true,
  });

  final List<num> points;
  final double height;
  final Color? color;
  final bool fill;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    if (points.length < 2) {
      return SizedBox(height: height);
    }
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _SparklinePainter(
          points: points.map((p) => p.toDouble()).toList(),
          color: color ?? k.ember,
          fill: fill,
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  _SparklinePainter({
    required this.points,
    required this.color,
    required this.fill,
  });

  final List<double> points;
  final Color color;
  final bool fill;

  @override
  void paint(Canvas canvas, Size size) {
    final max = points.reduce((a, b) => a > b ? a : b);
    final min = points.reduce((a, b) => a < b ? a : b);
    final range = (max - min) == 0 ? 1.0 : (max - min);
    final sx = size.width / (points.length - 1);
    double sy(double v) => size.height - 4 - ((v - min) / range) * (size.height - 8);

    final line = Path()..moveTo(0, sy(points[0]));
    for (var i = 1; i < points.length; i++) {
      line.lineTo(i * sx, sy(points[i]));
    }

    if (fill) {
      final area = Path.from(line)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close();
      canvas.drawPath(area, Paint()..color = color.withValues(alpha: 0.14));
    }

    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // End dot.
    canvas.drawCircle(
      Offset((points.length - 1) * sx, sy(points.last)),
      2.6,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(_SparklinePainter old) =>
      old.points != points || old.color != color || old.fill != fill;
}
