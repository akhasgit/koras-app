import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
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

/// Records the baseline and shows the analysis when it completes.
class VoiceRefinementBaselineScreen extends HookConsumerWidget {
  const VoiceRefinementBaselineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final busy = useState(false);
    final baseline = useState<VoiceRefinementBaseline?>(null);
    final error = useState<String?>(null);

    Future<void> handle(File file, String mimeType) async {
      busy.value = true;
      error.value = null;
      try {
        final repo = ref.read(voiceRefinementRepositoryProvider);
        final start = await repo.startBaseline(audioMimeType: mimeType);
        final bytes = await file.readAsBytes();
        await ref.read(korasApiClientProvider).putBytesToR2(
              start.upload.url,
              bytes,
              start.upload.contentType,
            );
        await repo.reportBaselineUpload(
          baselineId: start.baseline.id,
          recordingUploadStatus: 'uploaded',
        );
        await repo.startBaselineAnalysis(start.baseline.id);
        final done = await repo.pollBaseline(start.baseline.id);
        baseline.value = done;
        ref.invalidate(voiceRefinementBaselinesProvider);
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        busy.value = false;
      }
    }

    final k = context.koras;
    return KorasScreen(
      title: 'Baseline',
      children: [
        const SizedBox(height: 12),
        if (baseline.value != null)
          _BaselineReport(
            baseline: baseline.value!,
            onContinue: () => context.push(
                '/app/voice-refinement/explore/${baseline.value!.id}'),
          )
        else if (busy.value)
          const _Analysing()
        else
          KorasCard(
            child: Center(
              child: VoiceRecorder(
                prompt:
                    'Speak for 45 seconds about anything — the day, a goal, a story.',
                duration: const Duration(seconds: 45),
                onComplete: handle,
              ),
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
            Text('Analysing baseline…',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      );
}

class _BaselineReport extends StatelessWidget {
  const _BaselineReport({required this.baseline, required this.onContinue});
  final VoiceRefinementBaseline baseline;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final scores = baseline.scores ?? const {};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Baseline results',
                  style: Theme.of(context).textTheme.titleMedium),
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
        if (baseline.coachFeedback != null) ...[
          const SizedBox(height: 12),
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Coach', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(baseline.coachFeedback!),
              ],
            ),
          ),
        ],
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: KorasButton.primary(
            onPressed: onContinue,
            child: const Text('Continue to explore'),
          ),
        ),
      ],
    );
  }
}
