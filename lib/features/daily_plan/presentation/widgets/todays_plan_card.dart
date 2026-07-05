import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/theme/koras_theme.dart';
import '../../../../core/theme/typography.dart';
import '../../../../shared/models/enums.dart';
import '../../../../shared/widgets/glass/glass_card.dart';
import '../../../../shared/widgets/koras_button.dart';
import '../../../../shared/widgets/koras_pill.dart';
import '../../data/daily_plan.dart';

/// Server-owned daily plan (Liquid Glass): mirrors the web `TodaysPlanCard`.
/// The plan is nullable — when null a warm-up placeholder is shown so the
/// section is always visible on the Today screen.
class TodaysPlanCard extends StatelessWidget {
  const TodaysPlanCard({super.key, required this.plan, this.onComplete});

  /// Null when the daily plan hasn't been generated yet (API error / first run).
  final DailyPlan? plan;
  final void Function(DailyPlanItem item, DailyPlanItemStatus status)?
      onComplete;

  @override
  Widget build(BuildContext context) {
    if (plan == null) return const _NoPlanCard();

    final p = plan!;
    final allDone = p.totalItems > 0 && p.completedCount == p.totalItems;
    final focus = p.focusArea?.replaceAll('_', ' ');

    // Sort so priority-1 items appear first; pick the first as the hero warm-up.
    final sorted = [...p.items]
      ..sort((a, b) => (a.priority ?? 9).compareTo(b.priority ?? 9));
    final hero = sorted.isNotEmpty ? sorted.first : null;
    final rest = sorted.length > 1 ? sorted.sublist(1) : <DailyPlanItem>[];

    return GlassCard(
      strong: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header row ──────────────────────────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: k(context).ember.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(LucideIcons.calendarRange,
                    size: 20, color: k(context).accentDeep),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "TODAY'S WARM-UP",
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: k(context).muted, letterSpacing: 1.4),
                        ),
                        if (hero?.estimatedMinutes != null) ...[
                          Text(' · ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: k(context).muted)),
                          Text(
                            '~${hero!.estimatedMinutes} min',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: k(context).muted),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 3),
                    if (focus != null)
                      Text(focus,
                          style: korasSerifItalic(20, color: k(context).accentDeep))
                    else
                      Text('Personalized for your next 24 hours.',
                          style: korasSerif(18,
                              height: 1.15, color: k(context).ink900)),
                  ],
                ),
              ),
              if (p.totalItems > 0) ...[
                const SizedBox(width: 8),
                KorasPill(
                  label: '${p.completedCount}/${p.totalItems}',
                  tone: PillTone.glass,
                ),
              ],
            ],
          ),

          // ── Hero warm-up item ────────────────────────────────────────────
          if (hero != null) ...[
            const SizedBox(height: 14),
            _HeroItem(item: hero, onComplete: onComplete),
          ] else ...[
            const SizedBox(height: 14),
            Text(
              'No tasks in your current plan. Complete onboarding or take a baseline check to unlock recommendations.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: k(context).muted),
            ),
          ],

          // ── Remaining items ──────────────────────────────────────────────
          if (rest.isNotEmpty) ...[
            const SizedBox(height: 10),
            for (final item in rest) ...[
              _PlanItemTile(item: item, onComplete: onComplete),
              const SizedBox(height: 8),
            ],
          ],

          if (allDone) ...[
            const SizedBox(height: 4),
            _CelebrationNote(refreshLabel: _refreshLabel(p.expiresAt)),
          ],
          if (p.advice != null) ...[
            const SizedBox(height: 12),
            GlassCard(
              radius: 16,
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('COACH NOTE',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: k(context).muted, letterSpacing: 1.2)),
                  const SizedBox(height: 8),
                  Text(p.advice!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: k(context).ink700, height: 1.5)),
                ],
              ),
            ),
          ],
          const SizedBox(height: 12),
          Text(_refreshLabel(p.expiresAt),
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: k(context).muted)),
        ],
      ),
    );
  }

  KorasTheme k(BuildContext context) => context.koras;
}

