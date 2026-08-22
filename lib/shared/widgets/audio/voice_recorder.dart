import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart' as perm;
import 'package:record/record.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import 'pulse_decoration.dart';
import 'recording_file.dart';
import 'waveform.dart';

/// One recorder, every program. Owns an [AudioRecorder], a countdown, and the
/// amplitude stream. Idle button pulses; live body shows waveform + remaining
/// seconds. See `all_docs/mobile/12-voice-recording-pipeline.md`.
class VoiceRecorder extends HookConsumerWidget {
  const VoiceRecorder({
    super.key,
    this.duration = const Duration(seconds: 30),
    required this.onComplete,
    this.prompt,
    this.startLabel = 'Tap to record',
  });

  final Duration duration;
  final Future<void> Function(File file, String mimeType) onComplete;
  final String? prompt;
  final String startLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recorder = useMemoized(AudioRecorder.new);
    final recording = useState(false);
    final remaining = useState(duration);
    final ticker = useRef<Timer?>(null);
    final error = useState<String?>(null);

    useEffect(() {
      return () {
        ticker.value?.cancel();
        recorder.dispose();
      };
    }, const []);

    // WAV on iOS — AAC/M4A often lands without a moov atom if we read the
    // file before AVAudioRecorder finishes writing the trailer.
    final mimeType = Platform.isIOS ? 'audio/wav' : 'audio/webm';
    final stopping = useRef(false);

    Future<void> stop() async {
      if (stopping.value) return;
      stopping.value = true;
      ticker.value?.cancel();
      ticker.value = null;
      try {
        final path = await recorder.stop();
        recording.value = false;
        if (path == null) return;
        final file = await waitForFinalizedRecording(File(path));
        if (!await isPlayableRecording(file)) {
          error.value = 'That recording didn’t save. Please try again.';
          return;
        }
        await onComplete(file, mimeType);
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        stopping.value = false;
      }
    }

    Future<void> start() async {
      error.value = null;
      final status = await perm.Permission.microphone.request();
      if (!status.isGranted) {
        error.value = 'Microphone permission denied. Enable it in Settings.';
        return;
      }

      try {
        final dir = await getTemporaryDirectory();
        final ext = Platform.isIOS ? 'wav' : 'webm';
        final path =
            '${dir.path}/koras-${DateTime.now().millisecondsSinceEpoch}.$ext';

        await recorder.start(
          RecordConfig(
            encoder: Platform.isIOS ? AudioEncoder.wav : AudioEncoder.opus,
            sampleRate: 16000,
            numChannels: 1,
            bitRate: 64000,
            autoGain: false, // non-negotiable — AGC ruins pitch analysis
            // Voice-processing on iOS is a common source of truncated M4As.
            noiseSuppress: !Platform.isIOS,
            echoCancel: !Platform.isIOS,
          ),
          path: path,
        );
        recording.value = true;
        remaining.value = duration;

        ticker.value?.cancel();
        ticker.value = Timer.periodic(const Duration(seconds: 1), (t) {
          final next = remaining.value - const Duration(seconds: 1);
          if (next <= Duration.zero) {
            remaining.value = Duration.zero;
            stop();
          } else {
            remaining.value = next;
          }
        });
      } on PermissionError catch (e) {
        error.value = e.message;
      } catch (e) {
        error.value = "Couldn't start recording. Try again.";
      }
    }

    final k = context.koras;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prompt != null && !recording.value) ...[
          Text(
            prompt!,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: k.ink700),
          ),
          const SizedBox(height: 24),
        ],
        if (!recording.value)
          _IdleButton(label: startLabel, onTap: start)
        else
          _LiveBody(
            amplitudeStream: recorder
                .onAmplitudeChanged(const Duration(milliseconds: 100))
                .map((a) => a.current),
            remaining: remaining.value,
            onStop: stop,
          ),
        if (error.value != null) ...[
          const SizedBox(height: 16),
          Text(
            error.value!,
            textAlign: TextAlign.center,
            style: TextStyle(color: k.danger),
          ),
        ],
      ],
    );
  }
}

class _IdleButton extends StatelessWidget {
  const _IdleButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PulseDecoration(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: k.ember,
              ),
              child: Icon(LucideIcons.mic, color: k.paper, size: 36),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(label, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}

class _LiveBody extends StatelessWidget {
  const _LiveBody({
    required this.amplitudeStream,
    required this.remaining,
    required this.onStop,
  });

  final Stream<double> amplitudeStream;
  final Duration remaining;
  final Future<void> Function() onStop;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final secs = remaining.inSeconds;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Waveform(amplitudeStream: amplitudeStream),
        const SizedBox(height: 16),
        Text(
          '0:${secs.toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontFeatures: const [],
            color: k.ink900,
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: onStop,
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: k.danger, width: 3),
            ),
            child: Icon(LucideIcons.square, color: k.danger, size: 28),
          ),
        ),
        const SizedBox(height: 12),
        Text('Tap to stop', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
