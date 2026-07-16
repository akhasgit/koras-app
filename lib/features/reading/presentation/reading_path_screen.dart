import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_eyebrow.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/reading_models.dart';
import '../data/reading_repository.dart';
import 'reading_building_screen.dart';
import 'reading_calibration_screen.dart';
import 'reading_intake_screen.dart';

enum _Flow { auto, intake, calibration, building }

/// `/app/reading` entry — routes to intake when there is no profile, the
/// building screen while the programme generates, and otherwise renders the
/// Duolingo-style stage path (LPath design).
///
/// Note on §6.2: `GET /program` returns `null` both before intake and after an
/// abandoned intake — the API surface has no profile probe — so a `null`
/// programme always lands on the (prefilled, one-tap) intake, and calibration
/// falls back to intake on a 409 `intake_required`.
class ReadingPathScreen extends HookConsumerWidget {
  const ReadingPathScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programAsync = ref.watch(readingProgramProvider);
    final flow = useState(_Flow.auto);
    final profile = useState<ReadingProfile?>(null);
    final hasBaseline = ref
            .watch(readingIntakeDefaultsProvider)
            .valueOrNull
            ?.hasBaseline ??
        false;

    Widget shell({
      required String title,
      String? kicker,
      required Widget child,
      bool scrollable = true,
    }) =>
        KorasScreen(
          title: title,
          kicker: kicker,
          scrollable: scrollable,
          children: [const SizedBox(height: 8), child],
        );

    switch (flow.value) {
      case _Flow.intake:
      case _Flow.auto when programAsync.valueOrNull == null &&
              !programAsync.isLoading &&
              !programAsync.hasError:
        return shell(
          title: 'Reading',
          kicker: 'New programme',
          child: ReadingIntakeScreen(
            onCompleted: (p) {
              profile.value = p;
              flow.value = _Flow.calibration;
            },
          ),
        );
      case _Flow.calibration:
        return shell(
          title: 'Tune your programme',
          kicker: 'Reading',
          child: ReadingCalibrationScreen(
            persona: profile.value?.persona ?? 'other',
            gradeLevel: profile.value?.gradeLevel,
            hasBaseline: hasBaseline,
            onAnalysed: (_) => flow.value = _Flow.building,
            onIntakeRequired: () => flow.value = _Flow.intake,
          ),
        );
      case _Flow.building:
        return shell(
          title: 'Reading',
          child: ReadingBuildingScreen(
            onReady: (_) {
              ref.invalidate(readingProgramProvider);
              flow.value = _Flow.auto;
            },
          ),
        );
      case _Flow.auto:
        break;
    }

    return programAsync.when(
      loading: () => shell(
        title: 'Reading',
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 80),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (e, _) => shell(
        title: 'Reading',
        child: KorasError(
          message: errorToMessage(e),
          onRetry: () => ref.invalidate(readingProgramProvider),
        ),
      ),
      data: (program) {
        if (program == null) {
          // Handled above; safety net while providers settle.
          return shell(
            title: 'Reading',
            child: const SizedBox.shrink(),
          );
        }
        if (program.isGenerating) {
          return shell(
            title: 'Reading',
            child: ReadingBuildingScreen(
              onReady: (_) => ref.invalidate(readingProgramProvider),
            ),
          );
        }
        return _PathBody(
          program: program,
          onStartNewProgramme: () => flow.value = _Flow.intake,
        );
      },
    );
  }
}

// ── Path body (LPath) ───────────────────────────────────────────────────────

const _kNodeSize = 64.0;
const _kNodeActiveSize = 76.0;
const _kStep = 100.0;
const _kTopPad = 56.0;
const _kOffsets = <double>[-28, 52, 88, 30, -50, -84];
const _kNodeIcons = <IconData>[
  LucideIcons.mic,
  LucideIcons.audioLines,
  LucideIcons.bookOpen,
  LucideIcons.star,
  LucideIcons.sparkles,
];

class _PathBody extends ConsumerWidget {
  const _PathBody({required this.program, required this.onStartNewProgramme});

  final ReadingProgram program;
  final VoidCallback onStartNewProgramme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final stages = [...program.stages]..sort((a, b) => a.position - b.position);
    final current = program.currentStage;
    final progress = ref.watch(readingProgressProvider).valueOrNull;
    final doneCount = stages.where((s) => s.status == 'completed').length;
    final firstUnlockedId =
        stages.where((s) => s.status == 'unlocked').firstOrNull?.id;

    final trackHeight = _kTopPad + stages.length * _kStep + 160;

