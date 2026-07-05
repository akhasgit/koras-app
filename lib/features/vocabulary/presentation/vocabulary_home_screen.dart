import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/vocabulary_models.dart';
import '../data/vocabulary_repository.dart';

/// Daily Vocabulary programme home — today's 5 words + progress summary.
class VocabularyHomeScreen extends ConsumerWidget {
  const VocabularyHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayAsync = ref.watch(vocabularyTodayProvider);
    final progressAsync = ref.watch(vocabularyProgressProvider);

    return KorasScreen(
      title: 'Daily Vocabulary',
      children: [
        const SizedBox(height: 8),
        progressAsync.when(
          data: (p) => _StatsRow(progress: p),
          loading: () => const _StatsLoading(),
          error: (e, _) => Text('Progress error: $e'),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Text("Today's words",
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            TextButton.icon(
              onPressed: () => context.push('/app/vocabulary/library'),
              icon: const Icon(LucideIcons.library, size: 16),
              label: const Text('Library'),
            ),
            TextButton.icon(
              onPressed: () => context.push('/app/vocabulary/history'),
              icon: const Icon(LucideIcons.history, size: 16),
              label: const Text('History'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        todayAsync.when(
          data: (t) => _WordList(response: t),
          loading: () => const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text("Couldn't load today: $e"),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _StatsLoading extends StatelessWidget {
  const _StatsLoading();
  @override
  Widget build(BuildContext context) => const KorasCard(
        child: SizedBox(
          height: 60,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.progress});
  final VocabularyProgressSummary progress;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    Widget stat(IconData icon, String label, String value) => Expanded(
          child: Column(
            children: [
              Icon(icon, size: 20, color: k.ember),
              const SizedBox(height: 4),
              Text(value,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700)),
              Text(label,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.ink500)),
            ],
          ),
        );
    return KorasCard(
      child: Row(
        children: [
          stat(LucideIcons.flame, 'Streak', '${progress.currentStreak}'),
          stat(LucideIcons.zap, 'XP', '${progress.xp}'),
          stat(LucideIcons.trophy, 'Level', '${progress.level}'),
          stat(LucideIcons.bookmark, 'Mastered', '${progress.masteredCount}'),
        ],
      ),
    );
  }
}

class _WordList extends StatelessWidget {
  const _WordList({required this.response});
  final VocabularyTodayResponse response;

  @override
  Widget build(BuildContext context) {
    final progressByWord = <String, String>{
      for (final p in response.progress) p.word: p.stage,
    };
    final words = response.words.isEmpty
        ? response.dailySet.words
        : response.words;
    return Column(
      children: [
        for (final w in words)
          _WordRow(
            word: w,
            stage: progressByWord[w.word] ?? 'learn',
            dailySetId: response.dailySet.id,
          ),
      ],
    );
  }
}

class _WordRow extends StatelessWidget {
  const _WordRow({
    required this.word,
    required this.stage,
    required this.dailySetId,
  });

  final VocabularyWord word;
  final String stage;
  final String dailySetId;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final mastered = stage == 'mastered';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: KorasCard(
        onTap: () => context.push(
          '/app/vocabulary/word/${Uri.encodeComponent(word.word)}'
          '?setId=$dailySetId',
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(word.word,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700)),
                      const SizedBox(width: 8),
                      if (word.ipa != null)
                        Text('/${word.ipa}/',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: k.ink500)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  if (word.definition != null)
                    Text(word.definition!,
                        style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _StagePill(stage: stage, mastered: mastered),
          ],
        ),
      ),
    );
  }
}

class _StagePill extends StatelessWidget {
  const _StagePill({required this.stage, required this.mastered});
  final String stage;
  final bool mastered;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final label = switch (stage) {
      'learn' => 'Learn',
      'pronounce' => 'Say',
      'sentence' => 'Use',
      'mastered' => 'Mastered',
      _ => stage,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: mastered ? k.success.withValues(alpha: 0.14) : k.emberSoft,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: mastered ? k.success : k.ember,
                fontWeight: FontWeight.w600,
              )),
    );
  }
}

/// Word detail screen — runs the pronounce → sentence flow for one word.
class VocabularyWordScreen extends HookConsumerWidget {
  const VocabularyWordScreen({
    super.key,
    required this.word,
    required this.dailySetId,
  });

  final String word;
  final String dailySetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KorasScreen(
      title: word,
      children: [
        const SizedBox(height: 16),
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pronounce', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              const Text('Record yourself saying the word. AI will score you.'),
              const SizedBox(height: 16),
              KorasButton.primary(
                onPressed: () => context.push(
                  '/app/vocabulary/attempt?word=${Uri.encodeComponent(word)}'
                  '&kind=pronounce&setId=$dailySetId',
                ),
                child: const Text('Start pronunciation'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Use in a sentence',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              const Text(
                  'Record yourself using the word in a natural sentence.'),
              const SizedBox(height: 16),
              KorasButton.secondary(
                onPressed: () => context.push(
                  '/app/vocabulary/attempt?word=${Uri.encodeComponent(word)}'
                  '&kind=sentence&setId=$dailySetId',
                ),
                child: const Text('Start sentence practice'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
