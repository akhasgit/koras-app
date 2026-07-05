import 'package:flutter/material.dart';

import '../../../../core/theme/koras_theme.dart';
import '../../../../shared/widgets/koras_card.dart';
import '../../../../shared/widgets/koras_eyebrow.dart';
import '../../data/voice_assessment.dart';

/// Coach feedback for the latest assessment.
class CoachCard extends StatelessWidget {
  const CoachCard({super.key, required this.assessment});
  final VoiceAssessment assessment;

  @override
  Widget build(BuildContext context) {
    final feedback = assessment.coachFeedback;
    if (feedback == null || feedback.isEmpty) return const SizedBox.shrink();
    return KorasCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KorasEyebrow(text: 'Coach', tone: EyebrowTone.ember),
          const SizedBox(height: 8),
          Text(
            feedback,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: context.koras.ink700),
          ),
        ],
      ),
    );
  }
}
