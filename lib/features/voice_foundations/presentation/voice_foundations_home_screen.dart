import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/voice_foundations_models.dart';
import '../data/voice_foundations_repository.dart';

/// Voice Foundations programme home — 7-day plan grid + progress ring.
class VoiceFoundationsHomeScreen extends ConsumerWidget {
  const VoiceFoundationsHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(voiceFoundationsActivitiesProvider);
    final progress = ref.watch(voiceFoundationsProgressProvider);

    return KorasScreen(
      title: 'Voice Foundations',
      children: [
        const SizedBox(height: 8),
        progress.when(
          data: (p) => _ProgressCard(progress: p),
          loading: () => const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text('Could not load progress: $e'),
        ),
        const SizedBox(height: 16),
        activities.when(
          data: (list) => progress.when(
            data: (p) => _DayList(activities: list, progress: p),
            loading: () => const SizedBox.shrink(),
            error: (e, _) => Text('Error: $e'),
          ),
          loading: () => const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text('Could not load activities: $e'),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.progress});
  final VoiceFoundationsProgress progress;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final pct = progress.completionPercent.toDouble();
    return KorasCard(
      child: Row(
        children: [
          SizedBox(
            width: 68,
            height: 68,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: pct / 100,
                  strokeWidth: 8,
                  backgroundColor: k.emberSoft,
                  valueColor: AlwaysStoppedAnimation(k.ember),
                ),
                Text('${pct.round()}%',
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Day ${progress.currentDay} of ${progress.totalDays}',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  progress.nextActivityId == null
                      ? 'Programme complete!'
                      : 'Next: ${progress.nextActivityId}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: k.ink700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DayList extends StatelessWidget {
  const _DayList({required this.activities, required this.progress});
  final List<VoiceFoundationsActivity> activities;
  final VoiceFoundationsProgress progress;

  @override
  Widget build(BuildContext context) {
    final byDay = <int, List<VoiceFoundationsActivity>>{};
    for (final a in activities) {
      byDay.putIfAbsent(a.day, () => []).add(a);
    }
    final days = byDay.keys.toList()..sort();

    return Column(
      children: [
        for (final day in days)
          _DaySection(
            day: day,
            activities: byDay[day]!,
            unlocked: progress.unlockedDays.contains(day),
            activityStatus: progress.activityStatus,
          ),
      ],
    );
  }
}

class _DaySection extends StatelessWidget {
  const _DaySection({
    required this.day,
    required this.activities,
    required this.unlocked,
    required this.activityStatus,
  });
  final int day;
  final List<VoiceFoundationsActivity> activities;
  final bool unlocked;
  final Map<String, String> activityStatus;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Icon(
                unlocked ? LucideIcons.lockOpen : LucideIcons.lock,
                size: 16,
                color: unlocked ? k.ember : k.ink500,
              ),
              const SizedBox(width: 8),
              Text('Day $day',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        for (final a in activities)
          _ActivityRow(
            activity: a,
            status: activityStatus[a.id] ?? 'locked',
            enabled: unlocked,
          ),
      ],
    );
  }
}

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({
    required this.activity,
    required this.status,
    required this.enabled,
  });
  final VoiceFoundationsActivity activity;
  final String status;
  final bool enabled;

  IconData get _icon => switch (activity.type) {
        'recording' => LucideIcons.mic,
        'drill' => LucideIcons.dumbbell,
        'training' => LucideIcons.graduationCap,
        _ => LucideIcons.notebook,
      };

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final done = status == 'completed';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: KorasCard(
        onTap: enabled
            ? () => context.push(
                  '/app/voice-foundations/activity/${activity.id}',
                )
            : null,
        child: Row(
          children: [
            Icon(_icon, color: done ? k.success : k.ink700),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activity.title,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 2),
                  Text(
                    activity.durationMinutes ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: k.ink500),
                  ),
                ],
              ),
            ),
            if (done)
              Icon(LucideIcons.circleCheck, color: k.success)
            else if (!enabled)
              Icon(LucideIcons.lock, color: k.ink300, size: 18),
          ],
        ),
      ),
    );
  }
}
