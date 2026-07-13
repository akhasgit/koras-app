import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../shared/models/enums.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/avatar_menu_button.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_header.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_progress_arc.dart';
import '../../daily_plan/data/daily_plan.dart';
import '../../daily_plan/data/daily_plan_repository.dart';
import '../../programs/domain/program_catalog.dart';

// Duration labels per program — shown under each card.
const _kDuration = <String, String>{
  'ai-tutor': 'Ongoing',
  'voice-foundations': '7 days',
  'daily-vocabulary': 'Daily',
  'listening-comprehension': 'Daily',
  'voice-refinement': '14 days',
  'ielts-speaking': '8 weeks',
  'interview-prep': '4 weeks',
  'daily-lesson-plan': 'Daily',
  'public-speaking': '8 weeks',
  'confidence-filler': '4 weeks',
  'before-after-milestones': '6 weeks',
  'progress-tracking': 'Ongoing',
  'historical-conversations': '4 weeks',
};

/// Paths (Programs) tab — glass restyle matching the handoff "Programs" screen.
/// Layout: header → "Continue" hero (if a daily plan item maps to a program)
///          → 2-column live program grid → coming-soon section.
class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    final planAsync = ref.watch(currentDailyPlanProvider);

    final statusBarH = MediaQuery.paddingOf(context).top;

    final livePrograms = kPrograms
        .where((p) =>
            p.status == ProgramStatus.live &&
            p.id != 'daily-lesson-plan') // daily plan lives on Today tab
        .toList();
    final comingPrograms =
        kPrograms.where((p) => p.status == ProgramStatus.incoming).toList();

    // Determine active program from daily plan's first priority item.
    DailyPlan? plan;
    if (planAsync is AsyncData<DailyPlan?>) plan = planAsync.value;

    Program? activeProgram;
    DailyPlanItem? activeItem;
    if (plan != null && plan.items.isNotEmpty) {
      final sorted = [...plan.items]
        ..sort((a, b) => (a.priority ?? 9).compareTo(b.priority ?? 9));
      for (final item in sorted) {
        final match = item.programId != null
            ? livePrograms.where((p) => p.id == item.programId).firstOrNull
            : null;
        if (match != null) {
          activeProgram = match;
          activeItem = item;
          break;
        }
      }
    }

    // Remove the active program from the grid so it isn't shown twice.
    final gridPrograms = activeProgram != null
        ? livePrograms.where((p) => p.id != activeProgram!.id).toList()
        : livePrograms;

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(currentDailyPlanProvider);
      },
      child: ListView(
        padding: EdgeInsets.only(top: statusBarH + 8, bottom: 110),
        children: [
          KorasHeader(
            kicker: 'STRUCTURED PATHS',
            title: 'Programs',
            italic: true,
            trailing: profile != null
                ? AvatarMenuButton(profile: profile)
                : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Continue card ─────────────────────────────────────────
                if (activeProgram != null && activeItem != null) ...[
                  _ContinueCard(
                    program: activeProgram,
                    item: activeItem,
                  ),
                  const SizedBox(height: 16),
                ],

                // ── Live programs grid ────────────────────────────────────
                _ProgramGrid(programs: gridPrograms),

                // ── Coming soon ───────────────────────────────────────────
                if (comingPrograms.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Text(
                    'COMING SOON',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: context.koras.muted, letterSpacing: 1.4),
                  ),
                  const SizedBox(height: 12),
                  _ProgramGrid(
                    programs: comingPrograms,
                    dimmed: true,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// "Continue" hero card
// ─────────────────────────────────────────────────────────────────────────────

class _ContinueCard extends StatelessWidget {
  const _ContinueCard({required this.program, required this.item});
  final Program program;
  final DailyPlanItem item;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GestureDetector(
      onTap: () {
        if (program.route != null) context.push(program.route!);
      },
      child: GlassCard(
        strong: true,
        child: Row(
          children: [
            // Progress ring
            KorasProgressArc(
              value: 45, // placeholder — no server progress yet
              size: 56,
              strokeWidth: 6,
              child: Text('45%', style: korasSerif(14, color: k.ink900)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CONTINUE',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: k.ember,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(program.label,
                      style: korasSerifItalic(20, color: k.ink900)),
                  const SizedBox(height: 2),
                  Text(
                    item.reason.length > 40
                        ? '${item.reason.substring(0, 40)}…'
                        : item.reason,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: k.muted),
                  ),
                ],
              ),
            ),
            // Glass play circle (handoff: Glass strong, radius 999, 44px).
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: k.glassFillStrong,
                shape: BoxShape.circle,
                border: Border.all(color: k.glassBorder, width: 0.75),
              ),
              child: Icon(LucideIcons.play, size: 18, color: k.ember),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 2-column program grid
// ─────────────────────────────────────────────────────────────────────────────

class _ProgramGrid extends StatelessWidget {
  const _ProgramGrid({
    required this.programs,
    this.dimmed = false,
  });
  final List<Program> programs;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.05,
      ),
      itemCount: programs.length,
      itemBuilder: (context, i) {
        return _ProgramTile(program: programs[i], dimmed: dimmed);
      },
    );
  }
}

class _ProgramTile extends StatelessWidget {
  const _ProgramTile({
    required this.program,
    required this.dimmed,
  });
  final Program program;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final canTap = !dimmed && program.route != null;

    return GestureDetector(
      onTap: () {
        if (canTap) {
          context.push(program.route!);
        }
      },
      child: GlassCard(
        radius: 22,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon box
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: dimmed
                    ? k.line
                    : k.ember.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                program.icon,
                size: 22,
                color: dimmed ? k.muted : k.accentDeep,
              ),
            ),
            const Spacer(),
            // Name
            Text(
              program.label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: dimmed ? k.muted : k.ink900,
                  fontWeight: FontWeight.w700,
                  height: 1.25),
            ),
            const SizedBox(height: 4),
            // Duration / status row
            Row(
              children: [
                if (dimmed)
                  const KorasPill(label: 'Soon', tone: PillTone.glass)
                else
                  Text(
                    _kDuration[program.id] ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: k.muted),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
