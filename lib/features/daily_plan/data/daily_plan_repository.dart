import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../services/koras_api_client.dart';
import '../../../services/supabase_service.dart';
import '../../../shared/models/enums.dart';
import 'daily_plan.dart';

part 'daily_plan_repository.g.dart';

@riverpod
DailyPlanRepository dailyPlanRepository(Ref ref) => DailyPlanRepository(
      ref.watch(korasApiClientProvider),
      ref.watch(supabaseProvider),
    );

/// Daily plan is server-owned (lazy generation via koras-api).
/// See `docs/MOBILE_API_ALIGNMENT_PLAN.md` §4.2.
class DailyPlanRepository {
  DailyPlanRepository(this._api, this._sb);
  final KorasApiClient _api;
  final SupabaseClient _sb;

  String get _uid => _api.userId;

  Future<DailyPlan?> current({
    DailyPlanGenerationSource source = DailyPlanGenerationSource.lazyDashboard,
  }) async {
    final data = await _api.apiGet('/daily-plan/$_uid/current');
    final plan = data['plan'];
    if (plan == null) return null;
    return DailyPlan.fromJson((plan as Map).cast<String, dynamic>());
  }

  Future<void> completeItem(
    String planId,
    String itemId,
    DailyPlanItemStatus status,
  ) async {
    await _api.apiPost('/daily-plan/$_uid/complete-item', {
      'planId': planId,
      'itemId': itemId,
      'status': status.name,
    });
  }

  Future<List<DailyPlan>> history({int limit = 20}) async {
    final rows = await _sb
        .from('daily_lesson_plans')
        .select()
        .order('generated_at', ascending: false)
        .limit(limit);
    return (rows as List)
        .map((r) => DailyPlan.fromJson(r as Map<String, dynamic>))
        .toList();
  }
}

@riverpod
Future<DailyPlan?> currentDailyPlan(Ref ref) =>
    ref.watch(dailyPlanRepositoryProvider).current();
