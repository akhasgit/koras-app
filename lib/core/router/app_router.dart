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
import '../../features/dashboard/presentation/voice_history_screen.dart';
import '../../features/dashboards/presentation/admin_unavailable_screen.dart';
import '../../features/dashboards/presentation/group_screens.dart';
import '../../features/dashboards/presentation/learner_home_screen.dart';
import '../../features/dashboards/presentation/org_screens.dart';
import '../../features/dashboards/presentation/suspended_screen.dart';
import '../../features/ielts/domain/ielts_enums.dart';
import '../../features/ielts/presentation/ielts_screens.dart';
import '../../features/interview_prep/presentation/interview_screens.dart';
import '../../features/invitations/presentation/invite_screen.dart';
import '../../features/listening/presentation/listening_home_screen.dart';
import '../../features/listening/presentation/listening_runtime_screen.dart';
import '../../features/locked/presentation/locked_screen.dart';
import '../../features/inbox/presentation/inbox_screen.dart';
import '../../features/onboarding/domain/onboarding_config.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/programs/presentation/program_access_providers.dart';
import '../../features/reading/data/reading_models.dart';
import '../../features/reading/presentation/reading_lesson_screen.dart';
import '../../features/reading/presentation/reading_path_screen.dart';
import '../../features/reading/presentation/reading_read_aloud_screen.dart';
import '../../features/reading/presentation/reading_results_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/vocabulary/presentation/vocabulary_attempt_screen.dart';
import '../../features/vocabulary/presentation/vocabulary_home_screen.dart';
import '../../features/vocabulary/presentation/vocabulary_library_screen.dart';
import '../../features/voice_foundations/presentation/voice_foundations_activity_screen.dart';
import '../../features/voice_foundations/presentation/voice_foundations_home_screen.dart';
import '../../features/voice_refinement/presentation/voice_refinement_activity_screen.dart';
import '../../features/voice_refinement/presentation/voice_refinement_baseline_screen.dart';
import '../../features/voice_refinement/presentation/voice_refinement_explore_screen.dart';
import '../../features/voice_refinement/presentation/voice_refinement_home_screen.dart';
import '../../shared/models/enums.dart';
import '../../shared/providers/current_org_status.dart';
import '../../shared/providers/current_profile.dart';
import '../../shared/widgets/shells/admin_shell.dart';
import '../../shared/widgets/shells/app_shell.dart';
import '../../shared/widgets/shells/auth_shell.dart';
import '../../shared/widgets/transitions/mic_fab_transition.dart';
import 'router_refresh.dart';

part 'app_router.g.dart';

