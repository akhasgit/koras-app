import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../services/koras_api_client.dart';
import '../../../shared/widgets/audio/voice_recorder.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/listening_models.dart';
import '../data/listening_repository.dart';

/// Loads a passage, streams its (server-cached) audio, and runs the
/// question flow (MCQ answers + voice recording → server grading).
class ListeningRuntimeScreen extends HookConsumerWidget {
  const ListeningRuntimeScreen({super.key, required this.passageId});

  final String passageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passagesAsync = ref.watch(listeningPassagesProvider);
    final attempt = useState<ListeningAttempt?>(null);
    final answers = useState<Map<String, ListeningAnswer>>({});
    final questionIndex = useState(0);
    final busy = useState(false);
    final error = useState<String?>(null);
    final report = useState<Map<String, dynamic>?>(null);

    return KorasScreen(
      title: 'Listening',
      children: [
        const SizedBox(height: 12),
        passagesAsync.when(
          data: (data) {
            final p = data.passages.firstWhere(
              (x) => x.id == passageId,
              orElse: () => const ListeningPassage(
                id: '',
                title: '',
                difficulty: 0,
              ),
            );
            if (p.id.isEmpty) return const Text('Passage not found.');
            return _Body(
              passage: p,
              attempt: attempt,
              answers: answers,
              questionIndex: questionIndex,
              busy: busy,
              error: error,
              report: report,
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
    required this.passage,
    required this.attempt,
    required this.answers,
    required this.questionIndex,
    required this.busy,
    required this.error,
    required this.report,
    required this.ref,
  });

  final ListeningPassage passage;
  final ValueNotifier<ListeningAttempt?> attempt;
  final ValueNotifier<Map<String, ListeningAnswer>> answers;
  final ValueNotifier<int> questionIndex;
  final ValueNotifier<bool> busy;
  final ValueNotifier<String?> error;
  final ValueNotifier<Map<String, dynamic>?> report;
  final WidgetRef ref;

  Future<void> _start() async {
    busy.value = true;
    error.value = null;
    try {
      final a = await ref
          .read(listeningRepositoryProvider)
          .startAttempt(passageId: passage.id);
      attempt.value = a;
    } catch (e) {
      error.value = errorToMessage(e);
    } finally {
      busy.value = false;
    }
  }

  Future<void> _submitMcq(String questionId, String optionId) async {
    if (attempt.value == null) return;
    busy.value = true;
    error.value = null;
    try {
      final ans = await ref.read(listeningRepositoryProvider).answerMcq(
            attemptId: attempt.value!.id,
            questionId: questionId,
            selectedOptionId: optionId,
          );
      answers.value = {...answers.value, questionId: ans};
    } catch (e) {
      error.value = errorToMessage(e);
    } finally {
      busy.value = false;
    }
  }

  Future<void> _submitVoice(
      String questionId, File file, String mimeType) async {
    if (attempt.value == null) return;
    busy.value = true;
    error.value = null;
    try {
      final repo = ref.read(listeningRepositoryProvider);
      final upload = await repo.voiceUploadUrl(
        attemptId: attempt.value!.id,
        questionId: questionId,
        audioMimeType: mimeType,
      );
      final bytes = await file.readAsBytes();
      await ref
          .read(korasApiClientProvider)
          .putBytesToR2(upload.url, bytes, upload.contentType);
      final ans = await repo.analyzeVoice(
        attemptId: attempt.value!.id,
        questionId: questionId,
        objectKey: upload.objectKey,
      );
      answers.value = {...answers.value, questionId: ans};
    } catch (e) {
      error.value = errorToMessage(e);
    } finally {
      busy.value = false;
    }
  }

  Future<void> _complete() async {
    if (attempt.value == null) return;
    busy.value = true;
    error.value = null;
    try {
      final data = await ref.read(listeningRepositoryProvider).completeAttempt(
            attemptId: attempt.value!.id,
          );
      report.value = data;
      ref.invalidate(listeningPassagesProvider);
    } catch (e) {
      error.value = errorToMessage(e);
    } finally {
      busy.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final k = context.koras;

    if (report.value != null) {
      final r = report.value!;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Results', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Overall: ${r['overall_score'] ?? '-'}%',
                    style: Theme.of(context).textTheme.titleMedium),
                if (r['skill_breakdown'] is Map) ...[
                  const SizedBox(height: 12),
                  Text('By skill',
                      style: Theme.of(context).textTheme.titleSmall),
                  for (final e
                      in (r['skill_breakdown'] as Map).entries)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Expanded(child: Text('${e.key}'.replaceAll('_', ' '))),
                          Text('${(e.value as Map)['score'] ?? '-'}%',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: k.ember)),
                        ],
                      ),
                    ),
                ],
              ],
            ),
          ),
        ],
      );
    }

    if (attempt.value == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          KorasCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(passage.title,
                    style: Theme.of(context).textTheme.titleLarge),
                if (passage.topic != null) ...[
                  const SizedBox(height: 4),
                  Text(passage.topic!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: k.ink500)),
                ],
                const SizedBox(height: 12),
                Text(
                    'You\'ll listen to the passage, then answer ${passage.questions.length} question(s).',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 16),
                KorasButton.primary(
                  onPressed: busy.value ? null : _start,
                  child: const Text('Start attempt'),
                ),
              ],
            ),
          ),
          if (error.value != null) ...[
            const SizedBox(height: 12),
            Text(error.value!, style: TextStyle(color: k.danger)),
          ],
        ],
      );
    }

    // Attempt started — show audio player + questions.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _AudioSection(passageId: passage.id),
        const SizedBox(height: 12),
        _QuestionsList(
          passage: passage,
          answers: answers.value,
          onMcq: _submitMcq,
          onVoice: _submitVoice,
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: KorasButton.primary(
            onPressed: busy.value ? null : _complete,
            child: const Text('Finish attempt'),
          ),
        ),
        if (busy.value) ...[
          const SizedBox(height: 12),
          const Center(child: CircularProgressIndicator()),
        ],
        if (error.value != null) ...[
          const SizedBox(height: 12),
          Text(error.value!, style: TextStyle(color: k.danger)),
        ],
      ],
    );
  }
}

