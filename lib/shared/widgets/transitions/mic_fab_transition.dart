import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Expand / collapse transition anchored at the centre-mic FAB in the tab bar.
/// Used when pushing/popping [AiTutorScreen] from the bottom nav mic button.
Alignment micFabAlignment(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  final bottomInset = MediaQuery.paddingOf(context).bottom;
  const barHeight = KorasTabBarMetrics.height;
  final bottomPad = math.max(6.0, bottomInset - 6);
  final fabCenterY = size.height - bottomPad - barHeight / 2;
  return Alignment(0, (fabCenterY / size.height) * 2 - 1);
}

/// Tab bar dimensions — keep in sync with [KorasTabBar].
abstract final class KorasTabBarMetrics {
  static const double height = 66;
}

Widget micFabExpandTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final origin = micFabAlignment(context);
  final curved = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );
  final fade = CurvedAnimation(
    parent: animation,
    curve: const Interval(0.0, 0.55, curve: Curves.easeOut),
    reverseCurve: const Interval(0.4, 1.0, curve: Curves.easeIn),
  );
  final scale = Tween<double>(begin: 0.08, end: 1.0).animate(curved);

  return ScaleTransition(
    scale: scale,
    alignment: origin,
    child: FadeTransition(
      opacity: fade,
      child: child,
    ),
  );
}
