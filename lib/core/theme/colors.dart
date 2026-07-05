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

  // ── Liquid Glass tokens (warm-light) ──────────────────────────────────
  // Transcribed from `handoffs/koras-mobile-handoff/koras-tokens.jsx`.
  /// Deep accent for text emphasis + score bands (handoff `accentDeep`).
  static const accentDeep = Color(0xFFE8631F);

  /// Warm amber for "warn" pills (handoff `warn`, light).
  static const warn = Color(0xFFD98A2B);

  /// Foreground on the accent fill.
  static const onAccent = Color(0xFFFFFFFF);

  /// Muted body/label text (handoff `muted`).
  static const muted = Color(0xFF6B7280);

  // Frosted card surfaces (white at varying opacity).
  static const glassFill = Color(0x8CFFFFFF); // white @ 0.55
  static const glassFillStrong = Color(0xBDFFFFFF); // white @ 0.74
  static const glassBorder = Color(0xBFFFFFFF); // white @ 0.75
  static const glassSheen = Color(0xA6FFFFFF); // white @ 0.65

  // Mesh gradient tints painted behind every screen.
  static const meshWarm1 = Color(0xFFFFE7D6);
  static const meshWarm2 = Color(0xFFFFF1E0);
  static const meshCool = Color(0xFFEDE6F6);
  static const meshBaseTop = Color(0xFFFBF8F3);
  static const meshBaseBottom = Color(0xFFF6F1E9);
}
