import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/models/app_organization.dart';
import '../../../shared/models/app_profile.dart';
import '../../../shared/models/enums.dart';

/// Root path of every `StatefulShellBranch`, in branch order. AppShell maps a
/// tapped tab's route to its branch index via this list so it can call
/// `goBranch` (which preserves each branch's navigation stack + state).
///
/// This MUST stay in sync with the branch order declared in `app_router.dart`.
const appShellBranchRoots = <String>[
  '/app/dashboard', // 0
  '/app/practice', // 1
  '/app/progress', // 2
  '/app/history', // 3
  '/app/reports', // 4
  '/app/settings', // 5
  '/app/group', // 6
  '/app/org', // 7
  '/app/ai-tutor', // 8
  '/app/ielts', // 9
  '/app/interview-prep', // 10
  '/app/onboarding', // 11
  '/app/suspended', // 12
  '/app/locked', // 13
  '/app/admin-unavailable', // 14
];

/// A bottom-nav / sub-nav destination.
class DashboardNavTab {
  const DashboardNavTab(this.label, this.route, this.icon,
      {this.exact = false});
  final String label;
  final String route;
  final IconData icon;
  final bool exact;
}

/// Ported from `dashboard-nav.ts`: derive the normalised persona from
/// `profiles.role` + `organizations.type`. See 20.
NormalizedDashboardRole? mapProfileRoleToNormalized(
  UserRole role, {
  String? orgType,
}) =>
    switch (role) {
      UserRole.orgAdmin => NormalizedDashboardRole.orgAdmin,
      UserRole.orgMember => (orgType == 'school' || orgType == 'university')
          ? NormalizedDashboardRole.student
          : NormalizedDashboardRole.orgMember,
      UserRole.orgManager => NormalizedDashboardRole.teacher,
      UserRole.individual => NormalizedDashboardRole.individual,
      UserRole.superAdmin => null,
    };

/// Convenience that takes the loaded profile + org.
NormalizedDashboardRole? normalizeFromProfile(
  AppProfile profile,
  AppOrganization? org,
) =>
    mapProfileRoleToNormalized(profile.role, orgType: org?.type.name);

/// Bottom-nav tab set per persona (V1). Org-admin returns empty (uses a
/// `KorasSubNav` / drawer instead). See 20.
List<DashboardNavTab> tabsForRole(NormalizedDashboardRole? role) {
  const dash = DashboardNavTab('Dashboard', '/app/dashboard', LucideIcons.house,
      exact: true);
  const settings =
      DashboardNavTab('Settings', '/app/settings', LucideIcons.settings);
  return switch (role) {
    NormalizedDashboardRole.individual ||
    NormalizedDashboardRole.student =>
      const [
        dash,
        DashboardNavTab('Practice', '/app/practice', LucideIcons.mic),
        DashboardNavTab(
            'Progress', '/app/progress', LucideIcons.chartLine),
        DashboardNavTab('History', '/app/history', LucideIcons.clock),
        settings,
      ],
    NormalizedDashboardRole.orgMember => const [
        dash,
        DashboardNavTab('Practice', '/app/practice', LucideIcons.mic),
        DashboardNavTab(
            'Progress', '/app/progress', LucideIcons.chartLine),
        settings,
      ],
    NormalizedDashboardRole.teacher ||
    NormalizedDashboardRole.schoolAdmin =>
      const [
        dash,
        DashboardNavTab('Classes', '/app/group', LucideIcons.users),
        DashboardNavTab(
            'Reports', '/app/reports', LucideIcons.fileText),
        settings,
      ],
    NormalizedDashboardRole.orgAdmin => const [],
    null => const [],
  };
}
