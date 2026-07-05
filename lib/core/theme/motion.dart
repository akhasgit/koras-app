import 'package:flutter/material.dart';

/// Brand motion constants. Two CSS keyframes port to controllers elsewhere:
/// `pulse` (record button glow) and `wave` (waveform bars). See 11 / 12.
abstract final class KorasMotion {
  static const fast = Duration(milliseconds: 150);
  static const medium = Duration(milliseconds: 280);
  static const slow = Duration(milliseconds: 450);

  /// Record-button glow / waveform loop period.
  static const pulse = Duration(seconds: 2);

  static const easeOut = Curves.easeOutCubic;
  static const easeInOut = Curves.easeInOutCubic;

  /// Honour the OS "reduce motion" accessibility setting.
  static bool reduced(BuildContext context) =>
      MediaQuery.maybeOf(context)?.disableAnimations ?? false;
}
