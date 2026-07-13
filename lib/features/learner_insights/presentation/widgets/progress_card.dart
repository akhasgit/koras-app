import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/theme/koras_theme.dart';
import '../../../../core/theme/typography.dart';
import '../../../../shared/models/enums.dart';
import '../../../../shared/widgets/koras_badge.dart';
import '../../../../shared/widgets/koras_card.dart';
import '../../data/learner_insights.dart';

/// XP, streak, and trend summary.
class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, required this.insights});
  final LearnerInsights insights;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final (trendLabel, trendTone) = switch (insights.scoreTrend) {
      ScoreTrend.improving => ('Improving', BadgeTone.success),
      ScoreTrend.stable => ('Stable', BadgeTone.neutral),
      ScoreTrend.declining => ('Needs focus', BadgeTone.warning),
    };
    return KorasCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress', style: korasSerifItalic(19, color: k.ink900)),
              KorasBadge(label: trendLabel, tone: trendTone),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _Stat(
                icon: LucideIcons.flame,
                value: '${insights.currentStreakDays}',
                label: 'Day streak',
                color: k.ember,
              ),
              _Stat(
                icon: LucideIcons.star,
                value: '${insights.xpTotal}',
                label: 'XP',
                color: k.ink700,
              ),
              _Stat(
                icon: LucideIcons.trophy,
                value: 'Lv ${insights.currentLevel}',
                label: 'Level',
                color: k.ink700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 6),
          Text(value, style: Theme.of(context).textTheme.titleMedium),
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: context.koras.ink500)),
        ],
      ),
    );
  }
}
