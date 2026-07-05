import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Three families mirroring the web: Fraunces (display), Inter (body/UI),
/// JetBrains Mono (technical). In development these resolve via `google_fonts`;
/// for release, bundle the `.ttf` files and the named families resolve locally
/// (see `all_docs/mobile/11-design-system.md`).
///
/// `letterSpacing` is in logical pixels, so an em value becomes `em * fontSize`.
TextTheme buildTextTheme() {
  TextStyle display(double size, FontWeight weight, double trackingEm,
          {double? height}) =>
      GoogleFonts.fraunces(
        fontSize: size,
        fontWeight: weight,
        letterSpacing: trackingEm * size,
        height: height,
      );

  TextStyle sans(double size, FontWeight weight,
          {double? height, List<FontFeature>? features, double? tracking}) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: tracking,
        fontFeatures: features,
      );

  return TextTheme(
    displayLarge: display(48, FontWeight.w600, -0.03, height: 1.05),
    displayMedium: display(36, FontWeight.w600, -0.03, height: 1.08),
    displaySmall: display(30, FontWeight.w500, -0.02, height: 1.1),
    headlineMedium: display(28, FontWeight.w500, -0.02),
    headlineSmall: display(24, FontWeight.w500, -0.02),
    titleLarge: sans(20, FontWeight.w600),
    titleMedium: sans(16, FontWeight.w600),
    titleSmall: sans(14, FontWeight.w600),
    bodyLarge: sans(
      16,
      FontWeight.w400,
      height: 1.5,
      features: [
        FontFeature.stylisticSet(1),
        FontFeature.characterVariant(11),
      ],
    ),
    bodyMedium: sans(14, FontWeight.w400, height: 1.5),
    bodySmall: sans(12, FontWeight.w400, height: 1.4),
    labelLarge: sans(14, FontWeight.w500),
    labelMedium: sans(12, FontWeight.w500),
    // Eyebrow / mono label.
    labelSmall: GoogleFonts.jetBrainsMono(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.12 * 12,
    ),
  );
}
