import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/glass/mesh_background.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../domain/ai_tutor_enums.dart';
import '../domain/ai_tutor_session_state.dart';
import 'ai_tutor_notifier.dart';
import 'widgets/ai_tutor_report_view.dart';
import 'widgets/transcript_timeline.dart';
import 'widgets/voice_orb.dart';

/// AI Tutor — orchestrates the live conversation state machine. See 13.
class AiTutorScreen extends ConsumerWidget {
  const AiTutorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(aiTutorNotifierProvider);
    final notifier = ref.read(aiTutorNotifierProvider.notifier);

    return switch (state) {
      AiTutorIdle() => _StartCard(
          onStart: () => notifier.start(AiTutorMode.speakingFoundations),
        ),
      AiTutorStarting() ||
      AiTutorConnecting() =>
        const _Busy(label: 'Connecting…'),
      AiTutorLive(:final turns) => _LivePanel(
          turns: turns,
          onStop: notifier.stop,
        ),
      AiTutorEnding() => const _Busy(label: 'Wrapping up…'),
      AiTutorUploading() => const _Busy(label: 'Saving your recording…'),
      AiTutorAnalyzing() => const _Busy(label: 'Analysing your conversation…'),
      AiTutorReportState(:final report) => KorasScreen(
          title: 'Session report',
          children: [
            const SizedBox(height: 16),
            AiTutorReportView(report: report),
            const SizedBox(height: 24),
            KorasButton.primary(
              onPressed: () {
                notifier.reset();
                if (context.canPop()) context.pop();
              },
              child: const Text('Done'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      AiTutorErrorState(:final error) => _ErrorView(
          error: error,
          onRetry: notifier.reset,
        ),
    };
  }
}

class _StartCard extends StatelessWidget {
  const _StartCard({required this.onStart});
  final VoidCallback onStart;

  static const _bullets = <String>[
    '3–6 minute speaking session',
    'Live AI follow-up questions',
    'Feedback on clarity, confidence, grammar, fluency, and relevance',
    'Recording and transcript saved for your report',
  ];

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final k = context.koras;
    return KorasScreen(
      title: 'AI Tutor',
      children: [
        const SizedBox(height: 16),
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Practice speaking with a live Koras coach.',
                  style: text.titleLarge),
              const SizedBox(height: 12),
              Text(
                'Koras will ask you a few short questions, listen to your '
                'answers, and prepare a detailed speaking report at the end.',
                style: text.bodyMedium,
              ),
              const SizedBox(height: 20),
              for (final b in _bullets) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, right: 10),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: k.ember,
                        ),
                      ),
                    ),
                    Expanded(child: Text(b, style: text.bodyMedium)),
                  ],
                ),
                const SizedBox(height: 8),
              ],
              const SizedBox(height: 12),
              Text(
                'Your recording is stored securely and used to generate your '
                'speaking report.',
                style: text.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        KorasButton.primary(
          onPressed: onStart,
          child: const Text('Start AI Tutor'),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _Busy extends StatelessWidget {
  const _Busy({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return KorasScreen(
      scrollable: false,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _LivePanel extends StatelessWidget {
  const _LivePanel({required this.turns, required this.onStop});
  final List turns;
  final Future<void> Function() onStop;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return MeshBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: k.glassFillStrong,
                      shape: BoxShape.circle,
                      border: Border.all(color: k.glassBorder, width: 0.75),
                    ),
                    child: Icon(Icons.close, size: 20, color: k.ink900),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const VoiceOrb(label: 'Listening…'),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TranscriptTimeline(turns: turns.cast()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: onStop,
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: k.danger,
                    boxShadow: [
                      BoxShadow(
                        color: k.danger.withValues(alpha: 0.35),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(Icons.stop_rounded, color: k.paper, size: 32),
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error, required this.onRetry});
  final AppError error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final isMicError = isMicrophonePermissionError(error);
    return KorasScreen(
      scrollable: false,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(errorToMessage(error), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            if (isMicError) ...[
              KorasButton.primary(
                onPressed: openAppSettings,
                child: const Text('Open Settings'),
              ),
              const SizedBox(height: 12),
              KorasButton.secondary(
                onPressed: () {
                  onRetry();
                  if (context.canPop()) context.pop();
                },
                child: const Text('Back'),
              ),
            ] else
              KorasButton.primary(
                onPressed: () {
                  onRetry();
                  if (context.canPop()) context.pop();
                },
                child: const Text('Back'),
              ),
          ],
        ),
      ),
    );
  }
}
