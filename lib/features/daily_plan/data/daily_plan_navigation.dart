import '../../programs/domain/program_catalog.dart';
import 'daily_plan.dart';

/// Resolves a go_router location for a daily-plan item on mobile.
///
/// The API emits web paths (`/ielts`, `/ai-tutor`, …) because the dashboard
/// rules engine is shared with koras-web. Mobile mounts programs under
/// `/app/...`, so we prefer the catalogue route and otherwise prefix `/app`.
String? mobileRouteForDailyPlanItem(DailyPlanItem item) {
  final catalogRoute = findProgram(item.programId)?.route;
  if (catalogRoute != null && catalogRoute.isNotEmpty) return catalogRoute;

  final route = item.route?.trim();
  if (route == null || route.isEmpty) return null;
  if (route.startsWith('/app/') || route == '/app') return route;
  if (route.startsWith('/')) return '/app$route';
  return '/app/$route';
}
