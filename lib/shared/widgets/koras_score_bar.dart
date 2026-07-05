import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Horizontal score track + ember fill, used in dimension breakdowns.
class KorasScoreBar extends StatelessWidget {
  const KorasScoreBar({
    super.key,
    required this.value,
    this.max = 100,
    this.label,
  });

  final int value;
  final int max;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final fraction = (value / max).clamp(0.0, 1.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label!, style: Theme.of(context).textTheme.bodyMedium),
                Text('$value',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: k.ink500)),
              ],
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: fraction,
            minHeight: 8,
            backgroundColor: k.line,
            valueColor: AlwaysStoppedAnimation(k.ember),
          ),
        ),
      ],
    );
  }
}
