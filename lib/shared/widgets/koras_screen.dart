import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';
import 'koras_section.dart';

/// Standard screen shell — `Scaffold` on cream, optional app bar, centred body.
class KorasScreen extends StatelessWidget {
  const KorasScreen({
    super.key,
    this.title,
    this.actions,
    this.children = const [],
    this.child,
    this.scrollable = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String? title;
  final List<Widget>? actions;
  final List<Widget> children;
  final Widget? child;
  final bool scrollable;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final body = child ??
        Column(
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        );
    final content = KorasSection(child: body);
    return Scaffold(
      backgroundColor: context.koras.cream,
      appBar:
          title == null ? null : AppBar(title: Text(title!), actions: actions),
      body: SafeArea(
        child: scrollable ? SingleChildScrollView(child: content) : content,
      ),
    );
  }
}
