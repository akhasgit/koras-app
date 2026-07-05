import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/theme/koras_theme.dart';

/// Live waveform fed by the recorder's dBFS amplitude stream. Keeps a rolling
/// buffer of recent levels and maps dBFS → bar height. See 10/12.
class Waveform extends StatefulWidget {
  const Waveform({
    super.key,
    required this.amplitudeStream,
    this.bars = 48,
    this.height = 96,
  });

  /// Stream of current amplitude in dBFS (negative; 0 == max).
  final Stream<double> amplitudeStream;
  final int bars;
  final double height;

  @override
  State<Waveform> createState() => _WaveformState();
}

class _WaveformState extends State<Waveform> {
  late final List<double> _levels =
      List<double>.filled(widget.bars, -60.0, growable: false);

  @override
  void initState() {
    super.initState();
    widget.amplitudeStream.listen(_push);
  }

  void _push(double db) {
    if (!mounted) return;
    setState(() {
      for (var i = 0; i < _levels.length - 1; i++) {
        _levels[i] = _levels[i + 1];
      }
      _levels[_levels.length - 1] = db;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: CustomPaint(
        painter: _BarsPainter(
          levels: _levels,
          color: context.koras.ember,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _BarsPainter extends CustomPainter {
  _BarsPainter({required this.levels, required this.color});

  final List<double> levels;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final n = levels.length;
    if (n == 0) return;
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = math.max(2.0, size.width / (n * 1.8));
    final gap = size.width / n;
    final mid = size.height / 2;

    for (var i = 0; i < n; i++) {
      final db = levels[i];
      final v = (db.clamp(-60.0, 0.0) + 60.0) / 60.0; // -60..0 dB → 0..1
      final envelope =
          0.5 + 0.5 * math.sin((i / (n - 1)) * math.pi); // taller in middle
      final h = (v * envelope * size.height).clamp(2.0, size.height);
      final x = gap * i + gap / 2;
      canvas.drawLine(Offset(x, mid - h / 2), Offset(x, mid + h / 2), paint);
    }
  }

  @override
  bool shouldRepaint(_BarsPainter oldDelegate) => true;
}
