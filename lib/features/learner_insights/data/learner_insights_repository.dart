import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/supabase_service.dart';
import '../../auth/domain/auth_session.dart';
import 'learner_insights.dart';

part 'learner_insights_repository.g.dart';

@riverpod
LearnerInsightsRepository learnerInsightsRepository(Ref ref) =>
    LearnerInsightsRepository(ref.watch(supabaseProvider));

class LearnerInsightsRepository {
  LearnerInsightsRepository(this._sb);
  final SupabaseClient _sb;

  Future<LearnerInsights?> forUser(String userId) async {
    final row = await _sb
        .from('learner_insights')
        .select()
        .eq('user_id', userId)
        .maybeSingle();
    return row == null ? null : LearnerInsights.fromJson(row);
  }
}

@riverpod
Future<LearnerInsights?> learnerInsights(Ref ref) async {
  final session = ref.watch(authSessionProvider);
  if (session == null) return null;
  return ref.watch(learnerInsightsRepositoryProvider).forUser(session.user.id);
}

/// Teacher view of a student's insights (RLS allows reads for owned groups).
@riverpod
Future<LearnerInsights?> studentInsights(Ref ref, String userId) =>
    ref.watch(learnerInsightsRepositoryProvider).forUser(userId);
