import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_chip.dart';
import '../../../shared/widgets/koras_eyebrow.dart';
import '../data/reading_models.dart';
import '../data/reading_repository.dart';

const _kGoalOptions = <String>[
  'Read more fluently',
  'Sound more confident',
  'Steady my pace',
  'Clearer pronunciation',
  'More expressive reading',
  'Build my vocabulary',
];

const _kIntentSuggestions = <String>[
  'Reading for school',
  'University seminars',
  'Presentations at work',
  'Job interviews',
  'Everyday confidence',
];

const _kPersonas = <(String, String, IconData)>[
  ('student', 'Student', LucideIcons.graduationCap),
  ('university', 'University', LucideIcons.library),
  ('professional', 'Professional', LucideIcons.briefcase),
  ('job_seeker', 'Job seeker', LucideIcons.idCard),
  ('other', 'Other', LucideIcons.sparkles),
];

/// Reading intake — §4 + §6.1.
///
/// Existing users (anything usable from `intake-defaults`) get a single
/// prefilled review card ("Does this still sound like you?"); brand-new users
/// get the three-step wizard: intent → goals → persona (+grade).
class ReadingIntakeScreen extends HookConsumerWidget {
  const ReadingIntakeScreen({super.key, required this.onCompleted});

  /// Called with the saved profile once `POST /intake` succeeds.
  final void Function(ReadingProfile profile) onCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultsAsync = ref.watch(readingIntakeDefaultsProvider);

    return defaultsAsync.when(
      data: (defaults) => _IntakeForm(defaults: defaults, onCompleted: onCompleted),
      // Never block the on-ramp on prefill problems — fall back to the
      // blank wizard.
      error: (_, __) => _IntakeForm(
        defaults: const ReadingIntakeDefaults(),
        onCompleted: onCompleted,
      ),
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _IntakeForm extends HookConsumerWidget {
  const _IntakeForm({required this.defaults, required this.onCompleted});

  final ReadingIntakeDefaults defaults;
  final void Function(ReadingProfile profile) onCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final prefilled = defaults.hasMeaningfulDefaults;

    final intent = useTextEditingController(text: defaults.intent ?? '');
    final goals = useState<List<String>>([...defaults.goals]);
    final persona = useState<String?>(defaults.persona);
    final gradeLevel = useState<int?>(defaults.gradeLevel);
    // Wizard step (0..2). Prefilled users see everything on one review card.
    final step = useState(0);
    final busy = useState(false);
    final error = useState<String?>(null);
    // Re-listen so the controller-driven CTA enables/disables live.
    useListenable(intent);

    final personaValid = persona.value != null &&
        (persona.value != 'student' || gradeLevel.value != null);
    final canSubmit =
        intent.text.trim().isNotEmpty && goals.value.isNotEmpty && personaValid;

    Future<void> submit() async {
      busy.value = true;
      error.value = null;
      try {
        final profile =
            await ref.read(readingRepositoryProvider).submitIntake(
                  intent: intent.text.trim(),
                  goals: goals.value,
                  persona: persona.value!,
                  gradeLevel:
                      persona.value == 'student' ? gradeLevel.value : null,
                );
        onCompleted(profile);
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        busy.value = false;
      }
    }

    final intentSection = _Section(
      eyebrow: 'What brings you here?',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: intent,
            maxLines: 2,
            minLines: 1,
            decoration: const InputDecoration(
              hintText: 'e.g. reading confidently in class',
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final s in _kIntentSuggestions)
                KorasChip(
                  label: s,
                  active: intent.text == s,
                  onTap: () => intent.text = s,
                ),
            ],
          ),
        ],
      ),
    );

    final goalsSection = _Section(
      eyebrow: 'What would you like to improve?',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final g in _kGoalOptions)
            KorasChip(
              label: g,
              active: goals.value.contains(g),
              onTap: () {
                final next = [...goals.value];
                next.contains(g) ? next.remove(g) : next.add(g);
                goals.value = next;
              },
            ),
        ],
      ),
    );

    final personaSection = _Section(
      eyebrow: 'Which sounds most like you?',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final (id, label, _) in _kPersonas)
                KorasChip(
                  label: label,
                  active: persona.value == id,
                  onTap: () => persona.value = id,
                ),
            ],
          ),
          if (persona.value == 'student') ...[
            const SizedBox(height: 16),
            const KorasEyebrow(text: 'Grade level'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var g = 4; g <= 12; g++)
                  KorasChip(
                    label: '$g',
                    active: gradeLevel.value == g,
                    onTap: () => gradeLevel.value = g,
                  ),
              ],
            ),
          ],
        ],
      ),
    );

    if (prefilled) {
      // §6.1 — single confirm-and-edit review card.
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GlassCard(
            strong: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Does this still sound like you?',
                    style: korasSerifItalic(24, color: k.ink900)),
                const SizedBox(height: 6),
                Text(
                  'We have filled this in from what we already know. '
                  'Change anything before we build your programme.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: k.muted),
                ),
                const SizedBox(height: 20),
                intentSection,
                const SizedBox(height: 20),
                goalsSection,
                const SizedBox(height: 20),
                personaSection,
              ],
            ),
          ),
          if (error.value != null) ...[
            const SizedBox(height: 12),
            Text(error.value!, style: TextStyle(color: k.danger)),
          ],
          const SizedBox(height: 20),
          KorasButton.primary(
            onPressed: canSubmit ? submit : null,
            loading: busy.value,
            child: const Text('Looks right — continue'),
          ),
        ],
      );
    }

    // New users — three-step wizard: intent → goals → persona (+grade).
    final sections = [intentSection, goalsSection, personaSection];
    final stepValid = switch (step.value) {
      0 => intent.text.trim().isNotEmpty,
      1 => goals.value.isNotEmpty,
      _ => personaValid,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            for (var i = 0; i < 3; i++) ...[
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: i <= step.value ? k.ember : k.line,
                  ),
                ),
              ),
              if (i < 2) const SizedBox(width: 6),
            ],
          ],
        ),
        const SizedBox(height: 8),
        KorasEyebrow(text: 'Step ${step.value + 1} of 3'),
        const SizedBox(height: 12),
        GlassCard(strong: true, child: sections[step.value]),
        if (error.value != null) ...[
          const SizedBox(height: 12),
          Text(error.value!, style: TextStyle(color: k.danger)),
        ],
        const SizedBox(height: 20),
        Row(
          children: [
            if (step.value > 0)
              KorasButton.glass(
                onPressed: () => step.value -= 1,
                child: const Text('Back'),
              ),
            const Spacer(),
            KorasButton.primary(
              onPressed: !stepValid
                  ? null
                  : step.value < 2
                      ? () => step.value += 1
                      : canSubmit
                          ? submit
                          : null,
              loading: busy.value,
              child: Text(step.value < 2 ? 'Next' : 'Continue'),
            ),
          ],
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.eyebrow, required this.child});

  final String eyebrow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KorasEyebrow(text: eyebrow),
        const SizedBox(height: 10),
        child,
      ],
    );
  }
}
