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
import '../../../shared/widgets/koras_metric_stat.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/reading_models.dart';
import '../data/reading_repository.dart';

/// Results (post-analysis): chip row ("92% MATCH · +4% PACE · Smooth FLOW"),
/// per-word feedback highlighting on the passage, coach feedback, and the
/// low-signal re-record prompt (§6.9).
class ReadingResultsScreen extends ConsumerWidget {
  const ReadingResultsScreen({
    super.key,
    required this.attemptId,
    this.initial,
  });

  final String attemptId;

  /// Attempt passed via router `extra` straight after analysis — skips a
  /// refetch; deep links fall back to `GET /attempt/{id}`.
  final ReadingAttempt? initial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (initial != null && initial!.id == attemptId) {
      return _ResultsBody(attempt: initial!);
    }
    final attemptAsync = ref.watch(readingAttemptProvider(attemptId));
    return attemptAsync.when(
      loading: () => const KorasScreen(
        title: 'Your read',
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      error: (e, _) => KorasScreen(
        title: 'Your read',
        children: [
          KorasError(
            message: errorToMessage(e),
            onRetry: () => ref.invalidate(readingAttemptProvider(attemptId)),
          ),
        ],
      ),
      data: (attempt) => _ResultsBody(attempt: attempt),
    );
  }
}

class _ResultsBody extends HookConsumerWidget {
  const _ResultsBody({required this.attempt});

  final ReadingAttempt attempt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final busy = useState(false);
    final error = useState<String?>(null);

    final hasStepContext = attempt.stageId != null &&
        attempt.lessonId != null &&
        attempt.stepId != null;

    Future<void> continueAndComplete() async {
      busy.value = true;
      error.value = null;
      try {
        await ref.read(readingRepositoryProvider).completeLesson(
              stageId: attempt.stageId!,
              lessonId: attempt.lessonId!,
              stepId: attempt.stepId!,
              attemptId: attempt.id,
            );
        ref.invalidate(readingStageProvider(attempt.stageId!));
        ref.invalidate(readingProgramProvider);
        ref.invalidate(readingProgressProvider);
        if (context.mounted) {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/app/reading');
          }
        }
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        busy.value = false;
      }
    }

    void reRecord() {
      if (hasStepContext) {
        context.pushReplacement(
          '/app/reading/read/'
          '${attempt.stageId}~${attempt.lessonId}~${attempt.stepId}',
        );
      } else if (context.canPop()) {
        context.pop();
      } else {
        context.go('/app/reading');
      }
    }

    return KorasScreen(
      title: 'Your read',
      kicker: 'Results',
      children: [
        // Chip row
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final chip in attempt.chips)
              KorasPill(
                label: chip,
                tone: PillTone.accent,
                icon: LucideIcons.sparkles,
              ),
          ],
        ),
        const SizedBox(height: 14),
        // Metric card (LRead metric row)
        GlassCard(
          strong: true,
          radius: 26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KorasMetricStat(
                value: '${attempt.matchPct ?? '–'}',
                unit: '%',
                label: 'Match',
                color: k.scoreColor(attempt.matchPct ?? 0),
              ),
              Container(width: 1, height: 40, color: k.line),
              KorasMetricStat(
                value: attempt.paceDeltaPct == null
                    ? '–'
                    : '${attempt.paceDeltaPct! >= 0 ? '+' : ''}'
                        '${attempt.paceDeltaPct}',
                unit: '%',
                label: 'Pace',
              ),
              Container(width: 1, height: 40, color: k.line),
              KorasMetricStat(value: attempt.flowBand, label: 'Flow'),
            ],
          ),
        ),
        // Low signal (§6.9) — re-record prompt.
        if (attempt.lowSignal) ...[
          const SizedBox(height: 14),
          GlassCard(
            child: Column(
              children: [
                Icon(LucideIcons.triangleAlert, color: k.warn, size: 30),
                const SizedBox(height: 10),
                Text(
                  "We couldn't hear that clearly. Find a quieter spot, hold "
                  'the phone a little closer, and have another go.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 14),
                KorasButton.primary(
                  onPressed: reRecord,
                  child: const Text('Re-record'),
                ),
              ],
            ),
          ),
        ],
        // Per-word feedback passage
        if (attempt.passageText != null &&
            attempt.passageText!.isNotEmpty) ...[
          const SizedBox(height: 14),
          GlassCard(
            radius: 26,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const KorasEyebrow(text: 'Word by word'),
                const SizedBox(height: 12),
                _AnnotatedPassage(attempt: attempt),
                if (attempt.wordFeedback.any(
                    (w) => w.status != 'correct' || w.hesitation)) ...[
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 12,
                    runSpacing: 6,
                    children: [
                      _LegendDot(color: k.danger, label: 'Missed or changed'),
                      _LegendDot(color: k.warn, label: 'Hesitation before'),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
        // Coach feedback
        if (attempt.coachFeedback != null) ...[
          const SizedBox(height: 14),
          GlassCard(
            radius: 26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const KorasEyebrow(text: 'Coach', tone: EyebrowTone.ember),
                const SizedBox(height: 10),
                Text(
                  attempt.coachFeedback!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: k.ink700, height: 1.5),
                ),
              ],
            ),
          ),
        ],
        if (error.value != null) ...[
          const SizedBox(height: 12),
          Text(error.value!, style: TextStyle(color: k.danger)),
        ],
        const SizedBox(height: 20),
        if (hasStepContext && !attempt.lowSignal)
          KorasButton.primary(
            onPressed: busy.value ? null : continueAndComplete,
            loading: busy.value,
            child: const Text('Continue'),
          )
        else if (!hasStepContext)
          KorasButton.primary(
            onPressed: () => context.canPop()
                ? context.pop()
                : context.go('/app/reading'),
            child: const Text('Done'),
          ),
        if (hasStepContext && !attempt.lowSignal) ...[
          const SizedBox(height: 10),
          KorasButton.glass(
            onPressed: reRecord,
            child: const Text('Read again'),
          ),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}

/// The passage with per-word highlighting from `word_feedback`:
/// substituted/skipped words in danger, hesitation-preceded words on a warm
/// wash, everything else in ink.
class _AnnotatedPassage extends StatelessWidget {
  const _AnnotatedPassage({required this.attempt});

  final ReadingAttempt attempt;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final tokens = attempt.passageText!.split(RegExp(r'\s+'));
    final byIndex = <int, ReadingWordFeedback>{
      for (final w in attempt.wordFeedback) w.index: w,
    };

    final spans = <InlineSpan>[];
    for (var i = 0; i < tokens.length; i++) {
      final fb = byIndex[i];
      final missed = fb != null &&
          (fb.status == 'substituted' || fb.status == 'skipped');
      final hesitated = fb?.hesitation ?? false;
      spans.add(TextSpan(
        text: tokens[i],
        style: korasSerif(
          19,
          weight: missed || hesitated ? FontWeight.w700 : FontWeight.w500,
          height: 1.6,
          color: missed ? k.danger : k.ink900,
        ).copyWith(
          backgroundColor:
              hesitated ? k.warn.withValues(alpha: 0.18) : null,
          decoration: missed ? TextDecoration.underline : null,
          decorationColor: k.danger,
          decorationStyle: TextDecorationStyle.wavy,
        ),
      ));
      if (i < tokens.length - 1) spans.add(const TextSpan(text: ' '));
    }

    return Text.rich(TextSpan(children: spans));
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style:
              Theme.of(context).textTheme.bodySmall?.copyWith(color: k.muted),
        ),
      ],
    );
  }
}
