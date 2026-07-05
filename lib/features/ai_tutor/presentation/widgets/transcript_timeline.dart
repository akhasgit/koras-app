import 'package:flutter/material.dart';

import '../../../../core/theme/koras_theme.dart';
import '../../data/ai_tutor_report.dart';
import '../../domain/ai_tutor_enums.dart';

/// Chat-style timeline of conversation turns during/after a session. See 10.
class TranscriptTimeline extends StatelessWidget {
  const TranscriptTimeline({super.key, required this.turns});
  final List<AiTutorTurn> turns;

  @override
  Widget build(BuildContext context) {
    if (turns.isEmpty) {
      return Center(
        child: Text(
          'Your conversation will appear here.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: turns.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, i) => _Bubble(turn: turns[i]),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.turn});
  final AiTutorTurn turn;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final isUser = turn.role == TurnRole.user;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isUser ? k.emberSoft : k.paperWarm,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: k.line),
        ),
        child: Text(turn.transcript),
      ),
    );
  }
}