    return KorasScreen(
      title: 'Reading',
      kicker: 'Your path',
      children: [
        // Unit banner — "unit" is display copy only; the schema keyword stays
        // `stage`.
        GlassCard(
          strong: true,
          radius: 24,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KorasEyebrow(
                          text: current == null
                              ? 'Your programme'
                              : 'Unit ${current.position} of ${stages.length}',
                          tone: EyebrowTone.ember,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          current?.title ?? 'Reading programme',
                          style: korasSerifItalic(20, color: k.ink900),
                        ),
                      ],
                    ),
                  ),
                  GlassCard(
                    radius: 14,
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      width: 44,
                      height: 44,
                      child:
                          Icon(LucideIcons.bookOpen, size: 20, color: k.ink900),
                    ),
                  ),
                ],
              ),
              Divider(height: 26, color: k.line),
              Row(
                children: [
                  _Stat(
                    icon: LucideIcons.flame,
                    color: k.accentDeep,
                    label: '${progress?.currentStreakDays ?? 0}',
                  ),
                  const SizedBox(width: 18),
                  _Stat(
                    icon: LucideIcons.sparkles,
                    color: k.ember,
                    label: '${progress?.totalXp ?? 0} XP',
                  ),
                  const SizedBox(width: 18),
                  _Stat(
                    icon: LucideIcons.star,
                    color: k.warn,
                    label: '$doneCount / ${stages.length} done',
                  ),
                ],
              ),
            ],
          ),
        ),
        if (program.isStarterProgramme) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(LucideIcons.sparkles, size: 14, color: k.muted),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  "Starter programme — we'll personalise it as you read.",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.muted),
                ),
              ),
            ],
          ),
        ],
        if (program.isCompleted) ...[
          const SizedBox(height: 14),
          GlassCard(
            strong: true,
            child: Column(
              children: [
                Icon(LucideIcons.trophy, size: 36, color: k.warn),
                const SizedBox(height: 10),
                Text('Programme complete!',
                    style: korasSerifItalic(22, color: k.ink900)),
                const SizedBox(height: 6),
                Text(
                  'Every stage finished — brilliant work. Ready to go again '
                  'with a fresh set of passages?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: k.muted),
                ),
                const SizedBox(height: 14),
                KorasButton.primary(
                  onPressed: onStartNewProgramme,
                  child: const Text('Start a new programme'),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            return SizedBox(
              width: width,
              height: trackHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(width, trackHeight),
                    painter: _ConnectorPainter(
                      count: stages.length,
                      centerX: width / 2,
                      lineColor: k.line,
                      dashColor: k.ember.withValues(alpha: 0.4),
                    ),
                  ),
                  for (var i = 0; i < stages.length; i++)
                    _StageNode(
                      stage: stages[i],
                      index: i,
                      centerX: width / 2,
                      isActive: stages[i].id == firstUnlockedId,
                    ),
                  for (var i = 0; i < stages.length; i++)
                    if (stages[i].id == firstUnlockedId)
                      _UpNextBubble(stage: stages[i], index: i),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.color, required this.label});

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.w700, color: k.ink900),
        ),
      ],
    );
  }
}

class _ConnectorPainter extends CustomPainter {
  _ConnectorPainter({
    required this.count,
    required this.centerX,
    required this.lineColor,
    required this.dashColor,
  });

  final int count;
  final double centerX;
  final Color lineColor;
  final Color dashColor;

  Offset _center(int i) => Offset(
        centerX + _kOffsets[i % _kOffsets.length],
        _kTopPad + i * _kStep + _kNodeSize / 2,
      );

  @override
  void paint(Canvas canvas, Size size) {
    if (count < 2) return;
    final path = Path()..moveTo(_center(0).dx, _center(0).dy);
    for (var i = 1; i < count; i++) {
      final prev = _center(i - 1);
      final cur = _center(i);
      final midY = (prev.dy + cur.dy) / 2;
      path.cubicTo(prev.dx, midY, cur.dx, midY, cur.dx, cur.dy);
    }
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 14
        ..strokeCap = StrokeCap.round
        ..color = lineColor,
    );
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round
        ..color = dashColor,
    );
  }

  @override
  bool shouldRepaint(_ConnectorPainter old) =>
      old.count != count || old.centerX != centerX;
}

class _StageNode extends ConsumerWidget {
  const _StageNode({
    required this.stage,
    required this.index,
    required this.centerX,
    required this.isActive,
  });

  final ReadingStageSummary stage;
  final int index;
  final double centerX;
  final bool isActive;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final cx = centerX + _kOffsets[index % _kOffsets.length];
    final cy = _kTopPad + index * _kStep;
    final done = stage.status == 'completed';
    final generating = stage.status == 'generating';
    final locked = stage.status == 'locked';
    final size = isActive ? _kNodeActiveSize : _kNodeSize;

