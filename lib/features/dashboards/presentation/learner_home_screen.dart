import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/errors/app_error.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_fade_in.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_section.dart';
import '../../dashboard/presentation/widgets/coach_card.dart';
import '../../dashboard/presentation/widgets/score_summary.dart';
import '../../daily_plan/data/daily_plan_repository.dart';
import '../../daily_plan/presentation/widgets/todays_plan_card.dart';
import '../../learner_insights/presentation/widgets/progress_card.dart';
import 'learner_home_provider.dart';

/// Learner home — latest assessment, coach, daily plan, progress.
class DashboardLearnerScreen extends ConsumerWidget {
  const DashboardLearnerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(learnerHomeProvider);
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    return home.when(
      loading: () => const KorasLoading(),
      error: (e, _) => KorasError(
        message: errorToMessage(e),
        onRetry: () => ref.invalidate(learnerHomeProvider),
      ),
      data: (data) {
        final greetingName = profile?.fullName ?? 'there';
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(learnerHomeProvider);
            await ref.read(learnerHomeProvider.future);
          },
          child: ListView(
            children: [
              KorasSection(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text('Hi, $greetingName',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 16),
                    if (data.insights != null)
                      KorasFadeIn(
                          child: ProgressCard(insights: data.insights!)),
                    if (data.plan != null) ...[
                      const SizedBox(height: 16),
                      KorasFadeIn(
                        delayMs: 60,
                        child: TodaysPlanCard(
                          plan: data.plan!,
                          onComplete: (item, status) async {
                            await ref
                                .read(dailyPlanRepositoryProvider)
                                .completeItem(item.itemId, status);
                            ref.invalidate(currentDailyPlanProvider);
                            ref.invalidate(learnerHomeProvider);
                          },
                        ),
                      ),
                    ],
                    if (data.latest != null) ...[
                      const SizedBox(height: 16),
                      KorasFadeIn(
                          delayMs: 120,
                          child: ScoreSummary(assessment: data.latest!)),
                      const SizedBox(height: 16),
                      CoachCard(assessment: data.latest!),
                      const SizedBox(height: 16),
                      KorasButton.secondary(
                        onPressed: () => context.go('/app/dashboard/assess'),
                        child: const Text('New assessment'),
                      ),
                    ] else ...[
                      const SizedBox(height: 16),
                      KorasCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Record your first assessment',
                                style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 8),
                            Text(
                              'Complete a voice assessment to unlock your scores and a tailored plan.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 16),
                            KorasButton.primary(
                              onPressed: () => context
                                  .go('/app/dashboard/assess?baseline=1'),
                              child: const Text('Start assessment'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
