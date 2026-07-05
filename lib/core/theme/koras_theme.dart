import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography.dart';

/// Brand token bundle exposed as a [ThemeExtension]. Read via `context.koras.*`;
/// never re-declare brand hex inline. See `all_docs/mobile/11-design-system.md`.
@immutable
class KorasTheme extends ThemeExtension<KorasTheme> {
  const KorasTheme({
    required this.cream,
    required this.ink900,
    required this.ink700,
    required this.ink500,
    required this.ink300,
    required this.ember,
    required this.emberPressed,
    required this.emberSoft,
    required this.paper,
    required this.paperWarm,
    required this.line,
    required this.success,
    required this.warning,
    required this.danger,
    required this.containerMax,
    required this.cardRadius,
  });

  final Color cream, ink900, ink700, ink500, ink300;
  final Color ember, emberPressed, emberSoft;
  final Color paper, paperWarm, line;
  final Color success, warning, danger;

  /// Max content width (72rem ≈ 1152.0).
  final double containerMax;

  /// Card corner radius (24.0).
  final double cardRadius;

  static const light = KorasTheme(
    cream: KorasColors.cream,
    ink900: KorasColors.ink900,
    ink700: KorasColors.ink700,
    ink500: KorasColors.ink500,
    ink300: KorasColors.ink300,
    ember: KorasColors.ember,
    emberPressed: KorasColors.emberPressed,
    emberSoft: KorasColors.emberSoft,
    paper: KorasColors.paper,
    paperWarm: KorasColors.paperWarm,
    line: KorasColors.line,
    success: KorasColors.success,
    warning: KorasColors.warning,
    danger: KorasColors.danger,
    containerMax: 1152.0,
    cardRadius: 24.0,
  );

  @override
  KorasTheme copyWith({
    Color? cream,
    Color? ink900,
    Color? ink700,
    Color? ink500,
    Color? ink300,
    Color? ember,
    Color? emberPressed,
    Color? emberSoft,
    Color? paper,
    Color? paperWarm,
    Color? line,
    Color? success,
    Color? warning,
    Color? danger,
    double? containerMax,
    double? cardRadius,
  }) {
    return KorasTheme(
      cream: cream ?? this.cream,
      ink900: ink900 ?? this.ink900,
      ink700: ink700 ?? this.ink700,
      ink500: ink500 ?? this.ink500,
      ink300: ink300 ?? this.ink300,
      ember: ember ?? this.ember,
      emberPressed: emberPressed ?? this.emberPressed,
      emberSoft: emberSoft ?? this.emberSoft,
      paper: paper ?? this.paper,
      paperWarm: paperWarm ?? this.paperWarm,
      line: line ?? this.line,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      containerMax: containerMax ?? this.containerMax,
      cardRadius: cardRadius ?? this.cardRadius,
    );
  }

  @override
  KorasTheme lerp(ThemeExtension<KorasTheme>? other, double t) {
    if (other is! KorasTheme) return this;
    return KorasTheme(
      cream: Color.lerp(cream, other.cream, t)!,
      ink900: Color.lerp(ink900, other.ink900, t)!,
      ink700: Color.lerp(ink700, other.ink700, t)!,
      ink500: Color.lerp(ink500, other.ink500, t)!,
      ink300: Color.lerp(ink300, other.ink300, t)!,
      ember: Color.lerp(ember, other.ember, t)!,
      emberPressed: Color.lerp(emberPressed, other.emberPressed, t)!,
      emberSoft: Color.lerp(emberSoft, other.emberSoft, t)!,
      paper: Color.lerp(paper, other.paper, t)!,
      paperWarm: Color.lerp(paperWarm, other.paperWarm, t)!,
      line: Color.lerp(line, other.line, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      containerMax: containerMax + (other.containerMax - containerMax) * t,
      cardRadius: cardRadius + (other.cardRadius - cardRadius) * t,
    );
  }
}

/// Ergonomic accessor: `context.koras.ember`.
extension KorasThemeX on BuildContext {
  KorasTheme get koras => Theme.of(this).extension<KorasTheme>()!;
}

/// The complete app [ThemeData] — Material 3, light only in V1.
ThemeData buildKorasTheme() {
  const k = KorasTheme.light;
  final scheme = ColorScheme.fromSeed(
    seedColor: k.ember,
    brightness: Brightness.light,
  ).copyWith(
    primary: k.ember,
    onPrimary: k.paper,
    surface: k.cream,
    onSurface: k.ink900,
    outlineVariant: k.line,
    error: k.danger,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: k.cream,
    textTheme: buildTextTheme(),
    extensions: const [k],
    cardTheme: CardThemeData(
      color: k.paperWarm,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: k.line),
        borderRadius: BorderRadius.all(Radius.circular(k.cardRadius)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: k.ember,
        foregroundColor: k.paper,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: k.ink900,
        side: BorderSide(color: k.line),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: k.paper,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: k.line),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: k.line),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: k.ember, width: 2),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: k.paper,
      indicatorColor: k.emberSoft,
      surfaceTintColor: Colors.transparent,
    ),
    dividerTheme: DividerThemeData(color: k.line, thickness: 1),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: k.emberSoft,
      cursorColor: k.ember,
    ),
    focusColor: k.ember,
  );
}