/// Shown when no plan has been generated yet.
class _NoPlanCard extends StatelessWidget {
  const _NoPlanCard();

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      strong: true,
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
                  color: k.ember.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Icon(LucideIcons.calendarRange, size: 20, color: k.muted),
              ),
              const SizedBox(width: 12),
              Text(
                "TODAY'S WARM-UP",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: k.muted, letterSpacing: 1.4),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text('Your daily plan is loading…',
              style: korasSerif(18, color: k.ink900)),
          const SizedBox(height: 8),
          Text(
            'Complete a voice assessment to unlock a personalised warm-up plan tailored to your goals.',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: k.ink700, height: 1.5),
          ),
          const SizedBox(height: 16),
          KorasButton.primary(
            onPressed: () => Navigator.of(context)
                .pushNamed('/app/dashboard/assess?baseline=1'),
            child: const Text('Start assessment'),
          ),
        ],
      ),
    );
  }
}

/// The primary/hero task — shown prominently at the top of the plan card,
/// matching the handoff "Read-along for melodic pitch" style.
class _HeroItem extends StatelessWidget {
  const _HeroItem({required this.item, this.onComplete});
  final DailyPlanItem item;
  final void Function(DailyPlanItem, DailyPlanItemStatus)? onComplete;

  static const _programLabels = {
    'ai-tutor': 'AI Tutor',
    'ielts-speaking': 'IELTS',
    'interview-prep': 'Interview Prep',
    'voice-foundations': 'Voice Foundations',
    'daily-vocabulary': 'Vocabulary',
    'listening-comprehension': 'Listening',
    'voice-refinement': 'Voice Refinement',
  };

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final done = item.status == DailyPlanItemStatus.completed;
    final label = _programLabels[item.programId] ?? item.programId ?? 'Session';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: k.muted, letterSpacing: 1.0),
        ),
        const SizedBox(height: 6),
        Text(
          item.title,
          style: korasSerifItalic(22, color: k.ink900).copyWith(
            decoration: done ? TextDecoration.lineThrough : null,
            color: done ? k.muted : k.ink900,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          item.reason,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: k.ink700, height: 1.55),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            if (!done && item.route != null) ...[
              _ActionButton(
                label: 'Start',
                icon: LucideIcons.mic,
                filled: true,
                onTap: () => context.go(item.route!),
              ),
              const SizedBox(width: 8),
            ],
            _ActionButton(
              label: done ? 'Done ✓' : 'Mark done',
              icon: done ? LucideIcons.circleCheck : LucideIcons.circle,
              tone: done ? k.success : null,
              onTap: onComplete == null
                  ? null
                  : () => onComplete!(
                        item,
                        done
                            ? DailyPlanItemStatus.pending
                            : DailyPlanItemStatus.completed,
                      ),
            ),
            if (!done) ...[
              const SizedBox(width: 8),
              _ActionButton(
                label: 'Preview',
                icon: LucideIcons.fileText,
                onTap: item.route == null ? null : () => context.go(item.route!),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _PlanItemTile extends StatelessWidget {
  const _PlanItemTile({required this.item, this.onComplete});
  final DailyPlanItem item;
  final void Function(DailyPlanItem item, DailyPlanItemStatus status)?
      onComplete;

  static const _programLabels = {
    'ai-tutor': 'AI Tutor',
    'ielts-speaking': 'IELTS',
    'interview-prep': 'Interview Prep',
    'voice-foundations': 'Voice Foundations',
    'daily-vocabulary': 'Vocabulary',
    'listening-comprehension': 'Listening',
    'voice-refinement': 'Voice Refinement',
  };

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final done = item.status == DailyPlanItemStatus.completed;
    final skipped = item.status == DailyPlanItemStatus.skipped;
    final label = _programLabels[item.programId] ?? item.programId ?? 'Session';
    final minutes =
        item.estimatedMinutes == null ? '' : ' · ${item.estimatedMinutes} min';

    return GlassCard(
      radius: 18,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _PriorityChip(priority: item.priority ?? 3),
              const SizedBox(width: 8),
              Flexible(
                child: Text('${label.toUpperCase()}$minutes',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: k.muted, letterSpacing: 0.8)),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            item.title,
            style: korasSerif(17, weight: FontWeight.w500, height: 1.25)
                .copyWith(
              color: done || skipped ? k.muted : k.ink900,
              decoration:
                  done || skipped ? TextDecoration.lineThrough : null,
            ),
          ),
          const SizedBox(height: 4),
          Text(item.reason,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: skipped ? k.muted : k.ink700, height: 1.5)),
            const SizedBox(height: 12),
            Row(
              children: [
                if (!done && item.route != null) ...[
                  _ActionButton(
                    label: 'Start',
                    icon: LucideIcons.arrowRight,
                    filled: true,
                    onTap: () => context.go(item.route!),
                  ),
                  const SizedBox(width: 8),
                ],
                _ActionButton(
                  label: done ? 'Done' : 'Mark done',
                  icon: done ? LucideIcons.circleCheck : LucideIcons.circle,
                  tone: done ? k.success : null,
                  onTap: onComplete == null
                      ? null
                      : () => onComplete!(
                            item,
                            done
                                ? DailyPlanItemStatus.pending
                                : DailyPlanItemStatus.completed,
                          ),
                ),
                if (!done) ...[
                  const SizedBox(width: 8),
                  _ActionButton(
                    label: skipped ? 'Skipped' : 'Skip',
                    icon: skipped ? LucideIcons.check : LucideIcons.x,
                    onTap: onComplete == null
                        ? null
                        : () => onComplete!(
                              item,
                              skipped
                                  ? DailyPlanItemStatus.pending
                                  : DailyPlanItemStatus.skipped,
                            ),
                  ),
                ],
              ],
            ),
          ],
        ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    this.filled = false,
    this.tone,
    this.onTap,
  });
  final String label;
  final IconData icon;
  final bool filled;
  final Color? tone;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final fg = filled ? k.onAccent : (tone ?? k.ink700);
    return Material(
      color: filled ? k.ember : Colors.transparent,
      shape: StadiumBorder(
        side: filled ? BorderSide.none : BorderSide(color: k.line),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: fg, fontWeight: FontWeight.w600)),
              const SizedBox(width: 6),
              Icon(icon, size: 14, color: fg),
            ],
          ),
        ),
      ),
    );
  }
}

