import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../dashboard/data/assessments_repository.dart';
import '../../dashboard/data/voice_assessment.dart';
import '../../daily_plan/data/daily_plan.dart';
import '../../daily_plan/data/daily_plan_repository.dart';
import '../../learner_insights/data/learner_insights.dart';
import '../../learner_insights/data/learner_insights_repository.dart';

part 'learner_home_provider.g.dart';

@immutable
class LearnerHomeData {
  const LearnerHomeData({
    required this.latest,
    required this.insights,
    required this.plan,
  });

  final VoiceAssessment? latest;
  final LearnerInsights? insights;

  /// Null when the daily-plan edge function isn't deployed/available yet.
  final DailyPlan? plan;
}

/// Learner home fetches latest assessment + insights + daily plan in parallel.
/// The plan is server-owned and degrades gracefully if its edge function isn't
/// deployed yet. See 20.
@riverpod
Future<LearnerHomeData> learnerHome(Ref ref) async {
  final results = await Future.wait([
    ref.watch(latestAssessmentProvider.future),
    ref.watch(learnerInsightsProvider.future),
    ref
        .watch(currentDailyPlanProvider.future)
        .then<DailyPlan?>((p) => p)
        .catchError((Object e) {
      debugPrint('daily plan unavailable: $e');
      return null;
    }),
  ]);
  return LearnerHomeData(
    latest: results[0] as VoiceAssessment?,
    insights: results[1] as LearnerInsights?,
    plan: results[2] as DailyPlan?,
  );
}
