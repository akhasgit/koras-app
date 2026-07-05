import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

enum EyebrowTone { neutral, ember, cream }

/// Mono uppercase tracked label (eyebrow).
class KorasEyebrow extends StatelessWidget {
  const KorasEyebrow(
      {super.key, required this.text, this.tone = EyebrowTone.neutral});

  final String text;
  final EyebrowTone tone;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final color = switch (tone) {
      EyebrowTone.neutral => k.ink500,
      EyebrowTone.ember => k.ember,
      EyebrowTone.cream => k.paperWarm,
    };
    return Text(
      text.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
    );
  }
}
