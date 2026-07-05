import 'package:flutter/material.dart';

import '../../../../shared/widgets/koras_card.dart';
import '../../../../shared/widgets/koras_score_bar.dart';
import '../../../../shared/widgets/koras_score_ring.dart';
import '../../data/ai_tutor_report.dart';

/// Report after an AI Tutor session: overall ring, 10-dim grid, feedback. See 13.
class AiTutorReportView extends StatelessWidget {
  const AiTutorReportView({super.key, required this.report});
  final AiTutorReport report;

  @override
  Widget build(BuildContext context) {
    final s = report.scores;
    final dims = <(String, int)>[
      ('Relevance', s.relevance),
      ('Eloquence', s.eloquence),
      ('Fluency', s.fluency),
      ('Grammar', s.grammar),
      ('Tense', s.tense),
      ('Filler control', s.fillerControl),
      ('Clarity', s.clarity),
      ('Confidence', s.confidence),
      ('Vocabulary', s.vocabulary),
      ('Listening', s.listening),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KorasCard(
          child: Column(
            children: [
              Center(
                child: KorasScoreRing(value: report.overall, label: 'Overall'),
              ),
              const SizedBox(height: 20),
              for (final d in dims) ...[
                KorasScoreBar(value: d.$2, label: d.$1),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Summary', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(report.feedback.summary),
              if (report.feedback.strengths.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Strengths',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                for (final x in report.feedback.strengths) Text('• $x'),
              ],
              if (report.feedback.improvements.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Improvements',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 4),
                for (final x in report.feedback.improvements) Text('• $x'),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
