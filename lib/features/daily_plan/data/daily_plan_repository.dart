import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/errors/app_error.dart';
import '../../../services/supabase_service.dart';
import '../../../shared/models/enums.dart';
import 'daily_plan.dart';

part 'daily_plan_repository.g.dart';

@riverpod
DailyPlanRepository dailyPlanRepository(Ref ref) =>
    DailyPlanRepository(ref.watch(supabaseProvider));

/// The daily plan is server-owned (lazy generation). See 16.
class DailyPlanRepository {
  DailyPlanRepository(this._sb);
  final SupabaseClient _sb;

  Future<DailyPlan> current({
    DailyPlanGenerationSource source = DailyPlanGenerationSource.lazyDashboard,
  }) async {
    final res = await _sb.functions.invoke(
      'daily-plan-generate',
      body: {'source': 'lazy_dashboard'},
    );
    if (res.status != 200) throw mapEdgeError(res);
    return DailyPlan.fromJson(
        (res.data as Map)['plan'] as Map<String, dynamic>);
  }

  Future<DailyPlan> completeItem(
      String itemId, DailyPlanItemStatus status) async {
    final res = await _sb.functions.invoke('daily-plan-complete-item', body: {
      'itemId': itemId,
      'status': status.name,
    });
    if (res.status != 200) throw mapEdgeError(res);
    return DailyPlan.fromJson(
        (res.data as Map)['plan'] as Map<String, dynamic>);
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
Future<DailyPlan> currentDailyPlan(Ref ref) =>
    ref.watch(dailyPlanRepositoryProvider).current();
