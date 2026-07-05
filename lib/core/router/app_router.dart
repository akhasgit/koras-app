import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/ai_tutor/presentation/ai_tutor_screen.dart';
import '../../features/auth/domain/auth_session.dart';
import '../../features/auth/presentation/screens/auth_callback_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/join_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import '../../features/dashboard/presentation/assess_screen.dart';
import '../../features/dashboard/presentation/assessment_history_screen.dart';
import '../../features/dashboard/presentation/practice_screen.dart';
import '../../features/dashboard/presentation/progress_screen.dart';
import '../../features/dashboards/presentation/admin_unavailable_screen.dart';
import '../../features/dashboards/presentation/group_screens.dart';
import '../../features/dashboards/presentation/learner_home_screen.dart';
import '../../features/dashboards/presentation/org_screens.dart';
import '../../features/dashboards/presentation/suspended_screen.dart';
import '../../features/ielts/domain/ielts_enums.dart';
import '../../features/ielts/presentation/ielts_screens.dart';
import '../../features/interview_prep/presentation/interview_screens.dart';
import '../../features/invitations/presentation/invite_screen.dart';
import '../../features/locked/presentation/locked_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/programs/presentation/program_access_providers.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../shared/models/enums.dart';
import '../../shared/providers/current_org_status.dart';
import '../../shared/providers/current_profile.dart';
import '../../shared/widgets/shells/admin_shell.dart';
import '../../shared/widgets/shells/app_shell.dart';
import '../../shared/widgets/shells/auth_shell.dart';
import 'router_refresh.dart';

part 'app_router.g.dart';

