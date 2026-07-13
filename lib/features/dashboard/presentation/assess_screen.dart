import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../shared/widgets/audio/koras_audio_player.dart';
import '../../../shared/widgets/audio/voice_recorder.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../../dashboards/presentation/learner_home_provider.dart';
import '../data/assessments_repository.dart';
import '../data/voice_assessment.dart';
import 'widgets/score_summary.dart';

/// Record a 30-second sample → analyse → show the report. Reachable from the
/// learner home and practice catalogue. See 12.
class AssessScreen extends HookConsumerWidget {
  const AssessScreen({
    super.key,
    this.isBaseline = false,
    this.prompt =
        'Speak for 30 seconds about anything — your day, a goal, a story.',
  });

  final bool isBaseline;
  final String prompt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysing = useState(false);
    final result = useState<VoiceAssessment?>(null);
    final error = useState<String?>(null);

    Future<void> handle(File file, String mimeType) async {
      analysing.value = true;
      error.value = null;
      try {
        final assessment =
            await ref.read(assessmentsRepositoryProvider).persistAssessment(
                  file: file,
                  mimeType: mimeType,
                  isBaseline: isBaseline,
                );
        result.value = assessment;
        ref.invalidate(latestAssessmentProvider);
        ref.invalidate(assessmentHistoryProvider);
        ref.invalidate(learnerHomeProvider);
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        analysing.value = false;
      }
    }

    return KorasScreen(
      title: isBaseline ? 'Baseline assessment' : 'Quick assessment',
      children: [
        const SizedBox(height: 24),
        if (result.value != null)
          _Report(
              assessment: result.value!,
              onAgain: () {
                result.value = null;
              })
        else if (analysing.value)
          const _Analysing()
        else
          Center(
            child: VoiceRecorder(
              prompt: prompt,
              onComplete: handle,
            ),
          ),
        if (error.value != null) ...[
          const SizedBox(height: 16),
          Text(error.value!, style: TextStyle(color: context.koras.danger)),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}

/// Handoff `LAnalyzing` — glass tile with an ember bloom + serif status copy.
class _Analysing extends StatelessWidget {
  const _Analysing();

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: k.glassFill,
              borderRadius: BorderRadius.circular(34),
              border: Border.all(color: k.glassBorder, width: 0.75),
              boxShadow: [
                BoxShadow(
                  color: k.ember.withValues(alpha: 0.25),
                  blurRadius: 44,
                  spreadRadius: -4,
                ),
              ],
            ),
            child: SizedBox(
              width: 44,
              height: 44,
              child: CircularProgressIndicator(strokeWidth: 3, color: k.ember),
            ),
          ),
          const SizedBox(height: 26),
          Text('Analyzing your read…',
              style: korasSerifItalic(26, color: k.ink900)),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: Text(
              'Measuring pitch, pace, clarity, loudness and tonality. Usually 5–15 seconds.',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: k.muted, height: 1.5),
            ),
          ),
          const SizedBox(height: 22),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              KorasPill(
                  label: 'Transcribed',
                  tone: PillTone.success,
                  icon: LucideIcons.check),
              KorasPill(
                  label: 'Scoring',
                  tone: PillTone.accent,
                  icon: LucideIcons.sparkles),
              KorasPill(label: 'Coach notes', tone: PillTone.glass),
            ],
          ),
        ],
      ),
    );
  }
}

class _Report extends StatelessWidget {
  const _Report({required this.assessment, required this.onAgain});

  final VoiceAssessment assessment;
  final VoidCallback onAgain;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScoreSummary(assessment: assessment),
        if (assessment.coachFeedback != null) ...[
          const SizedBox(height: 16),
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Coach', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(assessment.coachFeedback!),
              ],
            ),
          ),
        ],
        if (assessment.audioKey != null) ...[
          const SizedBox(height: 16),
          KorasCard(child: KorasAudioPlayer(audioKey: assessment.audioKey!)),
        ],
        const SizedBox(height: 24),
        KorasButton.primary(
          onPressed: onAgain,
          child: const Text('Record again'),
        ),
      ],
    );
  }
}
