import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/audio/voice_recorder.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../../../shared/widgets/koras_text_field.dart';
import '../data/interview_models.dart';
import '../data/interview_prep_repository.dart';
import '../data/practice_session_dao.dart';
import '../domain/interview_enums.dart';

class InterviewPrepHomeScreen extends ConsumerWidget {
  const InterviewPrepHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenarios = ref.watch(interviewScenariosProvider);
    return KorasScreen(
      title: 'Interview Prep',
      children: [
        const SizedBox(height: 12),
        KorasButton.primary(
          onPressed: () => context.go('/app/interview-prep/scenarios/new'),
          child: const Text('New scenario'),
        ),
        const SizedBox(height: 16),
        scenarios.when(
          loading: () => const KorasLoading(),
          error: (e, _) => KorasError(
            message: errorToMessage(e),
            onRetry: () => ref.invalidate(interviewScenariosProvider),
          ),
          data: (list) {
            if (list.isEmpty) {
              return const KorasCard(
                child: Text('No scenarios yet. Create one to get started.'),
              );
            }
            return Column(
              children: [
                for (final s in list) ...[
                  KorasCard(
                    onTap: () =>
                        context.go('/app/interview-prep/scenarios/${s.id}'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s.title,
                            style: Theme.of(context).textTheme.titleSmall),
                        if (s.jobRole != null) Text(s.jobRole!),
                        if (s.isDefault)
                          Text('Sample',
                              style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

class NewScenarioScreen extends HookConsumerWidget {
  const NewScenarioScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = useTextEditingController();
    final role = useTextEditingController();
    final company = useTextEditingController();
    final jd = useTextEditingController();
    final busy = useState(false);
    final error = useState<String?>(null);

    Future<void> save() async {
      if (title.text.trim().isEmpty) {
        error.value = 'Give your scenario a title.';
        return;
      }
      busy.value = true;
      error.value = null;
      try {
        final scenario = await ref
            .read(interviewPrepRepositoryProvider)
            .createScenario(
              title: title.text.trim(),
              jobRole: role.text.trim().isEmpty ? null : role.text.trim(),
              company: company.text.trim().isEmpty ? null : company.text.trim(),
              jobDescription: jd.text.trim().isEmpty ? null : jd.text.trim(),
            );
        ref.invalidate(interviewScenariosProvider);
        if (context.mounted) {
          context.go('/app/interview-prep/scenarios/${scenario.id}');
        }
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        busy.value = false;
      }
    }

    return KorasScreen(
      title: 'New scenario',
      children: [
        const SizedBox(height: 12),
        KorasTextField(controller: title, label: 'Title'),
        const SizedBox(height: 12),
        KorasTextField(controller: role, label: 'Job role (optional)'),
        const SizedBox(height: 12),
        KorasTextField(controller: company, label: 'Company (optional)'),
        const SizedBox(height: 12),
        KorasTextField(
          controller: jd,
          label: 'Job description (optional)',
          maxLines: 5,
        ),
        if (error.value != null) ...[
          const SizedBox(height: 12),
          Text(error.value!, style: TextStyle(color: context.koras.danger)),
        ],
        const SizedBox(height: 20),
        KorasButton.primary(
          onPressed: busy.value ? null : save,
          loading: busy.value,
          child: const Text('Create'),
        ),
      ],
    );
  }
}

class ScenarioDetailScreen extends StatelessWidget {
  const ScenarioDetailScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return KorasScreen(
      title: 'Scenario',
      children: [
        const SizedBox(height: 12),
        const KorasCard(
          child: Text(
            'Practice your answers question-by-question. Each answer uploads and '
            'is scored in the background while you move on.',
          ),
        ),
        const SizedBox(height: 16),
        KorasButton.primary(
          onPressed: () =>
              context.go('/app/interview-prep/scenarios/$id/practice'),
          child: const Text('Start practice'),
        ),
      ],
    );
  }
}

/// Question-by-question practice with drift-backed resume. See 15.
class ScenarioPracticeScreen extends HookConsumerWidget {
  const ScenarioPracticeScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(interviewPrepRepositoryProvider);
    final store = ref.read(practiceSessionStoreProvider);

    final session = useState<InterviewPracticeSessionState?>(null);
    final questions = useState<List<InterviewQuestion>>(const []);
    final loading = useState(true);
    final error = useState<String?>(null);
    final submitting = useState(false);

    useEffect(() {
      var cancelled = false;
      Future<void> init() async {
        try {
          final existing = await store.load(id);
          final qs = await repo.generateQuestions(scenarioId: id);
          if (cancelled) return;
          questions.value = qs;
          session.value = existing ??
              InterviewPracticeSessionState(
                scenarioId: id,
                practiceSessionId: const Uuid().v4(),
              );
        } catch (e) {
          if (!cancelled) error.value = errorToMessage(e);
        } finally {
          if (!cancelled) loading.value = false;
        }
      }

      init();
      return () => cancelled = true;
    }, const []);

    if (loading.value) return const KorasLoading();
    if (error.value != null) {
      return KorasScreen(
        title: 'Practice',
        children: [Text(error.value!)],
      );
    }

    final s = session.value!;
    final qs = questions.value;
    if (qs.isEmpty) {
      return const KorasScreen(
        title: 'Practice',
        children: [Text('No questions available.')],
      );
    }
    final i = s.currentQuestionIndex.clamp(0, qs.length - 1);
    final q = qs[i];
    final isLast = i >= qs.length - 1;

    Future<void> onRecorded(file, mimeType) async {
      submitting.value = true;
      try {
        final bytes = await file.readAsBytes();
        final attemptId = await repo.recordAnswer(
          scenarioId: id,
          questionId: q.id,
          sessionId: s.practiceSessionId,
          bytes: bytes,
          mimeType: mimeType,
        );
        final next = s.copyWith(
          currentQuestionIndex: i + 1,
          answeredQuestionIds: [...s.answeredQuestionIds, q.id],
          attemptIdsByQuestionId: {
            ...s.attemptIdsByQuestionId,
            q.id: attemptId,
          },
          updatedAt: DateTime.now(),
        );
        session.value = next;
        await store.save(next);
        if (isLast) {
          await store.clear(id);
          if (context.mounted) {
            context.go(
                '/app/interview-prep/session-summary/${s.practiceSessionId}');
          }
        }
      } on ConflictError {
        // Server cap hit — the answer is recorded; analysis will be retried.
        final next = s.copyWith(currentQuestionIndex: i + 1);
        session.value = next;
        await store.save(next);
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        submitting.value = false;
      }
    }

    return KorasScreen(
      title: 'Question ${i + 1} of ${qs.length}',
      children: [
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: (i + 1) / qs.length,
          color: context.koras.ember,
          backgroundColor: context.koras.line,
        ),
        const SizedBox(height: 20),
        if (submitting.value)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 48),
            child: Center(child: CircularProgressIndicator()),
          )
        else
          KorasCard(
            child: Column(
              children: [
                Text(q.question,
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 24),
                VoiceRecorder(
                  duration: const Duration(seconds: 90),
                  prompt: 'Record your answer',
                  onComplete: onRecorded,
                ),
              ],
            ),
          ),
        const SizedBox(height: 24),
      ],
    );
  }
}

/// Polls attempts until every answer reaches a terminal analysis status. See 15.
class SessionSummaryScreen extends HookConsumerWidget {
  const SessionSummaryScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(interviewPrepRepositoryProvider);
    final attempts = useState<List<InterviewAttempt>>(const []);
    final error = useState<String?>(null);

    useEffect(() {
      var cancelled = false;
      Timer? timer;
      Future<void> poll() async {
        try {
          final list = await repo.listAttemptsBySession(id);
          if (cancelled) return;
          attempts.value = list;
          final allDone = list.isNotEmpty && list.every((a) => a.isTerminal);
          if (allDone) timer?.cancel();
        } catch (e) {
          if (!cancelled) error.value = errorToMessage(e);
        }
      }

      poll();
      timer = Timer.periodic(const Duration(seconds: 4), (_) => poll());
      return () {
        cancelled = true;
        timer?.cancel();
      };
    }, const []);

    final list = attempts.value;
    final pending = list.where((a) => !a.isTerminal).length;

    return KorasScreen(
      title: 'Session summary',
      children: [
        const SizedBox(height: 12),
        if (error.value != null)
          Text(error.value!, style: TextStyle(color: context.koras.danger)),
        if (pending > 0)
          KorasCard(
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 12),
                Text('Scoring $pending answer${pending == 1 ? '' : 's'}…'),
              ],
            ),
          ),
        const SizedBox(height: 12),
        for (final a in list) ...[
          KorasCard(
            onTap: () => context.go('/app/interview-prep/attempts/${a.id}'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    a.analysisStatus == InterviewAnalysisStatus.completed
                        ? 'Answer scored'
                        : a.analysisStatus == InterviewAnalysisStatus.failed
                            ? 'Scoring failed'
                            : 'Scoring…',
                  ),
                ),
                if (a.overallScore != null)
                  Text('${a.overallScore}',
                      style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 12),
        KorasButton.secondary(
          onPressed: () => context.go('/app/interview-prep'),
          child: const Text('Done'),
        ),
      ],
    );
  }
}

class InterviewAttemptScreen extends StatelessWidget {
  const InterviewAttemptScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return const KorasScreen(
      title: 'Answer report',
      children: [
        SizedBox(height: 12),
        KorasCard(
          child: Text('Detailed per-answer report.'),
        ),
      ],
    );
  }
}
