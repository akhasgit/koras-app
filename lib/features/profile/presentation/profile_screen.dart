import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/glass/mesh_background.dart';
import '../../../shared/widgets/koras_avatar.dart';
import '../../auth/data/auth_repository.dart';

/// Profile page (reached from the header avatar menu). V1 scaffolding — the
/// feedback / progress / voice-score content is filled in during the
/// page-by-page screen pass (see MOBILE_LIQUID_GLASS_REDESIGN_PLAN.md §3.6b).
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    final name = profile?.fullName?.trim().isNotEmpty == true
        ? profile!.fullName!
        : (profile?.email ?? 'You');

    return Stack(
      children: [
        const Positioned.fill(child: MeshBackground()),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: const Text('Profile'),
          ),
          body: SafeArea(
            top: false,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              children: [
                GlassCard(
                  child: Row(
                    children: [
                      KorasAvatar(name: name, size: 56),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style:
                                    Theme.of(context).textTheme.titleMedium),
                            if (profile?.email != null)
                              Text(profile!.email,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: k.muted)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                GlassCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(LucideIcons.settings),
                        title: const Text('Settings'),
                        trailing: const Icon(LucideIcons.chevronRight, size: 18),
                        onTap: () => context.go('/app/settings'),
                      ),
                      Divider(height: 1, color: k.line),
                      ListTile(
                        leading: Icon(LucideIcons.logOut, color: k.danger),
                        title: Text('Sign out',
                            style: TextStyle(color: k.danger)),
                        onTap: () =>
                            ref.read(authRepositoryProvider).signOut(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your voice',
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 8),
                      Text(
                        'Feedback, progress and your voice score will live here.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: k.muted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
