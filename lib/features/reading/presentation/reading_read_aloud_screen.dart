import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart' as perm;
import 'package:record/record.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../services/koras_api_client.dart';
import '../../../shared/widgets/audio/pulse_decoration.dart';
import '../../../shared/widgets/audio/waveform.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_eyebrow.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/reading_models.dart';
import '../data/reading_repository.dart';
import 'reading_lesson_screen.dart' show readingStepLabel;

/// Read-aloud runtime (LRead design): READ ALOUD passage card, GUIDE SPEED
/// slider (a multiplier × the step's `guide_wpm`), elapsed timer, live
/// waveform, and redo / record / ✓ controls ("Tap ✓ to stop & analyse").
///
/// `attemptContext` is `{stageId}~{lessonId}~{stepId}`.
/// Flow: attempt/start → presigned PUT → upload-complete → analyze (202) →
/// poll on the house cadence → results screen.
class ReadingReadAloudScreen extends HookConsumerWidget {
  const ReadingReadAloudScreen({super.key, required this.attemptContext});

  final String attemptContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parts = attemptContext.split('~');
    if (parts.length != 3) {
      return const KorasScreen(
        title: 'Read aloud',
        children: [Text("We couldn't open this step.")],
      );
    }
    final stageId = parts[0];
    final lessonId = parts[1];
    final stepId = parts[2];

    final stageAsync = ref.watch(readingStageProvider(stageId));

    return stageAsync.when(
      loading: () => const KorasScreen(
        title: 'Read aloud',
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
      error: (e, _) => KorasScreen(
        title: 'Read aloud',
        children: [
          KorasError(
            message: errorToMessage(e),
            onRetry: () => ref.invalidate(readingStageProvider(stageId)),
          ),
        ],
      ),
      data: (stage) {
        final lesson = stage.lessonById(lessonId);
        final step = lesson?.steps
            .where((s) => s.stepId == stepId)
            .firstOrNull;
        if (lesson == null || step == null || step.readText.isEmpty) {
          return const KorasScreen(
            title: 'Read aloud',
            children: [Text("We couldn't find this step's passage.")],
          );
        }
        return _ReadAloudBody(stage: stage, lesson: lesson, step: step);
      },
    );
  }
}

enum _Phase { idle, recording, analysing, error }

class _ReadAloudBody extends HookConsumerWidget {
  const _ReadAloudBody({
    required this.stage,
    required this.lesson,
    required this.step,
  });

  final ReadingStage stage;
  final ReadingLesson lesson;
  final ReadingStep step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final recorder = useMemoized(AudioRecorder.new);
    final phase = useState(_Phase.idle);
    final elapsed = useState(0);
    final ticker = useRef<Timer?>(null);
    final error = useState<String?>(null);
    final failedAttemptId = useState<String?>(null);
    // 0.7×–1.3× multiplier on the step's guide pace (§0 design mapping).
    final speed = useState(1.0);

    useEffect(() {
      return () {
        ticker.value?.cancel();
        recorder.dispose();
      };
    }, const []);

    final mimeType = Platform.isIOS ? 'audio/mp4' : 'audio/webm';
    final effectiveGuideWpm = step.guideWpm == null
        ? null
        : (step.guideWpm! * speed.value).round();

    Future<void> start() async {
      error.value = null;
      final status = await perm.Permission.microphone.request();
      if (!status.isGranted) {
        error.value = 'Microphone permission denied. Enable it in Settings.';
        return;
      }
      try {
        final dir = await getTemporaryDirectory();
        final ext = Platform.isIOS ? 'm4a' : 'webm';
        final path =
            '${dir.path}/koras-read-${DateTime.now().millisecondsSinceEpoch}.$ext';
        await recorder.start(
          RecordConfig(
            encoder: Platform.isIOS ? AudioEncoder.aacLc : AudioEncoder.opus,
            sampleRate: 16000,
            numChannels: 1,
            bitRate: 64000,
            autoGain: false, // non-negotiable — AGC ruins pitch analysis
            noiseSuppress: true,
            echoCancel: true,
          ),
          path: path,
        );
        phase.value = _Phase.recording;
        elapsed.value = 0;
        ticker.value?.cancel();
        ticker.value = Timer.periodic(const Duration(seconds: 1), (_) {
          elapsed.value += 1;
          if (elapsed.value >= 180) ticker.value?.cancel();
        });
      } catch (_) {
        error.value = "Couldn't start recording. Try again.";
      }
    }

    Future<void> redo() async {
      ticker.value?.cancel();
      await recorder.stop();
      elapsed.value = 0;
      phase.value = _Phase.idle;
    }

