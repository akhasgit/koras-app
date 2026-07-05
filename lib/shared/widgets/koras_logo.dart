import 'package:flutter/material.dart';

/// Koras brand mark from `assets/icons/appLogo.png`.
class KorasLogo extends StatelessWidget {
  const KorasLogo({super.key, this.height = 40});

  final double height;

  static const _assetPath = 'assets/icons/appLogo.png';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _assetPath,
      height: height,
      fit: BoxFit.contain,
      semanticLabel: 'Koras',
    );
  }
}
