import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/errors/app_error.dart';
import '../../../shared/widgets/koras_badge.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/assessments_repository.dart';

class AssessmentHistoryScreen extends ConsumerWidget {
  const AssessmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(assessmentHistoryProvider);
    return KorasScreen(
      title: 'History',
      child: history.when(
        loading: () => const KorasLoading(),
        error: (e, _) => KorasError(message: errorToMessage(e)),
        data: (items) {
          if (items.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Text('No assessments yet.'),
            );
          }
          final df = DateFormat.yMMMd().add_jm();
          return Column(
            children: [
              for (final a in items) ...[
                KorasCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Overall ${a.scores.overall}',
                              style: Theme.of(context).textTheme.titleMedium),
                          if (a.createdAt != null)
                            Text(df.format(a.createdAt!.toLocal()),
                                style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      if (a.isBaseline)
                        const KorasBadge(
                            label: 'Baseline', tone: BadgeTone.ember),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ],
          );
        },
      ),
    );
  }
}
