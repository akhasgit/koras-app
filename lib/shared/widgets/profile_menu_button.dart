import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../features/auth/data/auth_repository.dart';
import '../models/app_profile.dart';

/// App-bar profile menu — settings + sign-out.
class ProfileMenuButton extends ConsumerWidget {
  const ProfileMenuButton({super.key, required this.profile});
  final AppProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      icon: const Icon(LucideIcons.circleUser),
      onSelected: (value) async {
        switch (value) {
          case 'settings':
            context.go('/app/settings');
          case 'signout':
            await ref.read(authRepositoryProvider).signOut();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child:
              Text(profile.email, style: Theme.of(context).textTheme.bodySmall),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(value: 'settings', child: Text('Settings')),
        const PopupMenuItem(value: 'signout', child: Text('Sign out')),
      ],
    );
  }
}
