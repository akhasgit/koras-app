import 'package:flutter/material.dart';
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

IconData readingStepIcon(String type) => switch (type) {
      'guided_read' => LucideIcons.bookOpen,
      'echo' => LucideIcons.audioWaveform,
      'free_read' => LucideIcons.mic,
      'cold_read' => LucideIcons.fileText,
      'punctuation' => LucideIcons.notebook,
      'speed_ladder' => LucideIcons.trendingUp,
      'vocab_context' => LucideIcons.bookText,
      _ => LucideIcons.mic,
    };

String readingStepLabel(ReadingStep step) =>
    step.title ??
    switch (step.type) {
      'guided_read' => 'Guided read-along',
      'echo' => 'Echo the melody',
      'free_read' => 'Free read',
      'cold_read' => 'Cold read',
      'punctuation' => 'Punctuation drill',
      'speed_ladder' => 'Speed ladder',
      'vocab_context' => 'Words in context',
      _ => 'Read aloud',
    };

String _stepMeta(ReadingStep step) => switch (step.type) {
      'guided_read' => 'Read along at your guide speed',
      'echo' => step.targetNotes ?? 'Match the intonation',
      'free_read' => 'Record it your way',
      'cold_read' => 'An unseen passage — no rehearsal',
      'punctuation' => 'Let the punctuation set your pauses',
      'speed_ladder' => 'The same passage at rising speeds',
      'vocab_context' => 'New words woven into a passage',
      _ => 'Read the passage aloud',
    };

/// Lesson detail (LLesson) — hero, chips, step rows with per-step XP and a
/// "Start here" pill on the first incomplete step.
class ReadingLessonScreen extends ConsumerWidget {
  const ReadingLessonScreen({
    super.key,
    required this.stageId,
    required this.lessonId,
  });

  final String stageId;
  final String lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stageAsync = ref.watch(readingStageProvider(stageId));

    return stageAsync.when(
      loading: () => const KorasScreen(
        title: 'Lesson',
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      error: (e, _) => KorasScreen(
        title: 'Lesson',
        children: [
          KorasError(
            message: errorToMessage(e),
            onRetry: () => ref.invalidate(readingStageProvider(stageId)),
          ),
        ],
      ),
      data: (stage) {
        final lesson = stage.lessonById(lessonId);
        if (lesson == null) {
          return const KorasScreen(
            title: 'Lesson',
            children: [Text("We couldn't find this lesson.")],
          );
        }
        return _LessonBody(stage: stage, lesson: lesson);
      },
    );
  }
}

class _LessonBody extends StatelessWidget {
  const _LessonBody({required this.stage, required this.lesson});

  final ReadingStage stage;
  final ReadingLesson lesson;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final firstIncomplete = lesson.steps
        .where((s) => !stage.isStepCompleted(lesson.lessonId, s.stepId))
        .firstOrNull;

    void openStep(ReadingStep step) {
      context.push(
        '/app/reading/read/${stage.id}~${lesson.lessonId}~${step.stepId}',
      );
    }

    return KorasScreen(
      title: lesson.title ?? 'Lesson ${lesson.lessonId}',
      kicker: 'Unit ${stage.position} · Lesson ${stage.lessonCode(lesson)}',
      actions: [
        KorasPill(label: '+${lesson.totalXp} XP', icon: LucideIcons.sparkles),
      ],
      children: [
        // Hero
        GlassCard(
          strong: true,
          radius: 28,
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: k.ember,
                  boxShadow: [
                    BoxShadow(color: k.accentDeep, offset: const Offset(0, 6)),
                    BoxShadow(
                      color: k.accentDeep.withValues(alpha: 0.4),
                      blurRadius: 26,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Icon(LucideIcons.mic, size: 34, color: k.onAccent),
              ),
              const SizedBox(height: 14),
              Text(
                lesson.title ?? stage.title,
                textAlign: TextAlign.center,
                style: korasSerif(24, height: 1.12, color: k.ink900),
              ),
              if (stage.theme != null && stage.theme!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  stage.theme!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: k.ink700),
                ),
              ],
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
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
                  KorasPill(label: '${lesson.steps.length} steps'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const KorasEyebrow(text: 'In this lesson'),
        const SizedBox(height: 10),
        for (final step in lesson.steps) ...[
          _StepRow(
            step: step,
            done: stage.isStepCompleted(lesson.lessonId, step.stepId),
            isNext: step.stepId == firstIncomplete?.stepId,
            onTap: () => openStep(step),
          ),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 14),
        KorasButton.primary(
          onPressed: firstIncomplete == null
              ? null
              : () => openStep(firstIncomplete),
          child: Text(
            firstIncomplete == null
                ? 'Lesson complete'
                : 'Start lesson · +${lesson.totalXp} XP',
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({
    required this.step,
    required this.done,
    required this.isNext,
    required this.onTap,
  });

  final ReadingStep step;
  final bool done;
  final bool isNext;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      radius: 20,
      strong: isNext,
      padding: const EdgeInsets.all(14),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: done
                  ? k.success.withValues(alpha: 0.16)
                  : isNext
                      ? k.ember
                      : k.ember.withValues(alpha: 0.13),
            ),
            child: Icon(
              done ? LucideIcons.check : readingStepIcon(step.type),
              size: 21,
              color: done
                  ? k.success
                  : isNext
                      ? k.onAccent
                      : k.accentDeep,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        readingStepLabel(step),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: k.ink900),
                      ),
                    ),
                    if (isNext) ...[
                      const SizedBox(width: 8),
                      const KorasPill(
                          label: 'Start here', tone: PillTone.accent),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  _stepMeta(step),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.muted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '+${step.xp}',
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

String _capitalise(String s) =>
    s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
