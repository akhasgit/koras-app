import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../shared/models/enums.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/glass/glass_screen.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../data/onboarding_repository.dart';
import '../domain/onboarding_config.dart';
import 'onboarding_answers.dart';

/// Entry at `/app/onboarding`: staff see a short setup; learners are sent to
/// the first quiz step. Super-admins are redirected before this mounts.
class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    if (profile == null) {
      return const Scaffold(body: KorasLoading());
    }
    return switch (profile.role) {
      UserRole.individual || UserRole.orgMember =>
        const _RedirectToFirstQuestion(),
      UserRole.orgAdmin || UserRole.orgManager => const _StaffSetup(),
      UserRole.superAdmin => const Scaffold(body: KorasLoading()),
    };
  }
}

class _RedirectToFirstQuestion extends StatefulWidget {
  const _RedirectToFirstQuestion();

  @override
  State<_RedirectToFirstQuestion> createState() =>
      _RedirectToFirstQuestionState();
}

class _RedirectToFirstQuestionState extends State<_RedirectToFirstQuestion> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.go(onboardingStepPath(kOnboardingQuestions.first.id));
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(body: KorasLoading());
}

/// One quiz question as its own full-screen route (no tab shell).
class OnboardingQuestionScreen extends HookConsumerWidget {
  const OnboardingQuestionScreen({super.key, required this.questionId});

  final String questionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    if (profile == null) return const Scaffold(body: KorasLoading());

    final skipProgram = profile.role == UserRole.orgMember;
    final questions =
        onboardingQuestionsFor(skipInterestedProgram: skipProgram);
    final stepIndex = questions.indexWhere((q) => q.id == questionId);

    if (stepIndex < 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.go(onboardingStepPath(questions.first.id));
        }
      });
      return const Scaffold(body: KorasLoading());
    }

    final q = questions[stepIndex];
    final answers = ref.watch(onboardingAnswersProvider);
    final selected = answers[q.id] ?? const <String>[];
    final submitting = useState(false);
    final error = useState<String?>(null);
    final isFirst = stepIndex == 0;
    final isLast = stepIndex == questions.length - 1;

    Future<void> finish() async {
      submitting.value = true;
      error.value = null;
      try {
        final a = ref.read(onboardingAnswersProvider);
        await ref.read(onboardingRepositoryProvider).submitQuiz(
              goals: a['goal'] ?? const [],
              background: (a['background'] ?? const ['professional']).first,
              biggestChallenge:
                  (a['biggest_challenge'] ?? const ['confidence']).first,
              interestedProgram: skipProgram
                  ? null
                  : (a['interested_program']?.firstOrNull),
            );
        ref.read(onboardingAnswersProvider.notifier).clear();
        ref.invalidate(currentProfileProvider);
        await ref.read(currentProfileProvider.future);
        if (context.mounted) context.go('/app/dashboard');
      } on AppError catch (e) {
        error.value = errorToMessage(e);
      } catch (e) {
        error.value = errorToMessage(mapError(e));
      } finally {
        if (context.mounted) submitting.value = false;
      }
    }

    Future<void> next() async {
      if (!isLast) {
        context.go(onboardingStepPath(questions[stepIndex + 1].id));
        return;
      }
      await finish();
    }

    return GlassScreen(
      title: 'Getting started',
      showBack: !isFirst,
      onBack: isFirst
          ? null
          : () => context.go(onboardingStepPath(questions[stepIndex - 1].id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LinearProgressIndicator(
            value: (stepIndex + 1) / questions.length,
            color: context.koras.ember,
            backgroundColor: context.koras.line,
          ),
          const SizedBox(height: 20),
          Text(q.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text(
            q.subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: context.koras.ink500),
          ),
          const SizedBox(height: 16),
          for (final option in q.options) ...[
            _OptionCard(
              label: option.label,
              selected: selected.contains(option.value),
              onTap: () => ref.read(onboardingAnswersProvider.notifier).toggle(
                    q.id,
                    option.value,
                    allowMultiple: q.allowMultiple,
                  ),
            ),
            const SizedBox(height: 10),
          ],
          if (error.value != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                error.value!,
                style: TextStyle(color: context.koras.danger),
              ),
            ),
          const SizedBox(height: 16),
          KorasButton.primary(
            loading: submitting.value,
            onPressed: selected.isEmpty || submitting.value ? null : next,
            child: Text(isLast ? 'Finish' : 'Continue'),
          ),
        ],
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return KorasCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(
            selected ? Icons.check_circle : Icons.circle_outlined,
            color: selected ? k.ember : k.ink300,
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
        ],
      ),
    );
  }
}

class _StaffSetup extends ConsumerWidget {
  const _StaffSetup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassScreen(
      title: 'Welcome',
      showBack: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Text(
            "You're all set",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'Manage your classes and organization from your dashboard.',
          ),
          const SizedBox(height: 24),
          KorasButton.primary(
            onPressed: () async {
              await ref.read(onboardingRepositoryProvider).markComplete();
              ref.invalidate(currentProfileProvider);
              await ref.read(currentProfileProvider.future);
              if (context.mounted) context.go('/app/dashboard');
            },
            child: const Text('Go to dashboard'),
          ),
        ],
      ),
    );
  }
}
