import 'package:flutter/material.dart';

import '../../../../core/theme/koras_theme.dart';
import '../../../../shared/widgets/koras_card.dart';
import '../../../../shared/widgets/koras_score_bar.dart';
import '../../data/ielts_models.dart';
import '../../domain/ielts_scoring.dart';

/// IELTS attempt report: estimated band, four criteria, feedback. See 14.
class IeltsReportView extends StatelessWidget {
  const IeltsReportView({super.key, required this.report});
  final IeltsReport report;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final band = roundToNearestHalfBand(report.practiceBandEstimate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KorasCard(
          child: Column(
            children: [
              Text('Estimated band',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              Text(
                band.toStringAsFixed(band % 1 == 0 ? 0 : 1),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: k.ember),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Criteria', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              for (final entry in ieltsCriterionLabels.entries) ...[
                KorasScoreBar(
                  value: (report.criteriaScores[entry.key] ?? 0).round(),
                  label: entry.value,
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
        if (report.codeSwitchingDetected) ...[
          const SizedBox(height: 16),
          KorasCard(
            child: Text(
              'We heard some non-English speech — IELTS is English-only, so try '
              'to stay in English next time.',
              style: TextStyle(color: k.warning),
            ),
          ),
        ],
        if (report.feedback.summary.isNotEmpty) ...[
          const SizedBox(height: 16),
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Feedback',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(report.feedback.summary),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
