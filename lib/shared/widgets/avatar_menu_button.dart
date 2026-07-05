import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../models/app_profile.dart';
import 'koras_avatar.dart';

/// Header trailing avatar. Tapping it opens a menu with Inbox and Profile
/// (redesign: Profile hosts feedback/progress/voice score + Settings).
class AvatarMenuButton extends StatelessWidget {
  const AvatarMenuButton({super.key, required this.profile});
  final AppProfile profile;

  @override
  Widget build(BuildContext context) {
    final name = profile.fullName?.trim().isNotEmpty == true
        ? profile.fullName!
        : profile.email;
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: KorasAvatar(
        name: name,
        size: 36,
        onTap: () => _openMenu(context),
      ),
    );
  }

  Future<void> _openMenu(BuildContext context) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(LucideIcons.inbox),
              title: const Text('Inbox'),
              onTap: () => Navigator.of(context).pop('inbox'),
            ),
            ListTile(
              leading: const Icon(LucideIcons.circleUser),
              title: const Text('Profile'),
              onTap: () => Navigator.of(context).pop('profile'),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || selected == null) return;
    switch (selected) {
      case 'inbox':
        context.push('/app/inbox');
      case 'profile':
        context.push('/app/profile');
    }
  }
}
