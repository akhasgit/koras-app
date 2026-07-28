import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../navigation/koras_back.dart';
import 'glass/mesh_background.dart';
import 'koras_header.dart';
import 'koras_section.dart';

/// Standard screen shell — mesh-gradient backdrop, glass back-button header
/// with an italic serif title, centred body (Liquid Glass redesign).
///
/// Screens inside the tab shell and pushed full-screen routes both use this;
/// scrollable bodies get extra bottom padding so content clears the floating
/// tab bar / home indicator.
class KorasScreen extends StatelessWidget {
  const KorasScreen({
    super.key,
    this.title,
    this.kicker,
    this.actions,
    this.children = const [],
    this.child,
    this.scrollable = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String? title;
  final String? kicker;
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
    final content = KorasSection(
      padding: EdgeInsets.fromLTRB(20, 8, 20, scrollable ? 110 : 16),
      child: body,
    );

    final showBack = korasShouldShowBack(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MeshBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            bottom: !scrollable,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: KorasHeader(
                      title: title!,
                      kicker: kicker,
                      onBack: showBack ? () => korasBack(context) : null,
                      trailing: actions == null || actions!.isEmpty
                          ? null
                          : Row(mainAxisSize: MainAxisSize.min,
                              children: actions!),
                    ),
                  ),
                Expanded(
                  child: scrollable
                      ? SingleChildScrollView(child: content)
                      : content,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
