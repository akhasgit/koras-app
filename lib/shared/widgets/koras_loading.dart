import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Brand loading state — a centred ember spinner on the scaffold background.
class KorasLoading extends StatelessWidget {
  const KorasLoading({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: k.ember, strokeWidth: 3),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(message!, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }
}
