import 'package:flutter_riverpod/flutter_riverpod.dart';

/// In-memory quiz answers shared across per-question onboarding routes.
class OnboardingAnswersNotifier extends Notifier<Map<String, List<String>>> {
  @override
  Map<String, List<String>> build() => const {};

  void toggle(
    String questionId,
    String value, {
    required bool allowMultiple,
  }) {
    final current = List<String>.from(state[questionId] ?? const []);
    if (allowMultiple) {
      current.contains(value) ? current.remove(value) : current.add(value);
    } else {
      current
        ..clear()
        ..add(value);
    }
    state = {...state, questionId: List<String>.unmodifiable(current)};
  }

  void clear() => state = const {};
}

final onboardingAnswersProvider =
    NotifierProvider<OnboardingAnswersNotifier, Map<String, List<String>>>(
  OnboardingAnswersNotifier.new,
);
