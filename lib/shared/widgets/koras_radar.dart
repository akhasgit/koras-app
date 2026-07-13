import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// One labelled dimension of the radar.
class KorasRadarDim {
  const KorasRadarDim(this.label, this.value);
  final String label;
  final int value; // 0–100
}

/// Pentagon radar / spider chart with grid rings, spokes, filled polygon,
/// vertex dots and uppercase tip labels.
/// Port of `Radar5` in `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasRadar extends StatelessWidget {
  const KorasRadar({super.key, required this.dims, this.size = 130});

  final List<KorasRadarDim> dims;
  final double size;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RadarPainter(
          values: dims.map((d) => d.value / 100.0).toList(),
          labels: dims.map((d) => d.label).toList(),
          fill: k.ember.withValues(alpha: 0.18),
          stroke: k.ember,
          grid: k.line,
          labelColor: k.muted,
        ),
      ),
    );
  }
}

class _RadarPainter extends CustomPainter {
  _RadarPainter({
    required this.values,
    required this.labels,
    required this.fill,
    required this.stroke,
    required this.grid,
    required this.labelColor,
  });

  final List<double> values;
  final List<String> labels;
  final Color fill, stroke, grid, labelColor;

  @override
  void paint(Canvas canvas, Size size) {
    final n = values.length;
    final cx = size.width / 2;
    final cy = size.height / 2;
    const labelPad = 18.0;
    final r = (size.shortestSide / 2) - labelPad;

    double angle(int i) => -math.pi / 2 + (2 * math.pi / n) * i;

    Offset vertex(int i, double fraction) => Offset(
        cx + r * fraction * math.cos(angle(i)),
        cy + r * fraction * math.sin(angle(i)));

    final gridPaint = Paint()
      ..color = grid
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    for (final frac in [0.33, 0.66, 1.0]) {
      final path = Path();
      for (var i = 0; i < n; i++) {
        final v = vertex(i, frac);
        i == 0 ? path.moveTo(v.dx, v.dy) : path.lineTo(v.dx, v.dy);
      }
      path.close();
      canvas.drawPath(path, gridPaint);
    }

    for (var i = 0; i < n; i++) {
      canvas.drawLine(Offset(cx, cy), vertex(i, 1.0), gridPaint);
    }

    final fillPath = Path();
    for (var i = 0; i < n; i++) {
      final v = vertex(i, values[i].clamp(0.0, 1.0));
      i == 0 ? fillPath.moveTo(v.dx, v.dy) : fillPath.lineTo(v.dx, v.dy);
    }
    fillPath.close();
    canvas.drawPath(fillPath, Paint()..color = fill);
    canvas.drawPath(
      fillPath,
      Paint()
        ..color = stroke
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5
        ..strokeJoin = StrokeJoin.round,
    );

    final dotPaint = Paint()..color = stroke;
    for (var i = 0; i < n; i++) {
      canvas.drawCircle(vertex(i, values[i].clamp(0.0, 1.0)), 2.5, dotPaint);
    }

    for (var i = 0; i < n; i++) {
      final a = angle(i);
      final lx = cx + (r + labelPad * 0.55) * math.cos(a);
      final ly = cy + (r + labelPad * 0.55) * math.sin(a);
      final tp = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: TextStyle(
            color: labelColor,
            fontSize: 8.5,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        textDirection: ui.TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(lx - tp.width / 2, ly - tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(_RadarPainter old) => old.values != values;
}