/// Maps a program route to its catalogue id for access gating.
const _programIdForRoute = <String, String>{
  '/app/ai-tutor': 'ai-tutor',
  '/app/ielts': 'ielts-speaking',
  '/app/interview-prep': 'interview-prep',
};

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refresh = ref.watch(routerRefreshProvider.notifier);
  return GoRouter(
    initialLocation: '/app/dashboard',
    refreshListenable: refresh,
    redirect: (context, state) => _topLevelRedirect(ref, state),
    routes: [
      ShellRoute(
        builder: (_, __, child) => AuthShell(child: child),
        routes: [
          GoRoute(path: '/auth/login', builder: (_, __) => const LoginScreen()),
          GoRoute(path: '/auth/join', builder: (_, __) => const JoinScreen()),
          GoRoute(
              path: '/auth/forgot-password',
              builder: (_, __) => const ForgotPasswordScreen()),
          GoRoute(
              path: '/auth/reset-password',
              builder: (_, __) => const ResetPasswordScreen()),
          GoRoute(
              path: '/auth/callback',
              builder: (_, __) => const AuthCallbackScreen()),
          GoRoute(
            path: '/auth/invite/:token',
            builder: (_, s) => InviteScreen(token: s.pathParameters['token']!),
          ),
        ],
      ),
      // Each branch keeps its own Navigator alive inside an IndexedStack, so
      // scroll position / form state / sub-navigation is preserved when you
      // switch tabs. Branch switches are instant (no transition); pushing a
      // detail route WITHIN a branch keeps the default slide animation.
      //
      // Branch order MUST stay in sync with `appShellBranchRoots` in
      // dashboard_nav.dart, which AppShell uses to map a tab -> branch index.
      StatefulShellRoute.indexedStack(
        builder: (_, __, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          // 0 — Dashboard (home). `assess` is a drill-down kept within it.
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/dashboard',
                builder: (_, __) => const DashboardLearnerScreen(),
                routes: [
                  GoRoute(
                    path: 'assess',
                    builder: (_, s) => AssessScreen(
                      isBaseline: s.uri.queryParameters['baseline'] == '1',
                    ),
                  ),
                ],
              ),
            ],
          ),
          // 1 — Practice
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/practice',
                  builder: (_, __) => const PracticeScreen()),
            ],
          ),
          // 2 — Progress
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/progress',
                  builder: (_, __) => const ProgressScreen()),
            ],
          ),
          // 3 — History
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/history',
                  builder: (_, __) => const AssessmentHistoryScreen()),
            ],
          ),
          // 4 — Reports
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/reports',
                  builder: (_, __) => const ReportsScreen()),
            ],
          ),
          // 5 — Settings
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/settings',
                  builder: (_, __) => const SettingsScreen()),
            ],
          ),
          // 6 — Classes / group (with detail drill-down)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/group',
                builder: (_, __) => const DashboardGroupScreen(),
                routes: [
                  GoRoute(
                      path: 'new',
                      builder: (_, __) => const NewGroupScreen()),
                  GoRoute(
                      path: 'my-voice',
                      builder: (_, __) => const ManagerMyVoiceScreen()),
                  GoRoute(
                    path: ':id',
                    builder: (_, s) =>
                        GroupDetailScreen(id: s.pathParameters['id']!),
                    routes: [
                      GoRoute(
                          path: 'analytics',
                          builder: (_, s) => GroupAnalyticsScreen(
                              id: s.pathParameters['id']!)),
                      GoRoute(
                          path: 'settings',
                          builder: (_, s) => GroupSettingsScreen(
                              id: s.pathParameters['id']!)),
                      GoRoute(
                        path: 'students',
                        builder: (_, s) =>
                            GroupStudentsScreen(id: s.pathParameters['id']!),
                        routes: [
                          GoRoute(
                              path: 'bulk-import',
                              builder: (_, s) => BulkImportScreen(
                                  groupId: s.pathParameters['id'])),
                          GoRoute(
                              path: ':userId',
                              builder: (_, s) => StudentDetailScreen(
                                    groupId: s.pathParameters['id']!,
                                    userId: s.pathParameters['userId']!,
                                  )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // 7 — Org admin (drawer destinations + detail drill-down)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/org',
                builder: (_, __) => const DashboardOrgScreen(),
                routes: [
                  GoRoute(
                      path: 'groups',
                      builder: (_, __) => const OrgGroupsScreen()),
                  GoRoute(
                      path: 'settings',
                      builder: (_, __) => const OrgSettingsScreen()),
                  GoRoute(
                    path: 'users',
                    builder: (_, __) => const OrgUsersScreen(),
                    routes: [
                      GoRoute(
                          path: 'bulk-import',
                          builder: (_, __) => const BulkImportScreen()),
                      GoRoute(
                          path: ':id',
                          builder: (_, s) => OrgUserDetailScreen(
                              id: s.pathParameters['id']!)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // 8 — AI Tutor (program)
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/ai-tutor',
                  builder: (_, __) => const AiTutorScreen()),
            ],
          ),
          // 9 — IELTS (program, with sub-routes)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/ielts',
                builder: (_, __) => const IeltsHomeScreen(),
                routes: [
                  GoRoute(
                      path: 'lessons/:lessonId',
                      builder: (_, s) => IeltsLessonScreen(
                          lessonId: s.pathParameters['lessonId']!)),
                  GoRoute(
                      path: 'practice/part-1',
                      builder: (_, __) =>
                          const IeltsPracticeScreen(part: IeltsPart.part1)),
                  GoRoute(
                      path: 'practice/part-2',
                      builder: (_, __) =>
                          const IeltsPracticeScreen(part: IeltsPart.part2)),
                  GoRoute(
                      path: 'practice/part-3',
                      builder: (_, __) =>
                          const IeltsPracticeScreen(part: IeltsPart.part3)),
                  GoRoute(
                      path: 'mock-test',
                      builder: (_, __) => const IeltsMockTestScreen()),
                  GoRoute(
                      path: 'results/:attemptId',
                      builder: (_, s) => IeltsResultScreen(
                          attemptId: s.pathParameters['attemptId']!)),
                ],
              ),
            ],
          ),
          // 10 — Interview Prep (program, with sub-routes)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/interview-prep',
                builder: (_, __) => const InterviewPrepHomeScreen(),
                routes: [
                  GoRoute(
                      path: 'scenarios/new',
                      builder: (_, __) => const NewScenarioScreen()),
                  GoRoute(
                      path: 'scenarios/:scenarioId',
                      builder: (_, s) => ScenarioDetailScreen(
                          id: s.pathParameters['scenarioId']!)),
                  GoRoute(
                      path: 'scenarios/:scenarioId/practice',
                      builder: (_, s) => ScenarioPracticeScreen(
                          id: s.pathParameters['scenarioId']!)),
                  GoRoute(
                      path: 'session-summary/:scenarioId',
                      builder: (_, s) => SessionSummaryScreen(
                          id: s.pathParameters['scenarioId']!)),
                  GoRoute(
                      path: 'attempts/:attemptId',
                      builder: (_, s) => InterviewAttemptScreen(
                          id: s.pathParameters['attemptId']!)),
                ],
              ),
            ],
          ),
          // 11 — Onboarding
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/onboarding',
                  builder: (_, __) => const OnboardingScreen()),
            ],
          ),
          // 12 — Suspended
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/suspended',
                  builder: (_, __) => const SuspendedScreen()),
            ],
          ),
          // 13 — Locked
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/locked',
                builder: (_, s) =>
                    LockedScreen(programId: s.uri.queryParameters['program']),
              ),
            ],
          ),
          // 14 — Admin unavailable
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/admin-unavailable',
                  builder: (_, __) => const AdminUnavailableScreen()),
            ],
          ),
        ],
      ),
      // AdminShell — NOT IN V1; never reached on mobile.
      ShellRoute(
        builder: (_, __, child) => AdminShell(child: child),
        routes: [
          GoRoute(
              path: '/admin',
              builder: (_, __) => const AdminUnavailableScreen()),
        ],
      ),
    ],
  );
}

