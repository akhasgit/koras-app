import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../shared/models/enums.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/onboarding_repository.dart';
import '../domain/onboarding_config.dart';

/// Role-aware onboarding. Individuals/org-members take the quiz; staff get a
/// short setup. Super-admins are redirected before this mounts. See 19.
class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    if (profile == null) return const Scaffold(body: KorasLoading());
    return switch (profile.role) {
      UserRole.individual => const _QuizFlow(skipInterestedProgram: false),
      UserRole.orgMember => const _QuizFlow(skipInterestedProgram: true),
      UserRole.orgAdmin || UserRole.orgManager => const _StaffSetup(),
      UserRole.superAdmin => const Scaffold(body: KorasLoading()),
    };
  }
}

class _QuizFlow extends HookConsumerWidget {
  const _QuizFlow({required this.skipInterestedProgram});
  final bool skipInterestedProgram;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = skipInterestedProgram
        ? kOnboardingQuestions
            .where((q) => q.id != 'interested_program')
            .toList()
        : kOnboardingQuestions;
    final step = useState(0);
    final answers = useState<Map<String, List<String>>>({});
    final submitting = useState(false);
    final error = useState<String?>(null);

    final q = questions[step.value];
    final selected = answers.value[q.id] ?? const [];

    void toggle(String value) {
      final current = List<String>.from(answers.value[q.id] ?? const []);
      if (q.allowMultiple) {
        current.contains(value) ? current.remove(value) : current.add(value);
      } else {
        current
          ..clear()
          ..add(value);
      }
      answers.value = {...answers.value, q.id: current};
    }

    Future<void> finish() async {
      submitting.value = true;
      error.value = null;
      try {
        final a = answers.value;
        await ref.read(onboardingRepositoryProvider).submitQuiz(
              goals: a['goal'] ?? const [],
              background: (a['background'] ?? const ['professional']).first,
              biggestChallenge:
                  (a['biggest_challenge'] ?? const ['confidence']).first,
              interestedProgram: skipInterestedProgram
                  ? null
                  : (a['interested_program']?.firstOrNull),
            );
        ref.invalidate(currentProfileProvider);
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
      if (step.value < questions.length - 1) {
        step.value++;
      } else {
        await finish();
      }
    }

    return KorasScreen(
      title: 'Getting started',
      children: [
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: (step.value + 1) / questions.length,
          color: context.koras.ember,
          backgroundColor: context.koras.line,
        ),
        const SizedBox(height: 20),
        Text(q.title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 4),
        Text(q.subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: context.koras.ink500)),
        const SizedBox(height: 16),
        for (final option in q.options) ...[
          _OptionCard(
            label: option.label,
            selected: selected.contains(option.value),
            onTap: () => toggle(option.value),
          ),
          const SizedBox(height: 10),
        ],
        if (error.value != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(error.value!,
                style: TextStyle(color: context.koras.danger)),
          ),
        const SizedBox(height: 16),
        KorasButton.primary(
          loading: submitting.value,
          onPressed: selected.isEmpty || submitting.value ? null : next,
          child:
              Text(step.value < questions.length - 1 ? 'Continue' : 'Finish'),
        ),
      ],
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
    return KorasScreen(
      title: 'Welcome',
      children: [
        const SizedBox(height: 24),
        Text('You\'re all set',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text(
          'Manage your classes and organization from your dashboard.',
        ),
        const SizedBox(height: 24),
        KorasButton.primary(
          onPressed: () async {
            await ref.read(onboardingRepositoryProvider).markComplete();
            ref.invalidate(currentProfileProvider);
            if (context.mounted) context.go('/app/dashboard');
          },
          child: const Text('Go to dashboard'),
        ),
      ],
    );
  }
}
