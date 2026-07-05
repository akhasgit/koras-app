import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/avatar_menu_button.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_header.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_score_bar.dart';
import '../../../shared/widgets/koras_score_ring.dart';
import '../../dashboard/data/voice_assessment.dart';
import '../../daily_plan/data/daily_plan_repository.dart';
import '../../daily_plan/presentation/widgets/todays_plan_card.dart';
import '../../learner_insights/data/learner_insights.dart';
import 'learner_home_provider.dart';

/// Today — the learner/student home. Glass restyle centred on the daily plan
/// task (see MOBILE_LIQUID_GLASS_REDESIGN_PLAN.md §3.2).
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
        final firstName =
            (profile?.fullName?.trim().isNotEmpty == true)
                ? profile!.fullName!.trim().split(RegExp(r'\s+')).first
                : 'there';
        final statusBarH = MediaQuery.paddingOf(context).top;
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(learnerHomeProvider);
            await ref.read(learnerHomeProvider.future);
          },
          child: ListView(
            padding: EdgeInsets.only(top: statusBarH + 8, bottom: 110),
            children: [
              KorasHeader(
                kicker: DateFormat('EEEE, MMMM d').format(DateTime.now()),
                title: 'Hi, $firstName',
                italic: false,
                trailing: profile != null
                    ? AvatarMenuButton(profile: profile)
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    if (data.insights != null) ...[
                      _StreakCard(insights: data.insights!),
                      const SizedBox(height: 14),
                    ],
                    // Always render the warm-up section – shows empty state
                    // if the daily plan API hasn't generated a plan yet.
                    TodaysPlanCard(
                      plan: data.plan,
                      onComplete: data.plan == null
                          ? null
                          : (item, status) async {
                              await ref
                                  .read(dailyPlanRepositoryProvider)
                                  .completeItem(
                                      data.plan!.id, item.itemId, status);
                              ref.invalidate(currentDailyPlanProvider);
                              ref.invalidate(learnerHomeProvider);
                            },
                    ),
                    const SizedBox(height: 14),
                    if (data.latest != null)
                      _VoiceSnapshot(
                        latest: data.latest!,
                        insights: data.insights,
                      )
                    else
                      _FirstAssessmentCard(),
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

class _StreakCard extends StatelessWidget {
  const _StreakCard({required this.insights});
  final LearnerInsights insights;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final streak = insights.currentStreakDays;
    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final filled = streak.clamp(0, 7);
    return GlassCard(
      radius: 26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: k.ember.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Icon(LucideIcons.flame, size: 21, color: k.accentDeep),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$streak-day streak',
                        style: korasSerifItalic(20, color: k.ink900)),
                    Text(
                      streak > 0
                          ? 'Keep it alive — a read a day'
                          : 'Start a streak today',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: k.muted),
                    ),
                  ],
                ),
              ),
              if (streak > 0)
                const KorasPill(
                    label: 'On track',
                    tone: PillTone.success,
                    icon: LucideIcons.check),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              for (var i = 0; i < 7; i++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: i == 6 ? 0 : 6),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: i < filled ? k.ember : k.line,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: i < filled
                              ? Icon(LucideIcons.check,
                                  size: 15, color: k.onAccent)
                              : null,
                        ),
                        const SizedBox(height: 4),
                        Text(days[i],
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: k.muted)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VoiceSnapshot extends StatelessWidget {
  const _VoiceSnapshot({required this.latest, this.insights});
  final VoiceAssessment latest;
  final LearnerInsights? insights;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final trend = (insights?.improvementLast30d ?? 0).round();
    return GlassCard(
      radius: 26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your voice this week', style: korasSerifItalic(17, color: k.ink900)),
              if (trend != 0)
                Row(
                  children: [
                    Text(trend > 0 ? '+$trend' : '$trend',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: trend > 0 ? k.success : k.danger,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(width: 4),
                    Icon(
                        trend > 0
                            ? LucideIcons.trendingUp
                            : LucideIcons.trendingDown,
                        size: 15,
                        color: trend > 0 ? k.success : k.danger),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KorasScoreRing(value: latest.scores.overall, size: 84),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    KorasScoreBar(
                        value: latest.scores.clarity, label: 'Clarity'),
                    const SizedBox(height: 10),
                    KorasScoreBar(value: latest.scores.pace, label: 'Pace'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FirstAssessmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      strong: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Record your first assessment',
              style: korasSerif(20, color: k.ink900)),
          const SizedBox(height: 8),
          Text(
            'Complete a voice assessment to unlock your scores and a tailored plan.',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: k.ink700),
          ),
          const SizedBox(height: 16),
          KorasButton.primary(
            onPressed: () => context.go('/app/dashboard/assess?baseline=1'),
            child: const Text('Start assessment'),
          ),
        ],
      ),
    );
  }
}
