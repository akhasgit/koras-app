import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/glass/glass_screen.dart';
import '../../dashboard/data/assessments_repository.dart';
import '../../daily_plan/data/daily_plan_repository.dart';

/// Inbox v1 — derived notification rows (daily plan refresh, latest analysis)
/// until a real notifications backend exists. Reached from the avatar menu.
class InboxScreen extends ConsumerWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final plan = ref.watch(currentDailyPlanProvider).valueOrNull;
    final latest = ref.watch(latestAssessmentProvider).valueOrNull;

    final rows = <_InboxRow>[
      if (plan != null)
        _InboxRow(
          icon: LucideIcons.calendarCheck,
          title: 'Your daily plan is ready',
          body: plan.summary?.trim().isNotEmpty == true
              ? plan.summary!.trim()
              : '${plan.totalItems} tasks picked for you today.',
          time: plan.generatedAt,
          route: '/app/dashboard',
        ),
      if (latest != null)
        _InboxRow(
          icon: LucideIcons.audioWaveform,
          title: 'Voice analysis complete',
          body: 'Overall ${latest.scores.overall} — tap to see the breakdown.',
          time: latest.createdAt,
          route: '/app/dashboard/progress',
        ),
    ];

    return GlassScreen(
      kicker: 'Updates',
      title: 'Inbox',
      child: rows.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Icon(LucideIcons.inbox, size: 40, color: k.muted),
                  const SizedBox(height: 12),
                  Text('No notifications yet',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 6),
                  Text(
                    'Plan refreshes and updates will show up here.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: k.muted),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                for (final row in rows) ...[
                  _InboxTile(row: row),
                  const SizedBox(height: 10),
                ],
              ],
            ),
    );
  }
}

class _InboxRow {
  const _InboxRow({
    required this.icon,
    required this.title,
    required this.body,
    this.time,
    this.route,
  });
  final IconData icon;
  final String title;
  final String body;
  final DateTime? time;
  final String? route;
}

class _InboxTile extends StatelessWidget {
  const _InboxTile({required this.row});
  final _InboxRow row;

  String _timeLabel(DateTime dt) {
    final local = dt.toLocal();
    final now = DateTime.now();
    final diff = now.difference(local);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return DateFormat('MMM d').format(local);
  }

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      radius: 20,
      padding: const EdgeInsets.all(14),
      onTap: row.route == null ? null : () => context.go(row.route!),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: k.ember.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(row.icon, size: 19, color: k.accentDeep),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        row.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: k.ink900),
                      ),
                    ),
                    if (row.time != null)
                      Text(
                        _timeLabel(row.time!),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: k.muted),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  row.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.ink700, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
