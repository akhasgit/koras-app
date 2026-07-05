import 'package:flutter/material.dart';

/// Canonical brand colour tokens, transcribed 1:1 from `koras-web/globals.css`.
/// Prefer reading these via `context.koras.*` (see [koras_theme.dart]); this
/// file is the single hex source the [KorasTheme] extension is built from.
abstract final class KorasColors {
  static const cream = Color(0xFFFAF7F2);
  static const ink900 = Color(0xFF0A1F44);
  static const ink700 = Color(0xFF1E3A6B);
  static const ink500 = Color(0xFF4A5A7A);
  static const ink300 = Color(0xFF8994A8);
  static const ember = Color(0xFFFF7A3D);
  static const emberPressed = Color(0xFFE05A2B);
  static const emberSoft = Color(0xFFFFE8DC);
  static const paper = Color(0xFFFFFFFF);
  static const paperWarm = Color(0xFFF5F1E8);
  static const line = Color(0xFFE8E2D5);

  // Semantic scoring colours (used by score rings / trend chips).
  static const success = Color(0xFF2E9E6B);
  static const warning = Color(0xFFE0A53A);
  static const danger = Color(0xFFD45A4E);
}