    final (Color face, Color fg, Color depth) = done
        ? (k.accentDeep, k.onAccent, k.accentDeep)
        : isActive
            ? (k.ember, k.onAccent, k.accentDeep)
            : (Colors.black.withValues(alpha: 0.05), k.muted, k.line);

    void onTap() {
      if (locked) return;
      if (generating) {
        _showGeneratingSheet(context, ref, stage);
        return;
      }
      context.push('/app/reading/stage/${stage.id}');
    }

    return Positioned(
      left: cx - size / 2,
      top: cy + (_kNodeSize - size) / 2,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            if (isActive)
              Positioned(
                top: -42,
                left: -60,
                right: -60,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: k.cream,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: k.ember.withValues(alpha: 0.3), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: k.accentDeep.withValues(alpha: 0.3),
                          blurRadius: 14,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      'START',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: k.accentDeep,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                          ),
                    ),
                  ),
                ),
              ),
            GestureDetector(
            onTap: onTap,
            child: Container(
              width: size,
              height: size,
              decoration: isActive
                  ? BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: k.ember.withValues(alpha: 0.45),
                        width: 2.5,
                      ),
                    )
                  : null,
              padding: isActive ? const EdgeInsets.all(5) : EdgeInsets.zero,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: face,
                  boxShadow: [
                    BoxShadow(color: depth, offset: const Offset(0, 5)),
                    if (done || isActive)
                      BoxShadow(
                        color: k.accentDeep.withValues(alpha: 0.35),
                        blurRadius: 18,
                        offset: const Offset(0, 9),
                      ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    if (generating)
                      SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: stage.generationError != null
                              ? k.danger
                              : k.ember,
                        ),
                      )
                    else if (locked)
                      Icon(LucideIcons.lock, size: 22, color: k.muted)
                    else
                      Icon(
                        _kNodeIcons[index % _kNodeIcons.length],
                        size: isActive ? 30 : 24,
                        color: fg,
                      ),
                    if (done)
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: k.cream,
                            border: Border.all(color: k.accentDeep, width: 2),
                          ),
                          child: Icon(LucideIcons.check,
                              size: 12, color: k.accentDeep),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

/// Bottom sheet for a stage stuck in `generating` — shows the state and the
/// §6.6 retry affordance when generation failed.
void _showGeneratingSheet(
  BuildContext context,
  WidgetRef ref,
  ReadingStageSummary stage,
) {
  final k = context.koras;
  final failed = stage.generationError != null;
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: k.cream,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (sheetContext) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(stage.title, style: korasSerifItalic(22, color: k.ink900)),
          const SizedBox(height: 8),
          Text(
            failed
                ? "This stage didn't generate properly. Give it another go."
                : "We're still writing this stage — it unlocks automatically "
                    'once ready.',
            style: Theme.of(sheetContext)
                .textTheme
                .bodyMedium
                ?.copyWith(color: k.muted),
          ),
          const SizedBox(height: 20),
          if (failed)
            KorasButton.primary(
              onPressed: () async {
                Navigator.of(sheetContext).pop();
                try {
                  await ref
                      .read(readingRepositoryProvider)
                      .retryStageGeneration(stage.id);
                } on ConflictError {
                  // Content already exists — refresh below picks it up.
                }
                ref.invalidate(readingProgramProvider);
              },
              child: const Text('Retry generation'),
            )
          else
            KorasButton.glass(
              onPressed: () {
                Navigator.of(sheetContext).pop();
                ref.invalidate(readingProgramProvider);
              },
              child: const Text('Check again'),
            ),
        ],
      ),
    ),
  );
}

/// Up-next preview bubble under the active node — first incomplete lesson of
/// the unlocked stage (focus chip, ~min, +XP, "Start lesson").
class _UpNextBubble extends ConsumerWidget {
  const _UpNextBubble({required this.stage, required this.index});

  final ReadingStageSummary stage;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final stageAsync = ref.watch(readingStageProvider(stage.id));
    final full = stageAsync.valueOrNull;
    if (full == null) return const SizedBox.shrink();

    final lesson = full.lessons
            .where((l) => !full.isLessonCompleted(l.lessonId))
            .firstOrNull ??
        full.lessons.firstOrNull;
    if (lesson == null) return const SizedBox.shrink();

    final top = _kTopPad + index * _kStep + _kNodeActiveSize + 44;

