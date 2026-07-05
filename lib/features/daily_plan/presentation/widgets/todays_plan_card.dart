import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/theme/koras_theme.dart';
import '../../../../shared/models/enums.dart';
import '../../../../shared/widgets/koras_card.dart';
import '../../../../shared/widgets/koras_eyebrow.dart';
import '../../data/daily_plan.dart';

/// Server-owned daily plan: summary + focus + advice + items.
class TodaysPlanCard extends StatelessWidget {
  const TodaysPlanCard({super.key, required this.plan, this.onComplete});
  final DailyPlan plan;
  final void Function(DailyPlanItem item, DailyPlanItemStatus status)?
      onComplete;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return KorasCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const KorasEyebrow(
                  text: 'Today\'s plan', tone: EyebrowTone.ember),
              Text('${plan.completedCount}/${plan.totalItems}',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: k.ink500)),
            ],
          ),
          if (plan.summary != null) ...[
            const SizedBox(height: 8),
            Text(plan.summary!, style: Theme.of(context).textTheme.bodyLarge),
          ],
          if (plan.focusArea != null) ...[
            const SizedBox(height: 4),
            Text('Focus: ${plan.focusArea}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: k.ink500)),
          ],
          const SizedBox(height: 12),
          for (final item in plan.items)
            _PlanItemTile(item: item, onComplete: onComplete),
          if (plan.advice != null) ...[
            const SizedBox(height: 8),
            Text(plan.advice!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: k.ink500)),
          ],
        ],
      ),
    );
  }
}

class _PlanItemTile extends StatelessWidget {
  const _PlanItemTile({required this.item, this.onComplete});
  final DailyPlanItem item;
  final void Function(DailyPlanItem item, DailyPlanItemStatus status)?
      onComplete;

  @override
  Widget build(BuildContext context) {
    final done = item.status == DailyPlanItemStatus.completed;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: IconButton(
        icon: Icon(done ? LucideIcons.circleCheck : LucideIcons.circle),
        color: done ? context.koras.success : context.koras.ink300,
        onPressed: onComplete == null || done
            ? null
            : () => onComplete!(item, DailyPlanItemStatus.completed),
      ),
      title: Text(item.title),
      subtitle: Text(item.reason),
      onTap: item.route == null ? null : () => context.go(item.route!),
    );
  }
}
