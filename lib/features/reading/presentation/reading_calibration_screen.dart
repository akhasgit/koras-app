import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../services/koras_api_client.dart';
import '../../../shared/widgets/audio/voice_recorder.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_eyebrow.dart';
import '../data/reading_models.dart';
import '../data/reading_repository.dart';
import 'calibration_passages.dart';

/// Calibration read — the ~60–80 word first read that seeds programme
/// generation. Uses a bundled persona-appropriate passage
/// (`calibration_passages.dart`).
class ReadingCalibrationScreen extends HookConsumerWidget {
  const ReadingCalibrationScreen({
    super.key,
    required this.persona,
    this.gradeLevel,
    this.hasBaseline = false,
    required this.onAnalysed,
    required this.onIntakeRequired,
  });

  final String persona;
  final int? gradeLevel;

  /// Softens the copy for users who already recorded a baseline (§6.1.3).
  final bool hasBaseline;

  /// Called when the calibration analysis completes — the server has started
  /// building the programme, so move to the building screen.
  final void Function(ReadingAttempt attempt) onAnalysed;

  /// Server said `intake_required` (409) — send the user back to intake.
  final VoidCallback onIntakeRequired;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final passage = calibrationPassageFor(persona, gradeLevel: gradeLevel);
    final busy = useState(false);
    final error = useState<String?>(null);

    Future<void> handle(File file, String mimeType) async {
      busy.value = true;
      error.value = null;
      try {
        final repo = ref.read(readingRepositoryProvider);
        final start = await repo.startAttempt(
          attemptType: 'calibration',
          passageText: passage.text,
          guideWpm: passage.guideWpm,
          audioMimeType: mimeType,
        );
        final bytes = await file.readAsBytes();
        await ref.read(korasApiClientProvider).putBytesToR2(
              start.upload.url,
              bytes,
              start.upload.contentType,
            );
        await repo.reportUploadStatus(
          attemptId: start.attempt.id,
          recordingUploadStatus: 'uploaded',
        );
        await repo.startAnalysis(start.attempt.id);
        final done = await repo.pollAttempt(start.attempt.id);
        onAnalysed(done);
      } on ConflictError catch (e) {
        if (e.message.contains('intake_required')) {
          onIntakeRequired();
        } else {
          error.value = errorToMessage(e);
        }
        busy.value = false;
      } catch (e) {
        // Failed calibration never creates a programme (§6.3) — offer a
        // clean re-record.
        error.value = errorToMessage(e);
        busy.value = false;
      }
    }

    if (busy.value && error.value == null) {
      return const _CalibrationAnalysing();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GlassCard(
          strong: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const KorasEyebrow(text: 'Calibration read', tone: EyebrowTone.ember),
              const SizedBox(height: 8),
              Text(
                hasBaseline
                    ? 'We already know your voice — one short read to tune your programme.'
                    : 'Read this short passage aloud, at your natural pace, so we can shape your programme around you.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: k.ink700),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        GlassCard(
          strong: true,
          radius: 26,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const KorasEyebrow(text: 'Read aloud'),
              const SizedBox(height: 14),
              Text(
                passage.text,
                style: korasSerif(
                  21,
                  weight: FontWeight.w500,
                  height: 1.5,
                  color: k.ink900,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        if (error.value != null) ...[
          GlassCard(
            child: Column(
              children: [
                Icon(LucideIcons.circleAlert, color: k.danger, size: 32),
                const SizedBox(height: 10),
                Text(
                  "That read didn't come through. ${error.value!}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 14),
                KorasButton.primary(
                  onPressed: () {
                    error.value = null;
                    busy.value = false;
                  },
                  child: const Text('Record again'),
                ),
              ],
            ),
          ),
        ] else
          Center(
            child: VoiceRecorder(
              duration: const Duration(seconds: 60),
              startLabel: 'Tap to start reading',
              onComplete: handle,
            ),
          ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _CalibrationAnalysing extends StatelessWidget {
  const _CalibrationAnalysing();

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          CircularProgressIndicator(color: k.ember, strokeWidth: 3),
          const SizedBox(height: 20),
          Text('Listening to your read…',
              style: korasSerifItalic(22, color: k.ink900)),
          const SizedBox(height: 8),
          Text(
            'Measuring pace, flow and accuracy. Usually 5–15 seconds.',
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: k.muted),
          ),
        ],
      ),
    );
  }
}