    Future<void> runPipeline(File file) async {
      final repo = ref.read(readingRepositoryProvider);
      final start = await repo.startAttempt(
        attemptType: step.type,
        passageText: step.readText,
        audioMimeType: mimeType,
        guideWpm: effectiveGuideWpm,
        stageId: stage.id,
        lessonId: lesson.lessonId,
        stepId: step.stepId,
      );
      failedAttemptId.value = start.attempt.id;
      final bytes = await file.readAsBytes();
      await ref.read(korasApiClientProvider).putBytesToR2(
            start.upload.url,
            bytes,
            start.upload.contentType,
          );
      await repo.reportUploadStatus(
        attemptId: start.attempt.id,
        recordingUploadStatus: 'uploaded',
        durationSeconds: elapsed.value.toDouble(),
      );
      await repo.startAnalysis(start.attempt.id);
      final done = await repo.pollAttempt(start.attempt.id);
      failedAttemptId.value = null;
      if (context.mounted) {
        context.pushReplacement('/app/reading/results/${done.id}', extra: done);
      }
    }

    Future<void> stopAndAnalyse() async {
      ticker.value?.cancel();
      final path = await recorder.stop();
      if (path == null) {
        phase.value = _Phase.idle;
        return;
      }
      phase.value = _Phase.analysing;
      try {
        await runPipeline(File(path));
      } catch (e) {
        error.value = errorToMessage(e);
        phase.value = _Phase.error;
      }
    }

    Future<void> retryAnalysis() async {
      final id = failedAttemptId.value;
      if (id == null) {
        phase.value = _Phase.idle;
        return;
      }
      phase.value = _Phase.analysing;
      error.value = null;
      try {
        final repo = ref.read(readingRepositoryProvider);
        await repo.retryAnalysis(id);
        final done = await repo.pollAttempt(id);
        if (context.mounted) {
          context.pushReplacement('/app/reading/results/${done.id}',
              extra: done);
        }
      } catch (e) {
        error.value = errorToMessage(e);
        phase.value = _Phase.error;
      }
    }

    if (phase.value == _Phase.analysing) {
      return _AnalysingBody(elapsed: elapsed.value);
    }

    final mm = elapsed.value ~/ 60;
    final ss = (elapsed.value % 60).toString().padLeft(2, '0');

    return KorasScreen(
      title: readingStepLabel(step),
      kicker: 'Lesson ${stage.lessonCode(lesson)}',
      actions: [
        KorasPill(label: '$mm:$ss', icon: LucideIcons.clock),
      ],
      children: [
        // Passage card
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
                step.readText,
                style: korasSerif(
                  22,
                  weight: FontWeight.w500,
                  height: 1.5,
                  color: k.ink900,
                ),
              ),
              if (step.type == 'echo' && step.targetNotes != null) ...[
                const SizedBox(height: 12),
                Text(
                  step.targetNotes!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.muted, fontStyle: FontStyle.italic),
                ),
              ],
            ],
          ),
        ),
        // Guide speed
        if (step.guideWpm != null) ...[
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                const Expanded(child: KorasEyebrow(text: 'Guide speed')),
                Text(
                  '${speed.value.toStringAsFixed(1)}× · $effectiveGuideWpm wpm',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: k.ink900, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6,
              activeTrackColor: k.ember,
              inactiveTrackColor: k.line,
              thumbColor: k.ember,
              overlayColor: k.ember.withValues(alpha: 0.15),
            ),
            child: Slider(
              value: speed.value,
              min: 0.7,
              max: 1.3,
              divisions: 6,
              onChanged: phase.value == _Phase.recording
                  ? null
                  : (v) => speed.value = v,
            ),
          ),
        ],
        const SizedBox(height: 18),
        // Live waveform while recording
        if (phase.value == _Phase.recording)
          GlassCard(
            radius: 26,
            child: Waveform(
              amplitudeStream: recorder
                  .onAmplitudeChanged(const Duration(milliseconds: 100))
                  .map((a) => a.current),
              height: 52,
            ),
          )
        else
          GlassCard(
            radius: 26,
            child: Center(
              child: Text(
                phase.value == _Phase.error
                    ? 'Something went wrong — try again below.'
                    : 'Read at a comfortable, natural pace.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: k.muted),
              ),
            ),
          ),
        if (error.value != null) ...[
          const SizedBox(height: 12),
          Text(
            error.value!,
            textAlign: TextAlign.center,
            style: TextStyle(color: k.danger),
          ),
        ],
        const SizedBox(height: 24),
        // Controls: redo / record / ✓
        if (phase.value == _Phase.error)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KorasButton.glass(
                onPressed: () {
                  error.value = null;
                  failedAttemptId.value = null;
                  phase.value = _Phase.idle;
                },
                child: const Text('Record again'),
              ),
              if (failedAttemptId.value != null) ...[
                const SizedBox(width: 12),
                KorasButton.primary(
                  onPressed: retryAnalysis,
                  child: const Text('Retry analysis'),
                ),
              ],
            ],
          )
        else ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _RoundGlassButton(
                icon: LucideIcons.rotateCcw,
                color: k.ink900,
                enabled: phase.value == _Phase.recording,
                onTap: redo,
              ),
              const SizedBox(width: 14),
              phase.value == _Phase.recording
                  ? _RecordDisc(recording: true, onTap: () {})
                  : PulseDecoration(
                      child: _RecordDisc(recording: false, onTap: start),
                    ),
              const SizedBox(width: 14),
              _RoundGlassButton(
                icon: LucideIcons.check,
                color: k.success,
                enabled: phase.value == _Phase.recording,
                onTap: stopAndAnalyse,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              phase.value == _Phase.recording
                  ? 'Tap ✓ to stop & analyse'
                  : 'Tap the mic to start reading',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: k.muted),
            ),
          ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}

