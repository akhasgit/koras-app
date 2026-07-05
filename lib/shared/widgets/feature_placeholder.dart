import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';
import 'koras_eyebrow.dart';
import 'koras_screen.dart';

/// Temporary screen body for features not yet fleshed out. Keeps routing +
/// navigation working with a branded, honest "coming together" state.
class FeaturePlaceholder extends StatelessWidget {
  const FeaturePlaceholder({
    super.key,
    required this.title,
    this.note,
    this.eyebrow,
  });

  final String title;
  final String? note;
  final String? eyebrow;

  @override
  Widget build(BuildContext context) {
    return KorasScreen(
      title: title,
      children: [
        const SizedBox(height: 24),
        if (eyebrow != null) ...[
          KorasEyebrow(text: eyebrow!),
          const SizedBox(height: 8),
        ],
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          note ?? 'This screen is part of the Koras build.',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: context.koras.ink500),
        ),
      ],
    );
  }
}
