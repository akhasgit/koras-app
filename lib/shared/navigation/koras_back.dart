import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Tab-shell roots from [appRouter]'s StatefulShellRoute branches.
const kAppShellRoots = <String>{
  '/app/dashboard',
  '/app/practice',
  '/app/progress',
  '/app/history',
  '/app/reports',
  '/app/settings',
  '/app/group',
  '/app/org',
  '/app/suspended',
  '/app/admin-unavailable',
};

/// Whether a glass/program chrome back button should show.
///
/// Full-screen overlays (`/app/ielts`, `/app/ai-tutor`, …) always get a back
/// control — even when go_router has lost the imperative push stack after a
/// redirect refresh — so the user is never trapped on a program page.
bool korasShouldShowBack(BuildContext context) {
  if (context.canPop()) return true;
  final loc = GoRouterState.of(context).matchedLocation;
  if (kAppShellRoots.contains(loc)) return false;
  return loc.startsWith('/app/');
}

/// Pops when possible; otherwise [go]s to [fallback].
///
/// go_router's [canPop] can return true while [pop] still throws
/// `GoError: There is nothing to pop` when a StatefulShellRoute navigator and
/// the root page stack disagree — especially after `refreshListenable` rebuilds
/// wipe an imperative [push] under a full-screen program route.
void korasBack(BuildContext context, {String fallback = '/app/dashboard'}) {
  final router = GoRouter.of(context);
  if (router.canPop()) {
    try {
      router.pop();
      return;
    } catch (_) {
      // Fall through to a deterministic destination.
    }
  }
  context.go(fallback);
}
