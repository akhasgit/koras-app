import 'package:flutter/material.dart';

import '../../../../core/theme/koras_theme.dart';

/// Breathing orb shown during a live AI Tutor session. Pulses ember while the
/// session is live. See 10.
class VoiceOrb extends StatefulWidget {
  const VoiceOrb({super.key, this.label});
  final String? label;

  @override
  State<VoiceOrb> createState() => _VoiceOrbState();
}

class _VoiceOrbState extends State<VoiceOrb>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _c,
          builder: (context, _) {
            final t = _c.value;
            return Container(
              width: 140 + 24 * t,
              height: 140 + 24 * t,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [k.ember, k.emberPressed],
                ),
                boxShadow: [
                  BoxShadow(
                    color: k.ember.withValues(alpha: 0.35 * (1 - t)),
                    blurRadius: 40 + 30 * t,
                    spreadRadius: 8 * t,
                  ),
                ],
              ),
            );
          },
        ),
        if (widget.label != null) ...[
          const SizedBox(height: 20),
          Text(widget.label!, style: Theme.of(context).textTheme.titleMedium),
        ],
      ],
    );
  }
}
