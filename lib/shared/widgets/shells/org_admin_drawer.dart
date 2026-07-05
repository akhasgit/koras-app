import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/theme/koras_theme.dart';

/// Org-admin navigation drawer (Overview / Users / Groups / Settings).
class OrgAdminDrawer extends StatelessWidget {
  const OrgAdminDrawer({super.key, required this.activePath});
  final String activePath;

  static const _items = [
    (
      label: 'Overview',
      route: '/app/org',
      icon: LucideIcons.layoutDashboard
    ),
    (
      label: 'Users',
      route: '/app/org/users',
      icon: LucideIcons.users
    ),
    (
      label: 'Groups',
      route: '/app/org/groups',
      icon: LucideIcons.boxes
    ),
    (
      label: 'Settings',
      route: '/app/org/settings',
      icon: LucideIcons.settings
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Drawer(
      backgroundColor: k.cream,
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Organization',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            for (final item in _items)
              ListTile(
                leading: Icon(item.icon),
                title: Text(item.label),
                selected: activePath == item.route,
                selectedColor: k.ember,
                onTap: () {
                  Navigator.of(context).pop();
                  context.go(item.route);
                },
              ),
          ],
        ),
      ),
    );
  }
}
