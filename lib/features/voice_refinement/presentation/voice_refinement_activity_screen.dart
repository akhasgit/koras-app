import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../services/koras_api_client.dart';
import '../../../shared/widgets/audio/voice_recorder.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/voice_refinement_models.dart';
import '../data/voice_refinement_repository.dart';

/// Detail + runtime for one Voice Refinement plan activity.
class VoiceRefinementActivityScreen extends HookConsumerWidget {
  const VoiceRefinementActivityScreen({
    super.key,
    required this.activityId,
    required this.planId,
    required this.day,
    this.isCheckpoint = false,
  });

  final String activityId;
  final String planId;
  final int day;
  final bool isCheckpoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final busy = useState(false);
    final result = useState<VoiceRefinementAttempt?>(null);
    final error = useState<String?>(null);
    final markingDone = useState(false);

    Future<void> handleRecording(File file, String mimeType) async {
      busy.value = true;
      error.value = null;
      try {
        final repo = ref.read(voiceRefinementRepositoryProvider);
        final start = await repo.startAttempt(
          planId: planId,
          activityId: activityId,
          day: day,
          isCheckpoint: isCheckpoint,
          audioMimeType: mimeType,
        );
        final bytes = await file.readAsBytes();
        await ref.read(korasApiClientProvider).putBytesToR2(
              start.upload.url,
              bytes,
              start.upload.contentType,
            );
        await repo.reportAttemptUpload(
          attemptId: start.attempt.id,
          recordingUploadStatus: 'uploaded',
        );
        await repo.startAttemptAnalysis(start.attempt.id);
        final done = await repo.pollAttempt(start.attempt.id);
        result.value = done;
        ref.invalidate(voiceRefinementPlanProvider);
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        busy.value = false;
      }
    }

    Future<void> markComplete() async {
      markingDone.value = true;
      error.value = null;
      try {
        await ref
            .read(voiceRefinementRepositoryProvider)
            .completeActivity(activityId, planId: planId);
        ref.invalidate(voiceRefinementPlanProvider);
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        markingDone.value = false;
      }
    }

    final k = context.koras;
    final isRecording = activityId.contains('recording') || isCheckpoint;

    return KorasScreen(
      title: isCheckpoint ? 'Checkpoint' : 'Activity',
      children: [
        const SizedBox(height: 12),
        if (result.value != null)
          _AttemptReport(attempt: result.value!)
        else if (busy.value)
          const _Analysing()
        else if (isRecording)
          KorasCard(
            child: Center(
              child: VoiceRecorder(
                prompt: isCheckpoint
                    ? 'Speak for 30 seconds — the same prompt as your baseline.'
                    : 'Follow the activity instructions and record.',
                duration: Duration(seconds: isCheckpoint ? 30 : 45),
                onComplete: handleRecording,
              ),
            ),
          )
        else
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Practice drill',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                const Text(
                    'Follow the drill instructions and mark it complete.'),
                const SizedBox(height: 16),
                KorasButton.primary(
                  onPressed: markingDone.value ? null : markComplete,
                  child: Text(
                      markingDone.value ? 'Saving…' : 'Mark as complete'),
                ),
              ],
            ),
          ),
        if (error.value != null) ...[
          const SizedBox(height: 16),
          Text(error.value!, style: TextStyle(color: k.danger)),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}

class _Analysing extends StatelessWidget {
  const _Analysing();
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('Analysing…',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      );
}

class _AttemptReport extends StatelessWidget {
  const _AttemptReport({required this.attempt});
  final VoiceRefinementAttempt attempt;

  @override
  Widget build(BuildContext context) {
    final scores = attempt.scores ?? const {};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Results', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 12),
              for (final e in scores.entries)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: [
                      Expanded(child: Text(e.key)),
                      Text('${e.value}',
                          style:
                              const TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
            ],
          ),
        ),
        if (attempt.coachFeedback != null) ...[
          const SizedBox(height: 12),
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Coach', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(attempt.coachFeedback!),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
