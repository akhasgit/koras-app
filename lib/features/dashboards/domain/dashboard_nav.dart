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
  '/app/voice-foundations', // 15
  '/app/vocabulary', // 16
  '/app/listening', // 17
  '/app/voice-refinement', // 18
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

/// Centre floating action button in the glass tab bar. Learner/student personas
/// get a Mic FAB that opens the AI Tutor (redesign Q2). Teacher/admin: none.
class DashboardFab {
  const DashboardFab(this.route, this.icon);
  final String route;
  final IconData icon;
}

/// The FAB shown in the middle of the bottom nav for a given persona.
DashboardFab? fabForRole(NormalizedDashboardRole? role) => switch (role) {
      NormalizedDashboardRole.individual ||
      NormalizedDashboardRole.student ||
      NormalizedDashboardRole.orgMember =>
        const DashboardFab('/app/ai-tutor', LucideIcons.mic),
      _ => null,
    };

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
  // Learner/student/org-member share one 5-slot glass nav: the four tabs below
  // plus a centre Mic FAB (see `fabForRole`) inserted between Voice and Paths.
  const learner = [
    DashboardNavTab('Today', '/app/dashboard', LucideIcons.house, exact: true),
    DashboardNavTab('Voice', '/app/progress', LucideIcons.audioLines),
    DashboardNavTab('Paths', '/app/practice', LucideIcons.bookOpen),
    DashboardNavTab('Reads', '/app/history', LucideIcons.clock),
  ];
  return switch (role) {
    NormalizedDashboardRole.individual ||
    NormalizedDashboardRole.student ||
    NormalizedDashboardRole.orgMember =>
      learner,
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