/// Fetches a presigned URL from `/listening/{uid}/audio` and plays it.
class _AudioSection extends HookConsumerWidget {
  const _AudioSection({required this.passageId});
  final String passageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlFuture = useMemoized(
      () => ref
          .read(listeningRepositoryProvider)
          .audioUrl(passageId: passageId),
      [passageId],
    );
    final snap = useFuture(urlFuture);
    final player = useMemoized(AudioPlayer.new);
    useEffect(() => player.dispose, [player]);

    useEffect(() {
      if (snap.hasData) {
        player.setUrl(snap.data!);
      }
      return null;
    }, [snap.data]);

    final playing = useStream(player.playingStream).data ?? false;
    final k = context.koras;

    return KorasCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Passage audio',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          if (!snap.hasData)
            const Center(child: CircularProgressIndicator())
          else
            Row(
              children: [
                IconButton.filled(
                  onPressed: () =>
                      playing ? player.pause() : player.play(),
                  icon: Icon(playing ? LucideIcons.pause : LucideIcons.play),
                  style: IconButton.styleFrom(
                    backgroundColor: k.ember,
                    foregroundColor: k.paper,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StreamBuilder<Duration>(
                    stream: player.positionStream,
                    builder: (context, s) {
                      final pos = s.data ?? Duration.zero;
                      final total = player.duration ?? Duration.zero;
                      final v = total.inMilliseconds == 0
                          ? 0.0
                          : (pos.inMilliseconds / total.inMilliseconds)
                              .clamp(0.0, 1.0);
                      return LinearProgressIndicator(
                        value: v,
                        color: k.ember,
                        backgroundColor: k.line,
                      );
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _QuestionsList extends StatelessWidget {
  const _QuestionsList({
    required this.passage,
    required this.answers,
    required this.onMcq,
    required this.onVoice,
  });

  final ListeningPassage passage;
  final Map<String, ListeningAnswer> answers;
  final Future<void> Function(String qId, String optId) onMcq;
  final Future<void> Function(String qId, File file, String mime) onVoice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final q in passage.questions)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: _QuestionCard(
              question: q,
              answer: answers[q.id],
              onMcq: onMcq,
              onVoice: onVoice,
            ),
          ),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.question,
    this.answer,
    required this.onMcq,
    required this.onVoice,
  });

  final ListeningQuestion question;
  final ListeningAnswer? answer;
  final Future<void> Function(String qId, String optId) onMcq;
  final Future<void> Function(String qId, File file, String mime) onVoice;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return KorasCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.prompt,
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 12),
          if (question.type == 'mcq' && question.options != null)
            Column(
              children: [
                for (final o in question.options!)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        minimumSize: const Size.fromHeight(44),
                        side: BorderSide(
                          color: answer?.selectedOptionId == o.id
                              ? k.ember
                              : k.line,
                          width: answer?.selectedOptionId == o.id ? 2 : 1,
                        ),
                      ),
                      onPressed: () => onMcq(question.id, o.id),
                      child: Text(o.text),
                    ),
                  ),
              ],
            )
          else if (question.type == 'voice_response')
            Column(
              children: [
                if (answer == null)
                  VoiceRecorder(
                    prompt: 'Answer aloud in 30 seconds.',
                    duration: const Duration(seconds: 30),
                    onComplete: (file, mime) =>
                        onVoice(question.id, file, mime),
                  )
                else ...[
                  Text('Your answer: ${answer!.transcript ?? "(no transcript)"}',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 6),
                  Text('Score: ${answer!.score ?? "-"}',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: k.ember)),
                ],
              ],
            )
          else
            const Text('Unsupported question type'),
        ],
      ),
    );
  }
}
