import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/dashboards/domain/dashboard_nav.dart';
import '../../providers/current_org.dart';
import '../../providers/current_profile.dart';
import '../glass/mesh_background.dart';
import '../koras_loading.dart';
import '../koras_tab_bar.dart';
import 'org_admin_drawer.dart';

/// The learner/teacher/org-admin app chrome. Derives the persona and picks
/// the floating glass bottom nav (learner/teacher) vs drawer (org-admin).
///
/// Wraps a [StatefulNavigationShell] so each branch (tab/program) keeps its own
/// navigator alive in an IndexedStack — scroll position, form state and
/// sub-navigation survive tab switches.
class AppShell extends ConsumerWidget {
  const AppShell({
    super.key,
    required this.navigationShell,
    required this.matchedLocation,
  });
  final StatefulNavigationShell navigationShell;
  /// From the shell route's [GoRouterState] — do not call
  /// [GoRouterState.of] here; that fails when the shell first mounts after a
  /// full-screen route (e.g. post-onboarding → dashboard).
  final String matchedLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    final org = ref.watch(currentOrgProvider).valueOrNull;
    if (profile == null) {
      return const Scaffold(body: MeshBackground(child: KorasLoading()));
    }

    final role = normalizeFromProfile(profile, org);
    final tabs = tabsForRole(role);
    final fab = fabForRole(role);
    final loc = matchedLocation;

    // Mesh fills the whole screen including the status bar.
    // No AppBar — each screen owns its own header row (kicker + title + avatar).
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark, // dark icons on warm mesh background
      child: Stack(
        children: [
          const Positioned.fill(child: MeshBackground()),
          Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            drawer: tabs.isEmpty ? OrgAdminDrawer(activePath: loc) : null,
            body: navigationShell,
            bottomNavigationBar: tabs.isEmpty
                ? null
                : KorasTabBar(
                    tabs: [
                      for (final t in tabs) KorasTabItem(t.icon, t.label),
                    ],
                    selectedIndex: _selectedTab(tabs),
                    onSelect: (i) => _onTabSelected(tabs, i),
                    fabIcon: fab?.icon,
                    onFabTap: fab == null ? null : () => context.push(fab.route),
                  ),
          ),
        ],
      ),
    );
  }

  /// Highlight the visible tab whose branch is currently active. Programs and
  /// other non-tab branches map to no tab, so we fall back to the first tab.
  int _selectedTab(List<DashboardNavTab> tabs) {
    for (var i = 0; i < tabs.length; i++) {
      if (appShellBranchRoots.indexOf(tabs[i].route) ==
          navigationShell.currentIndex) {
        return i;
      }
    }
    return 0;
  }

  void _onTabSelected(List<DashboardNavTab> tabs, int tappedIndex) {
    final branch = appShellBranchRoots.indexOf(tabs[tappedIndex].route);
    if (branch < 0) return;
    // Re-tapping the active tab pops it back to the branch's initial route.
    navigationShell.goBranch(
      branch,
      initialLocation: branch == navigationShell.currentIndex,
    );
  }
}
