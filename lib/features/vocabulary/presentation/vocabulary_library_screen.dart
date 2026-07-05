import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/vocabulary_models.dart';
import '../data/vocabulary_repository.dart';

part 'vocabulary_library_screen.g.dart';

@riverpod
Future<List<VocabularyLibraryEntry>> vocabularyLibrary(Ref ref) =>
    ref.watch(vocabularyRepositoryProvider).library();

@riverpod
Future<Map<String, dynamic>> vocabularyHistory(Ref ref) =>
    ref.watch(vocabularyRepositoryProvider).history();

/// All the words a user has learned — grouped by status.
class VocabularyLibraryScreen extends ConsumerWidget {
  const VocabularyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(vocabularyLibraryProvider);
    return KorasScreen(
      title: 'Library',
      children: [
        const SizedBox(height: 8),
        entriesAsync.when(
          data: (entries) => _EntryList(entries: entries),
          loading: () => const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text('Error: $e'),
        ),
      ],
    );
  }
}

class _EntryList extends StatelessWidget {
  const _EntryList({required this.entries});
  final List<VocabularyLibraryEntry> entries;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const KorasCard(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Center(
              child: Text('No words yet. Complete today to start building.')),
        ),
      );
    }
    return Column(
      children: [
        for (final e in entries)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: KorasCard(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.word,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 2),
                        Text(
                          [
                            if (e.status != null) e.status!,
                            if (e.box != null) 'Box ${e.box}',
                            '${e.timesReviewed} reviews',
                          ].join(' • '),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: context.koras.ink500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Per-day history — recent daily sets and their word stages.
class VocabularyHistoryScreen extends ConsumerWidget {
  const VocabularyHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(vocabularyHistoryProvider);
    return KorasScreen(
      title: 'History',
      children: [
        const SizedBox(height: 8),
        historyAsync.when(
          data: (data) {
            final days = (data['days'] as List?) ?? const [];
            if (days.isEmpty) {
              return const KorasCard(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: Text('No history yet.')),
                ),
              );
            }
            return Column(
              children: [
                for (final d in days) _DayCard(day: d as Map),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text('Error: $e'),
        ),
      ],
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({required this.day});
  final Map day;

  @override
  Widget build(BuildContext context) {
    final words = (day['words'] as List?) ?? const [];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: KorasCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${day['set_date']}',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 6),
            for (final w in words)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Expanded(child: Text('${w['word']}')),
                    Text('${w['stage'] ?? '-'}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: context.koras.ink500)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