    return Positioned(
      left: 0,
      right: 0,
      top: top,
      child: GlassCard(
        strong: true,
        radius: 22,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: KorasEyebrow(
                    text:
                        'Lesson ${full.lessonCode(lesson)} · Up next',
                    tone: EyebrowTone.ember,
                  ),
                ),
                KorasPill(label: '+${lesson.totalXp} XP'),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              lesson.title ?? stage.title,
              style: korasSerif(18.5, height: 1.15, color: k.ink900),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 7,
              runSpacing: 7,
              children: [
                if (lesson.focus != null)
                  KorasPill(
                    label: '${_capitalise(lesson.focus!)} focus',
                    tone: PillTone.accent,
                    icon: LucideIcons.target,
                  ),
                if (lesson.estimatedMin != null)
                  KorasPill(
                    label: '~${lesson.estimatedMin} min',
                    icon: LucideIcons.clock,
                  ),
              ],
            ),
            const SizedBox(height: 14),
            KorasButton.primary(
              onPressed: () => context.push(
                '/app/reading/lesson/${stage.id}/${lesson.lessonId}',
              ),
              child: const Text('Start lesson'),
            ),
          ],
        ),
      ),
    );
  }
}

String _capitalise(String s) =>
    s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

// ── Stage detail (`/app/reading/stage/:stageId`) ────────────────────────────

/// Lessons of one stage — the drill-in from a path node.
class ReadingStageScreen extends ConsumerWidget {
  const ReadingStageScreen({super.key, required this.stageId});

  final String stageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stageAsync = ref.watch(readingStageProvider(stageId));

    return stageAsync.when(
      loading: () => const KorasScreen(
        title: 'Stage',
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      error: (e, _) => KorasScreen(
        title: 'Stage',
        children: [
          KorasError(
            message: errorToMessage(e),
            onRetry: () => ref.invalidate(readingStageProvider(stageId)),
          ),
        ],
      ),
      data: (stage) {
        final k = context.koras;
        return KorasScreen(
          title: stage.title,
          kicker: 'Unit ${stage.position}',
          children: [
            if (stage.theme != null && stage.theme!.isNotEmpty) ...[
              Text(
                stage.theme!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: k.muted),
              ),
              const SizedBox(height: 10),
            ],
            if (stage.focusAreas.isNotEmpty) ...[
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  for (final f in stage.focusAreas)
                    KorasPill(
                      label: _capitalise(f),
                      tone: PillTone.accent,
                      icon: LucideIcons.target,
                    ),
                ],
              ),
              const SizedBox(height: 16),
            ],
            if (stage.status == 'generating')
              GlassCard(
                child: Column(
                  children: [
                    if (stage.generationError != null) ...[
                      Icon(LucideIcons.circleAlert, color: k.danger, size: 32),
                      const SizedBox(height: 10),
                      const Text(
                        "This stage didn't generate properly.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 14),
                      KorasButton.primary(
                        onPressed: () async {
                          try {
                            await ref
                                .read(readingRepositoryProvider)
                                .retryStageGeneration(stageId);
                          } on ConflictError {
                            // Already generated — refresh picks it up.
                          }
                          ref.invalidate(readingStageProvider(stageId));
                          ref.invalidate(readingProgramProvider);
                        },
                        child: const Text('Retry generation'),
                      ),
                    ] else ...[
                      CircularProgressIndicator(color: k.ember, strokeWidth: 3),
                      const SizedBox(height: 14),
                      const Text('Still writing this stage — check back in a '
                          'moment.'),
                    ],
                  ],
                ),
              )
            else
              for (final lesson in stage.lessons) ...[
                _LessonRow(stage: stage, lesson: lesson),
                const SizedBox(height: 10),
              ],
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}

class _LessonRow extends StatelessWidget {
  const _LessonRow({required this.stage, required this.lesson});

  final ReadingStage stage;
  final ReadingLesson lesson;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final completed = stage.isLessonCompleted(lesson.lessonId);

    return GlassCard(
      radius: 20,
      padding: const EdgeInsets.all(14),
      onTap: () => context
          .push('/app/reading/lesson/${stage.id}/${lesson.lessonId}'),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: completed
                  ? k.success.withValues(alpha: 0.16)
                  : k.ember.withValues(alpha: 0.13),
            ),
            child: Icon(
              completed ? LucideIcons.check : LucideIcons.bookOpen,
              size: 21,
              color: completed ? k.success : k.accentDeep,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KorasEyebrow(text: 'Lesson ${stage.lessonCode(lesson)}'),
                const SizedBox(height: 2),
                Text(
                  lesson.title ?? 'Lesson ${lesson.lessonId}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: k.ink900),
                ),
                const SizedBox(height: 2),
                Text(
                  [
                    if (lesson.focus != null) _capitalise(lesson.focus!),
                    if (lesson.estimatedMin != null)
                      '~${lesson.estimatedMin} min',
                    '${lesson.steps.length} steps',
                  ].join(' · '),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.muted),
                ),
              ],
            ),
          ),
          Text(
            '+${lesson.totalXp}',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: k.muted, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
