import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/supabase_service.dart';

part 'onboarding_repository.g.dart';

@riverpod
OnboardingRepository onboardingRepository(Ref ref) =>
    OnboardingRepository(ref.watch(supabaseProvider));

class OnboardingRepository {
  OnboardingRepository(this._sb);
  final SupabaseClient _sb;

  Future<void> submitQuiz({
    required List<String> goals,
    required String background,
    required String biggestChallenge,
    String? interestedProgram,
  }) async {
    final uid = _sb.auth.currentUser!.id;
    try {
      await _sb.from('onboarding_responses').upsert({
        'user_id': uid,
        'goal': goals.isNotEmpty ? goals.first : null,
        'goals': goals,
        'background': background,
        'biggest_challenge': biggestChallenge,
        'interested_program': interestedProgram,
        'completed_at': DateTime.now().toUtc().toIso8601String(),
      });
      await _sb
          .from('profiles')
          .update({'onboarding_completed': true}).eq('id', uid);
    } on PostgrestException catch (e) {
      throw mapPostgrestError(e);
    }
  }

  /// Lightweight completion for staff setup flows.
  Future<void> markComplete() async {
    final uid = _sb.auth.currentUser!.id;
    await _sb
        .from('profiles')
        .update({'onboarding_completed': true}).eq('id', uid);
  }
}
