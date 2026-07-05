import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/audio/voice_recorder.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/ielts_models.dart';
import '../data/ielts_repository.dart';
import '../domain/ielts_block.dart';
import '../domain/ielts_enums.dart';
import '../domain/ielts_lessons.dart';
import 'widgets/ielts_report_view.dart';

class IeltsHomeScreen extends ConsumerWidget {
  const IeltsHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(ieltsProgressProvider).valueOrNull;
    final units = <int, List<IeltsLesson>>{};
    for (final l in kIeltsLessons) {
      units.putIfAbsent(l.unit, () => []).add(l);
    }
    final unitKeys = units.keys.toList()..sort();

    return KorasScreen(
      title: 'IELTS Speaking',
      children: [
        const SizedBox(height: 12),
        if (progress?.bestBand != null)
          KorasCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Best band'),
                Text(progress!.bestBand!.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
        const SizedBox(height: 12),
        KorasButton.secondary(
          onPressed: () => context.go('/app/ielts/mock-test'),
          child: const Text('Take a full mock test'),
        ),
        const SizedBox(height: 20),
        for (final u in unitKeys) ...[
          Text(units[u]!.first.unitTitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          for (final lesson in units[u]!) ...[
            KorasCard(
              onTap: () => context.go('/app/ielts/lessons/${lesson.id}'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lesson.title,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text(lesson.description,
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 6),
                  Text('${lesson.estimatedMinutes} min · ${lesson.xpReward} XP',
                      style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}

/// Walks a lesson's blocks one at a time, persisting the index (debounced).
class IeltsLessonScreen extends HookConsumerWidget {
  const IeltsLessonScreen({super.key, required this.lessonId});
  final String lessonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesson = ieltsLessonById(lessonId);
    if (lesson == null) {
      return const KorasScreen(
        title: 'Lesson',
        children: [Text('Lesson not found.')],
      );
    }

    final index = useState(0);
    final report = useState<IeltsReport?>(null);
    final busy = useState(false);
    final error = useState<String?>(null);
    final saveTimer = useRef<Timer?>(null);

    void persist(int i) {
      saveTimer.value?.cancel();
      saveTimer.value = Timer(const Duration(milliseconds: 300), () {
        ref
            .read(ieltsRepositoryProvider)
            .saveState(lessonId, i, List.generate(i, (j) => j))
            .catchError((_) {});
      });
    }

    final block = lesson.blocks[index.value];
    final isLast = index.value == lesson.blocks.length - 1;

    Future<void> submitRecording(
        File file, String mimeType, String prompt, IeltsPart part) async {
      busy.value = true;
      error.value = null;
      try {
        final bytes = await file.readAsBytes();
        final r = await ref.read(ieltsRepositoryProvider).submitRecording(
              lessonId: lessonId,
              part: part,
              bytes: bytes,
              mimeType: mimeType,
              prompt: prompt,
            );
        report.value = r;
        ref.invalidate(ieltsProgressProvider);
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        busy.value = false;
      }
    }

    if (report.value != null) {
      return KorasScreen(
        title: lesson.title,
        children: [
          const SizedBox(height: 12),
          IeltsReportView(report: report.value!),
          const SizedBox(height: 20),
          KorasButton.primary(
            onPressed: () => context.go('/app/ielts'),
            child: const Text('Back to lessons'),
          ),
          const SizedBox(height: 24),
        ],
      );
    }

    return KorasScreen(
      title: lesson.title,
      children: [
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: (index.value + 1) / lesson.blocks.length,
          color: context.koras.ember,
          backgroundColor: context.koras.line,
        ),
        const SizedBox(height: 20),
        if (busy.value)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 48),
            child: Center(child: CircularProgressIndicator()),
          )
        else
          _IeltsBlockView(block: block, onRecord: submitRecording),
        if (error.value != null) ...[
          const SizedBox(height: 12),
          Text(error.value!, style: TextStyle(color: context.koras.danger)),
        ],
        const SizedBox(height: 24),
        Row(
          children: [
            if (index.value > 0)
              KorasButton.secondary(
                onPressed: () {
                  index.value--;
                  persist(index.value);
                },
                child: const Text('Back'),
              ),
            const Spacer(),
            if (!isLast)
              KorasButton.primary(
                onPressed: () {
                  index.value++;
                  persist(index.value);
                },
                child: const Text('Next'),
              )
            else
              KorasButton.primary(
                onPressed: () => context.go('/app/ielts'),
                child: const Text('Finish'),
              ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

/// Renders a single block. Record blocks embed the voice recorder + submit.
class _IeltsBlockView extends StatelessWidget {
  const _IeltsBlockView({required this.block, required this.onRecord});

  final IeltsBlock block;
  final Future<void> Function(File, String, String, IeltsPart) onRecord;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return switch (block) {
      ExplanationBlock(:final title, :final body) => KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: t.titleMedium),
              const SizedBox(height: 8),
              Text(body),
            ],
          ),
        ),
      ExampleAnswerBlock(
        :final prompt,
        :final weakAnswer,
        :final strongAnswer,
        :final whyStrong
      ) =>
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(prompt, style: t.titleSmall),
              const SizedBox(height: 8),
              Text('Weaker: $weakAnswer'),
              const SizedBox(height: 4),
              Text('Stronger: $strongAnswer'),
              const SizedBox(height: 4),
              Text(whyStrong, style: t.bodySmall),
            ],
          ),
        ),
      WeakStrongBlock(:final weak, :final strong, :final notes) => KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Weaker: $weak'),
              const SizedBox(height: 4),
              Text('Stronger: $strong'),
              const SizedBox(height: 8),
              Text(notes, style: t.bodySmall),
            ],
          ),
        ),
      FormulaBlock(:final formulaName, :final steps) => KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(formulaName, style: t.titleMedium),
              const SizedBox(height: 8),
              for (final s in steps) Text('• $s'),
            ],
          ),
        ),
      MultipleChoiceBlock(
        :final question,
        :final options,
        :final explanation
      ) =>
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(question, style: t.titleSmall),
              const SizedBox(height: 8),
              for (final o in options) Text('• ${o.text}'),
              const SizedBox(height: 8),
              Text(explanation, style: t.bodySmall),
            ],
          ),
        ),
      RecordAnswerBlock(
        :final prompt,
        :final durationSeconds,
        :final targetPart,
        :final instructions
      ) =>
        KorasCard(
          child: Column(
            children: [
              Text(instructions, style: t.bodySmall),
              const SizedBox(height: 16),
              VoiceRecorder(
                prompt: prompt,
                duration: Duration(seconds: durationSeconds),
                onComplete: (f, m) => onRecord(f, m, prompt, targetPart),
              ),
            ],
          ),
        ),
      CueCardBlock(:final topic, :final bulletPoints, :final speakingSeconds) =>
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(topic, style: t.titleMedium),
              const SizedBox(height: 8),
              for (final b in bulletPoints) Text('• $b'),
              const SizedBox(height: 16),
              VoiceRecorder(
                prompt: topic,
                duration: Duration(seconds: speakingSeconds),
                onComplete: (f, m) => onRecord(f, m, topic, IeltsPart.part2),
              ),
            ],
          ),
        ),
      VocabularyUpgradeBlock(
        :final basicPhrase,
        :final upgradedPhrases,
        :final practicePrompt,
        :final durationSeconds
      ) =>
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Upgrade: $basicPhrase', style: t.titleSmall),
              const SizedBox(height: 8),
              for (final u in upgradedPhrases) Text('• ${u.phrase}'),
              const SizedBox(height: 16),
              VoiceRecorder(
                prompt: practicePrompt,
                duration: Duration(seconds: durationSeconds),
                onComplete: (f, m) =>
                    onRecord(f, m, practicePrompt, IeltsPart.part1),
              ),
            ],
          ),
        ),
      PronunciationBlock(
        :final phrase,
        :final modelText,
        :final recordingSeconds
      ) =>
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(phrase, style: t.titleMedium),
              const SizedBox(height: 8),
              Text(modelText),
              const SizedBox(height: 16),
              VoiceRecorder(
                prompt: phrase,
                duration: Duration(seconds: recordingSeconds),
                onComplete: (f, m) => onRecord(f, m, phrase, IeltsPart.part1),
              ),
            ],
          ),
        ),
      AiTutorMockBlock(:final instructions) => KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AI Tutor mock', style: t.titleMedium),
              const SizedBox(height: 8),
              Text(instructions),
              const SizedBox(height: 12),
              Builder(
                builder: (context) => KorasButton.primary(
                  onPressed: () => context.go('/app/ai-tutor'),
                  child: const Text('Launch AI Tutor'),
                ),
              ),
            ],
          ),
        ),
      SummaryBlock(:final keyTakeaways) => KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Key takeaways', style: t.titleMedium),
              const SizedBox(height: 8),
              for (final k in keyTakeaways) Text('• $k'),
            ],
          ),
        ),
    };
  }
}

