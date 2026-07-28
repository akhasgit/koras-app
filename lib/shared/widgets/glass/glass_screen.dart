import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../navigation/koras_back.dart';
import '../koras_header.dart';
import 'mesh_background.dart';

/// Full-screen scaffold for pages that live outside the tab shell (program
/// runtimes, assess, profile, inbox…): mesh backdrop + safe area + an
/// optional glass back-button header, with the page content below.
///
/// When [scrollable] is true the body is wrapped in a padded [ListView]
/// (bottom padding keeps content clear of the home indicator).
class GlassScreen extends StatelessWidget {
  const GlassScreen({
    super.key,
    required this.child,
    this.title,
    this.kicker,
    this.subtitle,
    this.trailing,
    this.showBack = true,
    this.onBack,
    this.scrollable = true,
    this.padding = const EdgeInsets.fromLTRB(20, 4, 20, 32),
  });

  final Widget child;
  final String? title;
  final String? kicker;
  final String? subtitle;
  final Widget? trailing;
  final bool showBack;
  final VoidCallback? onBack;
  final bool scrollable;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    VoidCallback? back;
    if (showBack) {
      back = onBack ?? () => korasBack(context);
    }

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null) ...[
          const SizedBox(height: 8),
          KorasHeader(
            title: title!,
            kicker: kicker,
            subtitle: subtitle,
            onBack: back,
            trailing: trailing,
          ),
        ],
        Expanded(
          child: scrollable
              ? ListView(padding: padding, children: [child])
              : Padding(padding: padding, child: child),
        ),
      ],
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MeshBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(bottom: false, child: body),
        ),
      ),
    );
  }
}
