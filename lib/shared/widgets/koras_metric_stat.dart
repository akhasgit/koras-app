import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';
import '../../core/theme/typography.dart';

/// Centred stat cell — italic serif value + uppercase label underneath.
/// Port of `MetricStat` in `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasMetricStat extends StatelessWidget {
  const KorasMetricStat({
    super.key,
    required this.value,
    required this.label,
    this.unit,
    this.color,
  });

  final String value;
  final String label;
  final String? unit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: value,
            style: korasSerifItalic(22, color: color ?? k.ink900, height: 1),
            children: [
              if (unit != null)
                TextSpan(
                  text: unit,
                  style: korasSerif(13, color: color ?? k.ink900)
                      .copyWith(fontStyle: FontStyle.normal),
                ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontSize: 10, color: k.muted, letterSpacing: 1.2),
        ),
      ],
    );
  }
}
