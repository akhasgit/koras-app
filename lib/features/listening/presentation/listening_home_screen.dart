import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/listening_models.dart';
import '../data/listening_repository.dart';

/// Listening Comprehension programme home — passage grid + progress.
class ListeningHomeScreen extends ConsumerWidget {
  const ListeningHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passagesAsync = ref.watch(listeningPassagesProvider);
    return KorasScreen(
      title: 'Listening',
      children: [
        const SizedBox(height: 8),
        passagesAsync.when(
          data: (data) => _Body(data: data),
          loading: () => const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Text("Couldn't load passages: $e"),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.data});
  final ListeningPassagesResponse data;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final userProgress = data.userProgress ?? const {};
    final unlocked = (userProgress['highest_difficulty_unlocked'] as int?) ?? 1;
    final byDifficulty = <int, List<ListeningPassage>>{};
    for (final p in data.passages) {
      byDifficulty.putIfAbsent(p.difficulty, () => []).add(p);
    }
    final levels = byDifficulty.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (data.weakestSkills.isNotEmpty)
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Focus this week',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final s in data.weakestSkills)
                      Chip(
                        label: Text(s.replaceAll('_', ' ')),
                        backgroundColor: k.emberSoft,
                      ),
                  ],
                ),
              ],
            ),
          ),
        const SizedBox(height: 12),
        for (final level in levels)
          _DifficultySection(
            level: level,
            passages: byDifficulty[level]!,
            enabled: level <= unlocked + 1,
            progressByPassage: data.progressByPassage,
          ),
      ],
    );
  }
}

class _DifficultySection extends StatelessWidget {
  const _DifficultySection({
    required this.level,
    required this.passages,
    required this.enabled,
    required this.progressByPassage,
  });
  final int level;
  final List<ListeningPassage> passages;
  final bool enabled;
  final Map<String, ListeningPassageProgress> progressByPassage;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Icon(enabled ? LucideIcons.lockOpen : LucideIcons.lock,
                  size: 16, color: enabled ? k.ember : k.ink500),
              const SizedBox(width: 8),
              Text('Level $level',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
        for (final p in passages)
          _PassageRow(
            passage: p,
            enabled: enabled,
            progress: progressByPassage[p.id],
          ),
      ],
    );
  }
}

class _PassageRow extends StatelessWidget {
  const _PassageRow({
    required this.passage,
    required this.enabled,
    this.progress,
  });
  final ListeningPassage passage;
  final bool enabled;
  final ListeningPassageProgress? progress;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final bestScore = progress?.bestScore;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: KorasCard(
        onTap: enabled
            ? () => context.push('/app/listening/${passage.id}')
            : null,
        child: Row(
          children: [
            Icon(
              switch (passage.deliveryMode) {
                'conversation' => LucideIcons.messagesSquare,
                'monologue' => LucideIcons.mic,
                _ => LucideIcons.headphones,
              },
              color: enabled ? k.ember : k.ink300,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(passage.title,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 2),
                  Text(
                    [
                      passage.topic ?? '',
                      '${passage.estimatedMinutes ?? "?"} min',
                      if (bestScore != null) 'Best $bestScore%',
                    ].where((s) => s.isNotEmpty).join(' • '),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: k.ink500),
                  ),
                ],
              ),
            ),
            if (!enabled) Icon(LucideIcons.lock, size: 18, color: k.ink300),
          ],
        ),
      ),
    );
  }
}
