import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Entry choreography via `flutter_animate`; honours reduced motion.
class KorasFadeIn extends StatelessWidget {
  const KorasFadeIn({super.key, required this.child, this.delayMs = 0});

  final Widget child;
  final int delayMs;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;
    return child
        .animate(delay: Duration(milliseconds: delayMs))
        .fadeIn(
            duration: const Duration(milliseconds: 450), curve: Curves.easeOut)
        .slideY(
          begin: 0.06,
          end: 0,
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeOut,
        );
  }
}