/// Maps a program route to its catalogue id for access gating.
const _programIdForRoute = <String, String>{
  '/app/ai-tutor': 'ai-tutor',
  '/app/ielts': 'ielts-speaking',
  '/app/interview-prep': 'interview-prep',
  '/app/voice-foundations': 'voice-foundations',
  '/app/vocabulary': 'daily-vocabulary',
  '/app/listening': 'listening-comprehension',
  '/app/voice-refinement': 'voice-refinement',
  '/app/reading': 'reading',
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
      // Profile + Inbox — full-screen pages reached from the header avatar menu
      // (they overlay the tab shell rather than living in it).
      GoRoute(
        path: '/app/profile',
        builder: (_, __) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/app/inbox',
        builder: (_, __) => const InboxScreen(),
      ),
      // Voice history — full-screen overlay reached from the Voice tab's
      // history icon. Its own screen (`VoiceHistoryScreen`), independent from
      // the Reads tab, with a back button and its own Scaffold/mesh backdrop.
      GoRoute(
        path: '/app/voice-history',
        builder: (_, __) => const VoiceHistoryScreen(),
      ),
      // Assessment — full-screen overlay (no bottom nav).
      GoRoute(
        path: '/app/assess',
        builder: (_, s) => AssessScreen(
          isBaseline: s.uri.queryParameters['baseline'] == '1',
        ),
      ),
      // Onboarding — full-screen overlay (no bottom nav). Each quiz question
      // is its own child route so Continue/Back navigate between screens.
      GoRoute(
        path: '/app/onboarding',
        builder: (_, __) => const OnboardingScreen(),
        routes: [
          for (final q in kOnboardingQuestions)
            GoRoute(
              path: q.id,
              builder: (_, __) => OnboardingQuestionScreen(questionId: q.id),
            ),
        ],
      ),
      // Program routes — full-screen overlays outside the tab shell.
      GoRoute(
        path: '/app/ai-tutor',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const AiTutorScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 320),
          transitionsBuilder: micFabExpandTransition,
        ),
      ),
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
      GoRoute(
        path: '/app/voice-foundations',
        builder: (_, __) => const VoiceFoundationsHomeScreen(),
        routes: [
          GoRoute(
            path: 'activity/:activityId',
            builder: (_, s) => VoiceFoundationsActivityScreen(
              activityId: s.pathParameters['activityId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/app/vocabulary',
        builder: (_, __) => const VocabularyHomeScreen(),
        routes: [
          GoRoute(
            path: 'library',
            builder: (_, __) => const VocabularyLibraryScreen(),
          ),
          GoRoute(
            path: 'history',
            builder: (_, __) => const VocabularyHistoryScreen(),
          ),
          GoRoute(
            path: 'word/:word',
            builder: (_, s) => VocabularyWordScreen(
              word: Uri.decodeComponent(s.pathParameters['word']!),
              dailySetId: s.uri.queryParameters['setId'] ?? '',
            ),
          ),
          GoRoute(
            path: 'attempt',
            builder: (_, s) => VocabularyAttemptScreen(
              word: s.uri.queryParameters['word'] ?? '',
              kind: s.uri.queryParameters['kind'] ?? 'pronounce',
              dailySetId: s.uri.queryParameters['setId'] ?? '',
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/app/listening',
        builder: (_, __) => const ListeningHomeScreen(),
        routes: [
          GoRoute(
            path: ':passageId',
            builder: (_, s) => ListeningRuntimeScreen(
              passageId: s.pathParameters['passageId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/app/reading',
        builder: (_, __) => const ReadingPathScreen(),
        routes: [
          GoRoute(
            path: 'stage/:stageId',
            builder: (_, s) => ReadingStageScreen(
              stageId: s.pathParameters['stageId']!,
            ),
          ),
          GoRoute(
            path: 'lesson/:stageId/:lessonId',
            builder: (_, s) => ReadingLessonScreen(
              stageId: s.pathParameters['stageId']!,
              lessonId: s.pathParameters['lessonId']!,
            ),
          ),
          GoRoute(
            path: 'read/:attemptContext',
            builder: (_, s) => ReadingReadAloudScreen(
              attemptContext: s.pathParameters['attemptContext']!,
            ),
          ),
          GoRoute(
            path: 'results/:attemptId',
            builder: (_, s) => ReadingResultsScreen(
              attemptId: s.pathParameters['attemptId']!,
              initial: s.extra is ReadingAttempt
                  ? s.extra as ReadingAttempt
                  : null,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/app/voice-refinement',
        builder: (_, __) => const VoiceRefinementHomeScreen(),
        routes: [
          GoRoute(
            path: 'baseline',
            builder: (_, __) => const VoiceRefinementBaselineScreen(),
          ),
          GoRoute(
            path: 'explore/:baselineId',
            builder: (_, s) => VoiceRefinementExploreScreen(
              baselineId: s.pathParameters['baselineId']!,
            ),
          ),
          GoRoute(
            path: 'activity/:activityId',
            builder: (_, s) => VoiceRefinementActivityScreen(
              activityId: s.pathParameters['activityId']!,
              planId: s.uri.queryParameters['planId'] ?? '',
              day: int.tryParse(s.uri.queryParameters['day'] ?? '1') ?? 1,
              isCheckpoint: s.uri.queryParameters['checkpoint'] == '1',
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/app/locked',
        builder: (_, s) =>
            LockedScreen(programId: s.uri.queryParameters['program']),
      ),
      // Each branch keeps its own Navigator alive inside an IndexedStack, so
      // scroll position / form state / sub-navigation is preserved when you
      // switch tabs. Branch switches are instant (no transition); pushing a
      // detail route WITHIN a branch keeps the default slide animation.
      //
      // Branch order MUST stay in sync with `appShellBranchRoots` in
      // dashboard_nav.dart, which AppShell uses to map a tab -> branch index.
      StatefulShellRoute.indexedStack(
        builder: (_, state, navigationShell) => AppShell(
          navigationShell: navigationShell,
          matchedLocation: state.matchedLocation,
        ),
        branches: [
          // 0 — Dashboard (home)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/dashboard',
                builder: (_, __) => const DashboardLearnerScreen(),
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
          // 8 — Suspended
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/app/suspended',
                  builder: (_, __) => const SuspendedScreen()),
            ],
          ),
          // 9 — Admin unavailable
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
        !loc.startsWith('/app/onboarding')) {
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