String? _topLevelRedirect(Ref ref, GoRouterState state) {
  final session = ref.read(authSessionProvider);
  final profile = ref.read(currentProfileProvider).valueOrNull;
  final loc = state.matchedLocation;

  final isAuth = loc.startsWith('/auth');
  final isApp = loc.startsWith('/app');
  final isAdmin = loc.startsWith('/admin');

  if (isAdmin) {
    if (session == null) return '/auth/login?next=$loc';
    if (profile?.role != UserRole.superAdmin) return '/app/dashboard';
    return '/app/admin-unavailable';
  }

  if (isApp && session == null) return '/auth/login?next=$loc';

  if (isAuth &&
      session != null &&
      loc != '/auth/callback' &&
      !loc.startsWith('/auth/invite')) {
    if (profile?.role == UserRole.superAdmin) return '/app/admin-unavailable';
    if (profile?.onboardingCompleted != true) return '/app/onboarding';
    return _homeForRole(profile?.role);
  }

  if (isApp && session != null) {
    if (profile?.role == UserRole.superAdmin &&
        loc != '/app/admin-unavailable') {
      return '/app/admin-unavailable';
    }

    if (profile?.orgId != null && profile?.role != UserRole.superAdmin) {
      final orgStatus = ref.read(currentOrgStatusProvider).valueOrNull;
      if (orgStatus == OrgStatus.suspended && loc != '/app/suspended') {
        return '/app/suspended';
      }
    }

    if (profile != null &&
        profile.onboardingCompleted != true &&
        loc != '/app/onboarding') {
      return '/app/onboarding';
    }

    if (loc == '/app/dashboard') {
      if (profile?.role == UserRole.orgAdmin) return '/app/org';
      if (profile?.role == UserRole.orgManager) return '/app/group';
    }

    // Program access gating (defers to RLS-filtered rows once loaded).
    final programId = _programIdForRoute.entries
        .where((e) => loc == e.key || loc.startsWith('${e.key}/'))
        .map((e) => e.value)
        .firstOrNull;
    if (programId != null) {
      final accessible = ref.read(accessibleProgramIdsProvider).valueOrNull;
      if (accessible != null && !accessible.contains(programId)) {
        return '/app/locked?program=$programId';
      }
    }
  }

  return null;
}

String _homeForRole(UserRole? role) => switch (role) {
      UserRole.orgAdmin => '/app/org',
      UserRole.orgManager => '/app/group',
      _ => '/app/dashboard',
    };
