import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../shared/providers/managed_groups.dart';
import '../../../shared/widgets/feature_placeholder.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../../../shared/widgets/koras_text_field.dart';
import '../../learner_insights/data/learner_insights_repository.dart';
import '../../learner_insights/presentation/widgets/progress_card.dart';
import '../data/groups_repository.dart';

/// Manager home — list of owned classes.
class DashboardGroupScreen extends ConsumerWidget {
  const DashboardGroupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(managedGroupsProvider);
    return KorasScreen(
      title: 'Classes',
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.plus),
          onPressed: () => context.go('/app/group/new'),
        ),
      ],
      child: groups.when(
        loading: () => const KorasLoading(),
        error: (e, _) => KorasError(message: errorToMessage(e)),
        data: (items) {
          if (items.isEmpty) {
            return const FeaturePlaceholder(
              title: 'No classes yet',
              note: 'Create a class to start inviting students.',
            );
          }
          return Column(
            children: [
              const SizedBox(height: 8),
              for (final g in items) ...[
                KorasCard(
                  onTap: () => context.go('/app/group/${g.id}'),
                  child: Row(
                    children: [
                      const Icon(LucideIcons.users),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(g.name,
                                style: Theme.of(context).textTheme.titleMedium),
                            if (g.description != null)
                              Text(g.description!,
                                  style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      const Icon(LucideIcons.chevronRight, size: 18),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ],
          );
        },
      ),
    );
  }
}

class NewGroupScreen extends HookConsumerWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = useTextEditingController();
    final description = useTextEditingController();
    final busy = useState(false);
    final error = useState<String?>(null);

    Future<void> create() async {
      if (name.text.trim().isEmpty) {
        error.value = 'Give your class a name.';
        return;
      }
      busy.value = true;
      error.value = null;
      try {
        final orgId = await ref.read(currentOrgIdProvider.future);
        if (orgId == null) {
          throw const PermissionError('You must belong to an organization.');
        }
        final group = await ref.read(groupsRepositoryProvider).create(
              orgId: orgId,
              name: name.text.trim(),
              description: description.text.trim().isEmpty
                  ? null
                  : description.text.trim(),
            );
        ref.invalidate(managedGroupsProvider);
        if (context.mounted) {
          context.go('/app/group/${group.id}');
        }
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        busy.value = false;
      }
    }

    return KorasScreen(
      title: 'New class',
      children: [
        const SizedBox(height: 12),
        KorasTextField(controller: name, label: 'Class name'),
        const SizedBox(height: 12),
        KorasTextField(
          controller: description,
          label: 'Description (optional)',
          maxLines: 3,
        ),
        if (error.value != null) ...[
          const SizedBox(height: 12),
          Text(error.value!, style: TextStyle(color: context.koras.danger)),
        ],
        const SizedBox(height: 20),
        KorasButton.primary(
          onPressed: busy.value ? null : create,
          loading: busy.value,
          child: const Text('Create class'),
        ),
      ],
    );
  }
}

class ManagerMyVoiceScreen extends StatelessWidget {
  const ManagerMyVoiceScreen({super.key});
  @override
  Widget build(BuildContext context) => const FeaturePlaceholder(
        title: 'My voice',
        note: 'Your own practice as a class manager.',
      );
}

class GroupDetailScreen extends ConsumerWidget {
  const GroupDetailScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final group = ref.watch(groupByIdProvider(id));
    final students = ref.watch(groupStudentsProvider(id));
    return KorasScreen(
      title: 'Class',
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.settings),
          onPressed: () => context.go('/app/group/$id/settings'),
        ),
      ],
      children: [
        const SizedBox(height: 8),
        group.when(
          loading: () => const KorasLoading(),
          error: (e, _) => KorasError(message: errorToMessage(e)),
          data: (g) => g == null
              ? const Text('Class not found.')
              : KorasCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(g.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      if (g.description != null) ...[
                        const SizedBox(height: 6),
                        Text(g.description!),
                      ],
                    ],
                  ),
                ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: KorasButton.secondary(
                onPressed: () =>
                    context.go('/app/group/$id/analytics'),
                child: const Text('Analytics'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: KorasButton.secondary(
                onPressed: () =>
                    context.go('/app/group/$id/students'),
                child: const Text('Students'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('Roster', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        students.when(
          loading: () => const KorasLoading(),
          error: (e, _) => KorasError(message: errorToMessage(e)),
          data: (list) => list.isEmpty
              ? const FeaturePlaceholder(
                  title: 'No students yet',
                  note: 'Invite students to this class to see them here.',
                )
              : Column(
                  children: [
                    for (final s in list) ...[
                      KorasCard(
                        onTap: () => context
                            .go('/app/group/$id/students/${s.id}'),
                        child: Row(
                          children: [
                            const Icon(LucideIcons.user, size: 18),
                            const SizedBox(width: 12),
                            Expanded(child: Text(s.fullName ?? s.email)),
                            const Icon(LucideIcons.chevronRight, size: 18),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ],
                ),
        ),
      ],
    );
  }
}

class GroupAnalyticsScreen extends StatelessWidget {
  const GroupAnalyticsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) =>
      const FeaturePlaceholder(title: 'Class analytics');
}

class GroupSettingsScreen extends StatelessWidget {
  const GroupSettingsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) =>
      const FeaturePlaceholder(title: 'Class settings');
}

class GroupStudentsScreen extends ConsumerWidget {
  const GroupStudentsScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(groupStudentsProvider(id));
    return KorasScreen(
      title: 'Students',
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.upload),
          onPressed: () =>
              context.go('/app/group/$id/students/bulk-import'),
        ),
      ],
      child: students.when(
        loading: () => const KorasLoading(),
        error: (e, _) => KorasError(message: errorToMessage(e)),
        data: (list) => list.isEmpty
            ? const FeaturePlaceholder(title: 'No students yet')
            : Column(
                children: [
                  const SizedBox(height: 8),
                  for (final s in list) ...[
                    KorasCard(
                      onTap: () => context
                          .go('/app/group/$id/students/${s.id}'),
                      child: Text(s.fullName ?? s.email),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
      ),
    );
  }
}

class BulkImportScreen extends StatelessWidget {
  const BulkImportScreen({super.key, this.groupId});
  final String? groupId;
  @override
  Widget build(BuildContext context) =>
      const FeaturePlaceholder(title: 'Bulk import');
}

/// Teacher view of a student — read-only insights + plan.
class StudentDetailScreen extends ConsumerWidget {
  const StudentDetailScreen({
    super.key,
    required this.groupId,
    required this.userId,
  });
  final String groupId;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insights = ref.watch(studentInsightsProvider(userId));
    return KorasScreen(
      title: 'Student',
      child: insights.when(
        loading: () => const KorasLoading(),
        error: (e, _) => KorasError(message: errorToMessage(e)),
        data: (data) => data == null
            ? const FeaturePlaceholder(title: 'No data yet')
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ProgressCard(insights: data),
              ),
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const FeaturePlaceholder(title: 'Reports');
}
