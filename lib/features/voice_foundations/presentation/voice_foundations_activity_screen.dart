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
import '../data/voice_foundations_models.dart';
import '../data/voice_foundations_repository.dart';

/// Detail screen for one Voice Foundations activity. Handles recording flow
/// (start → PUT R2 → upload-complete → analyze → poll) for `recording`-type
/// activities, and simple mark-complete for the rest.
class VoiceFoundationsActivityScreen extends HookConsumerWidget {
  const VoiceFoundationsActivityScreen({super.key, required this.activityId});

  final String activityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesAsync = ref.watch(voiceFoundationsActivitiesProvider);
    final busy = useState(false);
    final report = useState<VoiceFoundationsAttempt?>(null);
    final error = useState<String?>(null);
    final markingDone = useState(false);

    return KorasScreen(
      title: 'Activity',
      children: [
        const SizedBox(height: 8),
        activitiesAsync.when(
          data: (activities) {
            final a = activities.firstWhere(
              (x) => x.id == activityId,
              orElse: () => const VoiceFoundationsActivity(
                id: '',
                day: 0,
                type: '',
                title: '',
              ),
            );
            if (a.id.isEmpty) {
              return const Text('Activity not found.');
            }
            return _Body(
              activity: a,
              busy: busy,
              report: report,
              error: error,
              markingDone: markingDone,
              ref: ref,
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error: $e'),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.activity,
    required this.busy,
    required this.report,
    required this.error,
    required this.markingDone,
    required this.ref,
  });

  final VoiceFoundationsActivity activity;
  final ValueNotifier<bool> busy;
  final ValueNotifier<VoiceFoundationsAttempt?> report;
  final ValueNotifier<String?> error;
  final ValueNotifier<bool> markingDone;
  final WidgetRef ref;

  Future<void> _handleRecording(File file, String mimeType) async {
    busy.value = true;
    error.value = null;
    try {
      final repo = ref.read(voiceFoundationsRepositoryProvider);
      final start = await repo.startAttempt(
        activityId: activity.id,
        day: activity.day,
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
      final result = await repo.pollAttempt(start.attempt.id);
      report.value = result;
      ref.invalidate(voiceFoundationsProgressProvider);
    } catch (e) {
      error.value = errorToMessage(e);
    } finally {
      busy.value = false;
    }
  }

  Future<void> _markComplete() async {
    markingDone.value = true;
    error.value = null;
    try {
      await ref
          .read(voiceFoundationsRepositoryProvider)
          .completeActivity(activity.id);
      ref.invalidate(voiceFoundationsProgressProvider);
    } catch (e) {
      error.value = errorToMessage(e);
    } finally {
      markingDone.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final isRecording = activity.type == 'recording';

    if (report.value != null) {
      return _AttemptReport(attempt: report.value!);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(activity.title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text('Day ${activity.day} • ${activity.durationMinutes ?? ""}',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: k.ink500)),
        const SizedBox(height: 24),
        if (busy.value)
          const _Analysing()
        else if (isRecording)
          KorasCard(
            child: Center(
              child: VoiceRecorder(
                prompt: 'Follow the activity instructions and record.',
                duration: Duration(
                    seconds: activity.recordingTargetSeconds ?? 30),
                onComplete: _handleRecording,
              ),
            ),
          )
        else
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Follow the on-screen instructions for this drill, then mark it complete.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: KorasButton.primary(
                    onPressed: markingDone.value ? null : _markComplete,
                    child: Text(markingDone.value
                        ? 'Saving…'
                        : 'Mark as complete'),
                  ),
                ),
              ],
            ),
          ),
        if (error.value != null) ...[
          const SizedBox(height: 16),
          Text(error.value!, style: TextStyle(color: k.danger)),
        ],
      ],
    );
  }
}

class _Analysing extends StatelessWidget {
  const _Analysing();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          Text('Analysing your voice…',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text('This may take up to a minute.',
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _AttemptReport extends StatelessWidget {
  const _AttemptReport({required this.attempt});
  final VoiceFoundationsAttempt attempt;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
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
              for (final entry in scores.entries)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(child: Text(entry.key)),
                      Text('${entry.value}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: k.ember)),
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
        if (attempt.transcript != null &&
            attempt.transcript!.isNotEmpty) ...[
          const SizedBox(height: 12),
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Transcript',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text(attempt.transcript!,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
