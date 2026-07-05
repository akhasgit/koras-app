import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/app_error.dart';
import '../../../shared/widgets/feature_placeholder.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../../learner_insights/data/learner_insights_repository.dart';
import '../../learner_insights/presentation/widgets/progress_card.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insights = ref.watch(learnerInsightsProvider);
    return KorasScreen(
      title: 'Progress',
      child: insights.when(
        loading: () => const KorasLoading(),
        error: (e, _) => KorasError(message: errorToMessage(e)),
        data: (data) => data == null
            ? const FeaturePlaceholder(
                title: 'No progress yet',
                note: 'Complete a session to start tracking your progress.',
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ProgressCard(insights: data),
              ),
      ),
    );
  }
}