class IeltsPracticeScreen extends StatelessWidget {
  const IeltsPracticeScreen({super.key, required this.part});
  final IeltsPart part;

  @override
  Widget build(BuildContext context) {
    final lessons = ieltsLessonsForPart(part);
    return KorasScreen(
      title: 'Practice — ${part.wire.replaceAll('_', ' ')}',
      children: [
        const SizedBox(height: 12),
        if (lessons.isEmpty)
          const Text('No lessons for this part yet.')
        else
          for (final l in lessons) ...[
            KorasCard(
              onTap: () => context.go('/app/ielts/lessons/${l.id}'),
              child: Text(l.title),
            ),
            const SizedBox(height: 10),
          ],
      ],
    );
  }
}

class IeltsMockTestScreen extends ConsumerWidget {
  const IeltsMockTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KorasScreen(
      title: 'Mock test',
      children: [
        const SizedBox(height: 12),
        const KorasCard(
          child: Text(
            'A full mock test runs three back-to-back recordings — Part 1, '
            'Part 2 (cue card), and Part 3 — then gives you an aggregate band.',
          ),
        ),
        const SizedBox(height: 16),
        KorasButton.primary(
          onPressed: () => context.go('/app/ielts/practice/part-1'),
          child: const Text('Start with Part 1'),
        ),
      ],
    );
  }
}

class IeltsResultScreen extends StatelessWidget {
  const IeltsResultScreen({super.key, required this.attemptId});
  final String attemptId;

  @override
  Widget build(BuildContext context) {
    return const KorasScreen(
      title: 'Result',
      children: [
        SizedBox(height: 12),
        KorasCard(
          child: Text('Open this attempt from your lesson to see the report.'),
        ),
      ],
    );
  }
}
