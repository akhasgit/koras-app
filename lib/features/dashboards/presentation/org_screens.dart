import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../shared/providers/current_org.dart';
import '../../../shared/widgets/feature_placeholder.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/org_repository.dart';

/// Org-admin overview (no bottom nav — drawer + sub-nav). See 20.
class DashboardOrgScreen extends ConsumerWidget {
  const DashboardOrgScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final org = ref.watch(currentOrgProvider);
    final members = ref.watch(orgMembersProvider).valueOrNull;
    final groups = ref.watch(orgGroupsProvider).valueOrNull;
    return KorasScreen(
      title: 'Organization',
      children: [
        const SizedBox(height: 16),
        org.when(
          loading: () => const KorasLoading(),
          error: (e, _) => KorasError(message: errorToMessage(e)),
          data: (o) => o == null
              ? const FeaturePlaceholder(title: 'No organization')
              : KorasCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(o.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text('Type: ${o.type.name} · Status: ${o.status.name}'),
                    ],
                  ),
                ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: 'Members',
                value: members?.length,
                icon: LucideIcons.users,
                onTap: () => context.go('/app/org/users'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                label: 'Classes',
                value: groups?.length,
                icon: LucideIcons.layoutGrid,
                onTap: () => context.go('/app/org/groups'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        KorasButton.secondary(
          onPressed: () => context.go('/app/org/settings'),
          child: const Text('Organization settings'),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final int? value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return KorasCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(height: 8),
          Text(value?.toString() ?? '—',
              style: Theme.of(context).textTheme.headlineSmall),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class OrgUsersScreen extends ConsumerWidget {
  const OrgUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final members = ref.watch(orgMembersProvider);
    return KorasScreen(
      title: 'Users',
      child: members.when(
        loading: () => const KorasLoading(),
        error: (e, _) => KorasError(message: errorToMessage(e)),
        data: (list) => list.isEmpty
            ? const FeaturePlaceholder(title: 'No users yet')
            : Column(
                children: [
                  const SizedBox(height: 8),
                  for (final m in list) ...[
                    KorasCard(
                      onTap: () =>
                          context.go('/app/org/users/${m.id}'),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(m.fullName ?? m.email),
                                Text(m.role.name,
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
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
              ),
      ),
    );
  }
}

class OrgUserDetailScreen extends StatelessWidget {
  const OrgUserDetailScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) => const FeaturePlaceholder(title: 'User');
}

class OrgGroupsScreen extends ConsumerWidget {
  const OrgGroupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groups = ref.watch(orgGroupsProvider);
    return KorasScreen(
      title: 'Classes',
      child: groups.when(
        loading: () => const KorasLoading(),
        error: (e, _) => KorasError(message: errorToMessage(e)),
        data: (list) => list.isEmpty
            ? const FeaturePlaceholder(title: 'No classes yet')
            : Column(
                children: [
                  const SizedBox(height: 8),
                  for (final g in list) ...[
                    KorasCard(
                      onTap: () => context.go('/app/group/${g.id}'),
                      child: Text(g.name),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
      ),
    );
  }
}

class OrgSettingsScreen extends StatelessWidget {
  const OrgSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const FeaturePlaceholder(title: 'Organization settings');
}
