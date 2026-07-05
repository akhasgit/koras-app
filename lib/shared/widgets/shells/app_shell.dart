import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/dashboards/domain/dashboard_nav.dart';
import '../../providers/current_org.dart';
import '../../providers/current_profile.dart';
import '../koras_loading.dart';
import '../koras_logo.dart';
import '../profile_menu_button.dart';
import 'org_admin_drawer.dart';

/// The learner/teacher/org-admin app chrome. Derives the persona and picks
/// bottom nav (learner/teacher) vs drawer (org-admin). See 04 / 20.
///
/// Wraps a [StatefulNavigationShell] so each branch (tab/program) keeps its own
/// navigator alive in an IndexedStack — scroll position, form state and
/// sub-navigation survive tab switches.
class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    final org = ref.watch(currentOrgProvider).valueOrNull;
    if (profile == null) {
      return const Scaffold(body: KorasLoading());
    }

    final role = normalizeFromProfile(profile, org);
    final tabs = tabsForRole(role);
    final loc = GoRouterState.of(context).matchedLocation;

    return Scaffold(
      appBar: AppBar(
        title: const KorasLogo(height: 28),
        centerTitle: true,
        actions: [ProfileMenuButton(profile: profile)],
      ),
      drawer: tabs.isEmpty ? OrgAdminDrawer(activePath: loc) : null,
      body: navigationShell,
      bottomNavigationBar: tabs.isEmpty
          ? null
          : NavigationBar(
              selectedIndex: _selectedTab(tabs),
              destinations: [
                for (final t in tabs)
                  NavigationDestination(icon: Icon(t.icon), label: t.label),
              ],
              onDestinationSelected: (i) => _onTabSelected(tabs, i),
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
