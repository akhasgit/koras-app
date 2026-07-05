import 'package:flutter/material.dart';

import '../../../core/theme/koras_theme.dart';

/// Wraps a child in a slow expanding/fading ember halo so an idle record
/// button invites a tap. See `all_docs/mobile/10-widget-library.md`.
class PulseDecoration extends StatefulWidget {
  const PulseDecoration({
    super.key,
    required this.child,
    this.active = true,
    this.size = 96,
  });

  final Widget child;
  final bool active;
  final double size;

  @override
  State<PulseDecoration> createState() => _PulseDecorationState();
}

class _PulseDecorationState extends State<PulseDecoration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1800),
  )..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ember = context.koras.ember;
    if (!widget.active) return widget.child;
    return SizedBox(
      width: widget.size * 1.6,
      height: widget.size * 1.6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _c,
            builder: (context, _) {
              final t = _c.value;
              return Container(
                width: widget.size + (widget.size * 0.6 * t),
                height: widget.size + (widget.size * 0.6 * t),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ember.withValues(alpha: (1 - t) * 0.25),
                ),
              );
            },
          ),
          widget.child,
        ],
      ),
    );
  }
}
