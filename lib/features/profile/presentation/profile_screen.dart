import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/glass/glass_screen.dart';
import '../../../shared/widgets/koras_avatar.dart';
import '../../../shared/widgets/koras_metric_stat.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_score_bar.dart';
import '../../../shared/widgets/koras_score_ring.dart';
import '../../auth/data/auth_repository.dart';
import '../../dashboard/data/assessments_repository.dart';
import '../../dashboard/data/voice_assessment.dart';
import '../../learner_insights/data/learner_insights.dart';
import '../../learner_insights/data/learner_insights_repository.dart';

/// Profile — identity, progress stats, latest voice score, coach feedback and
/// account actions. Reached from the header avatar menu.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    final latest = ref.watch(latestAssessmentProvider).valueOrNull;
    final insights = ref.watch(learnerInsightsProvider).valueOrNull;

    final name = profile?.fullName?.trim().isNotEmpty == true
        ? profile!.fullName!
        : (profile?.email ?? 'You');

    return GlassScreen(
      kicker: 'Account',
      title: 'Profile',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Identity ──────────────────────────────────────────────────
          GlassCard(
            strong: true,
            child: Row(
              children: [
                KorasAvatar(name: name, size: 60),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: korasSerif(20, color: k.ink900)),
                      if (profile?.email != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            profile!.email,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: k.muted),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // ── Progress stats ─────────────────────────────────────────────
          if (insights != null) ...[
            _ProgressCard(insights: insights),
            const SizedBox(height: 12),
          ],

          // ── Voice score ────────────────────────────────────────────────
          if (latest != null) ...[
            _VoiceScoreCard(latest: latest),
            const SizedBox(height: 12),
          ],

          // ── Coach feedback ─────────────────────────────────────────────
          if (latest?.coachFeedback?.trim().isNotEmpty == true) ...[
            _FeedbackCard(feedback: latest!.coachFeedback!.trim()),
            const SizedBox(height: 12),
          ],

          // ── Account actions ────────────────────────────────────────────
          GlassCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(LucideIcons.settings, color: k.ink700),
                  title: const Text('Settings'),
                  trailing: Icon(LucideIcons.chevronRight,
                      size: 18, color: k.muted),
                  onTap: () => context.push('/app/settings'),
                ),
                Divider(height: 1, color: k.line),
                ListTile(
                  leading: Icon(LucideIcons.logOut, color: k.danger),
                  title: Text('Sign out', style: TextStyle(color: k.danger)),
                  onTap: () => ref.read(authRepositoryProvider).signOut(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.insights});
  final LearnerInsights insights;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final trend = insights.improvementLast30d.round();
    return GlassCard(
      radius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress', style: korasSerifItalic(17, color: k.ink900)),
              if (trend != 0)
                KorasPill(
                  label: trend > 0 ? '+$trend in 30d' : '$trend in 30d',
                  tone: trend > 0 ? PillTone.success : PillTone.warn,
                  icon: trend > 0
                      ? LucideIcons.trendingUp
                      : LucideIcons.trendingDown,
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: KorasMetricStat(
                  value: '${insights.currentStreakDays}',
                  unit: 'd',
                  label: 'Streak',
                  color: k.ember,
                ),
              ),
              Expanded(
                child: KorasMetricStat(
                  value: '${insights.totalSessions}',
                  label: 'Sessions',
                ),
              ),
              Expanded(
                child: KorasMetricStat(
                  value: '${insights.currentLevel}',
                  label: 'Level',
                ),
              ),
              Expanded(
                child: KorasMetricStat(
                  value: '${insights.xpTotal}',
                  label: 'XP',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VoiceScoreCard extends StatelessWidget {
  const _VoiceScoreCard({required this.latest});
  final VoiceAssessment latest;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      radius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your voice score', style: korasSerifItalic(17, color: k.ink900)),
          if (latest.archetype?.trim().isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                latest.archetype!.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 10.5,
                      color: k.muted,
                      letterSpacing: 1.2,
                    ),
              ),
            ),
          const SizedBox(height: 14),
          Row(
            children: [
              KorasScoreRing(value: latest.scores.overall, size: 84),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    KorasScoreBar(value: latest.scores.pitch, label: 'Pitch'),
                    const SizedBox(height: 10),
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

class _FeedbackCard extends StatelessWidget {
  const _FeedbackCard({required this.feedback});
  final String feedback;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      radius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: k.ember.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Icon(LucideIcons.lightbulb, size: 18, color: k.accentDeep),
              ),
              const SizedBox(width: 10),
              Text("Coach's feedback",
                  style: korasSerifItalic(17, color: k.ink900)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            feedback,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: k.ink700, height: 1.45),
          ),
        ],
      ),
    );
  }
}
