import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/voice_refinement_models.dart';
import '../data/voice_refinement_repository.dart';

/// Voice Refinement programme home. Routes the user to:
///   - Baseline recording, if none exists.
///   - Explore (target picker), if baseline done but no active plan.
///   - Plan view (day list), when an active plan exists.
class VoiceRefinementHomeScreen extends ConsumerWidget {
  const VoiceRefinementHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(voiceRefinementPlanProvider);
    final baselinesAsync = ref.watch(voiceRefinementBaselinesProvider);

    return KorasScreen(
      title: 'Voice Refinement',
      children: [
        const SizedBox(height: 8),
        planAsync.when(
          data: (plan) {
            if (plan != null) return _PlanView(plan: plan);
            return baselinesAsync.when(
              data: (baselines) {
                final completed = baselines
                    .where((b) => b.analysisStatus == 'completed')
                    .toList();
                if (completed.isEmpty) return const _BaselinePrompt();
                return _ExplorePrompt(latestBaseline: completed.first);
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Baselines error: $e'),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Plan error: $e'),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _BaselinePrompt extends StatelessWidget {
  const _BaselinePrompt();

  @override
  Widget build(BuildContext context) {
    return KorasCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Step 1 — Baseline',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const Text(
              'We\'ll analyse a short baseline recording to understand your natural voice.'),
          const SizedBox(height: 16),
          KorasButton.primary(
            onPressed: () =>
                context.push('/app/voice-refinement/baseline'),
            child: const Text('Record baseline'),
          ),
        ],
      ),
    );
  }
}

class _ExplorePrompt extends StatelessWidget {
  const _ExplorePrompt({required this.latestBaseline});
  final VoiceRefinementBaseline latestBaseline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Step 2 — Explore',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              const Text(
                  'Pick target adjustments (pitch, pace, resonance, brightness) and we\'ll build a 14-day plan.'),
              const SizedBox(height: 16),
              KorasButton.primary(
                onPressed: () => context.push(
                    '/app/voice-refinement/explore/${latestBaseline.id}'),
                child: const Text('Explore target voice'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlanView extends StatelessWidget {
  const _PlanView({required this.plan});
  final VoiceRefinementPlan plan;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final activities = plan.activities ?? const <Map<String, dynamic>>[];
    final byDay = <int, List<Map<String, dynamic>>>{};
    for (final a in activities) {
      final d = (a['day'] as int?) ?? 0;
      byDay.putIfAbsent(d, () => []).add(a);
    }
    final days = byDay.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('14-day plan',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Text('Plan status: ${plan.status ?? "-"}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.ink500)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        for (final day in days)
          _DaySection(
            day: day,
            planId: plan.id,
            activities: byDay[day]!,
          ),
      ],
    );
  }
}

class _DaySection extends StatelessWidget {
  const _DaySection({
    required this.day,
    required this.planId,
    required this.activities,
  });
  final int day;
  final String planId;
  final List<Map<String, dynamic>> activities;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text('Day $day',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        for (final a in activities)
          _ActivityRow(activity: a, planId: planId, day: day),
      ],
    );
  }
}

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({
    required this.activity,
    required this.planId,
    required this.day,
  });
  final Map<String, dynamic> activity;
  final String planId;
  final int day;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final id = activity['id'] as String? ?? '';
    final title = activity['title'] as String? ?? id;
    final type = activity['type'] as String? ?? 'drill';
    final isCheckpoint = activity['is_checkpoint'] == true;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: KorasCard(
        onTap: () => context.push(
          '/app/voice-refinement/activity/$id'
          '?planId=$planId&day=$day'
          '${isCheckpoint ? "&checkpoint=1" : ""}',
        ),
        child: Row(
          children: [
            Icon(
              type == 'recording'
                  ? LucideIcons.mic
                  : LucideIcons.dumbbell,
              color: k.ember,
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(title)),
            if (isCheckpoint)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: k.warning.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text('Checkpoint',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: k.warning)),
              ),
          ],
        ),
      ),
    );
  }
}
