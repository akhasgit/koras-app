import 'package:flutter/material.dart';

import '../../../../shared/widgets/koras_card.dart';
import '../../../../shared/widgets/koras_score_bar.dart';
import '../../../../shared/widgets/koras_score_ring.dart';
import '../../data/voice_assessment.dart';

/// Latest assessment summary — score ring + five dimension bars.
class ScoreSummary extends StatelessWidget {
  const ScoreSummary({super.key, required this.assessment});
  final VoiceAssessment assessment;

  @override
  Widget build(BuildContext context) {
    final s = assessment.scores;
    return KorasCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your voice', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Center(child: KorasScoreRing(value: s.overall, label: 'Overall')),
          const SizedBox(height: 20),
          KorasScoreBar(value: s.pitch, label: 'Pitch'),
          const SizedBox(height: 12),
          KorasScoreBar(value: s.pace, label: 'Pace'),
          const SizedBox(height: 12),
          KorasScoreBar(value: s.clarity, label: 'Clarity'),
          const SizedBox(height: 12),
          KorasScoreBar(value: s.resonance, label: 'Resonance'),
          const SizedBox(height: 12),
          KorasScoreBar(value: s.confidence, label: 'Confidence'),
        ],
      ),
    );
  }
}
