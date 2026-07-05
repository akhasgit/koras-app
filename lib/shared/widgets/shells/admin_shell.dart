import 'package:flutter/material.dart';

/// Present for tree-completeness only. `_topLevelRedirect` never routes a real
/// navigation into this shell on mobile; super-admins land on
/// `/app/admin-unavailable`. The panel is web-only in V1 (see 18).
class AdminShell extends StatelessWidget {
  const AdminShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(body: child);
}