class _RecordDisc extends StatelessWidget {
  const _RecordDisc({required this.recording, required this.onTap});

  final bool recording;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 84,
        height: 84,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: k.ember,
          border: Border.all(color: k.ember.withValues(alpha: 0.25), width: 4),
          boxShadow: [
            BoxShadow(
              color: k.accentDeep.withValues(alpha: 0.55),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Icon(
          recording ? LucideIcons.audioLines : LucideIcons.mic,
          size: 34,
          color: k.onAccent,
        ),
      ),
    );
  }
}

class _RoundGlassButton extends StatelessWidget {
  const _RoundGlassButton({
    required this.icon,
    required this.color,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final bool enabled;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Opacity(
      opacity: enabled ? 1 : 0.45,
      child: GlassCard(
        radius: 999,
        padding: EdgeInsets.zero,
        onTap: enabled ? () => onTap() : null,
        child: SizedBox(
          width: 56,
          height: 56,
          child: Icon(icon, size: 23, color: enabled ? color : k.muted),
        ),
      ),
    );
  }
}

/// LAnalyzing-style in-flow state: wave tile, italic serif title, progress
/// bar and staged pills.
class _AnalysingBody extends HookWidget {
  const _AnalysingBody({required this.elapsed});

  /// Recording length in seconds (shown copy only).
  final int elapsed;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final seconds = useState(0);
    useEffect(() {
      final t = Timer.periodic(
        const Duration(seconds: 1),
        (_) => seconds.value += 1,
      );
      return t.cancel;
    }, const []);

    final phase = seconds.value < 4 ? 0 : (seconds.value < 10 ? 1 : 2);
    final barValue = (0.15 + seconds.value * 0.045).clamp(0.15, 0.9);

    return KorasScreen(
      scrollable: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassCard(
                radius: 34,
                padding: EdgeInsets.zero,
                child: SizedBox(
                  width: 148,
                  height: 148,
                  child:
                      Icon(LucideIcons.audioLines, size: 56, color: k.ember),
                ),
              ),
              const SizedBox(height: 26),
              Text(
                'Analysing your read…',
                textAlign: TextAlign.center,
                style: korasSerifItalic(27, color: k.ink900),
              ),
              const SizedBox(height: 10),
              Text(
                'Measuring accuracy, pace, flow and hesitations. '
                'Usually 5–15 seconds.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: k.muted),
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: barValue.toDouble(),
                    minHeight: 6,
                    color: k.ember,
                    backgroundColor: k.line,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  KorasPill(
                    label: 'Uploaded',
                    tone: phase >= 1 ? PillTone.success : PillTone.accent,
                    icon: phase >= 1 ? LucideIcons.check : LucideIcons.upload,
                  ),
                  KorasPill(
                    label: 'Transcribing',
                    tone: phase >= 2
                        ? PillTone.success
                        : phase >= 1
                            ? PillTone.accent
                            : PillTone.glass,
                    icon: phase >= 2 ? LucideIcons.check : null,
                  ),
                  KorasPill(
                    label: 'Scoring',
                    tone: phase >= 2 ? PillTone.accent : PillTone.glass,
                    icon: phase >= 2 ? LucideIcons.sparkles : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