class _PriorityChip extends StatelessWidget {
  const _PriorityChip({required this.priority});
  final int priority;

  @override
  Widget build(BuildContext context) {
    final (label, tone) = switch (priority) {
      1 => ('Priority', PillTone.accent),
      2 => ('Stretch', PillTone.glass),
      _ => ('Optional', PillTone.glass),
    };
    return KorasPill(label: label, tone: tone);
  }
}

class _CelebrationNote extends StatelessWidget {
  const _CelebrationNote({required this.refreshLabel});
  final String refreshLabel;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      radius: 16,
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(LucideIcons.partyPopper, size: 18, color: k.success),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Plan complete. Nice run.',
                    style: korasSerif(16, weight: FontWeight.w500)
                        .copyWith(color: k.success)),
                const SizedBox(height: 4),
                Text(refreshLabel,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: k.ink700)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _refreshLabel(DateTime? expiresAt) {
  if (expiresAt == null) {
    return 'A new plan will be ready next time you open your dashboard.';
  }
  final ms = expiresAt.difference(DateTime.now()).inMilliseconds;
  if (ms <= 0) {
    return 'A new plan will be ready next time you open your dashboard.';
  }
  final totalMinutes = ms ~/ 60000;
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;
  if (hours <= 0) return 'Refreshes in ${minutes}m';
  if (minutes == 0) return 'Refreshes in ${hours}h';
  return 'Refreshes in ${hours}h ${minutes}m';
}
