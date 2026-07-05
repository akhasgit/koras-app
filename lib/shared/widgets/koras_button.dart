import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

enum _KorasButtonVariant { primary, secondary, ghost, cream }

/// Brand button with a Framer-Motion-like press dip (1.0→0.97).
class KorasButton extends StatefulWidget {
  const KorasButton._(
    this._variant, {
    required this.onPressed,
    required this.child,
    this.loading = false,
    super.key,
  });

  factory KorasButton.primary({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    bool loading = false,
  }) =>
      KorasButton._(_KorasButtonVariant.primary,
          key: key, onPressed: onPressed, loading: loading, child: child);

  factory KorasButton.secondary({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    bool loading = false,
  }) =>
      KorasButton._(_KorasButtonVariant.secondary,
          key: key, onPressed: onPressed, loading: loading, child: child);

  factory KorasButton.ghost({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    bool loading = false,
  }) =>
      KorasButton._(_KorasButtonVariant.ghost,
          key: key, onPressed: onPressed, loading: loading, child: child);

  factory KorasButton.cream({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    bool loading = false,
  }) =>
      KorasButton._(_KorasButtonVariant.cream,
          key: key, onPressed: onPressed, loading: loading, child: child);

  final _KorasButtonVariant _variant;
  final VoidCallback? onPressed;
  final Widget child;
  final bool loading;

  @override
  State<KorasButton> createState() => _KorasButtonState();
}

class _KorasButtonState extends State<KorasButton> {
  bool _pressed = false;
  bool get _enabled => widget.onPressed != null && !widget.loading;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final child = widget.loading
        ? const SizedBox(
            height: 18,
            width: 18,
            child:
                CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
          )
        : widget.child;
    final onPressed = _enabled ? widget.onPressed : null;

    return GestureDetector(
      onTapDown: _enabled ? (_) => setState(() => _pressed = true) : null,
      onTapUp: _enabled ? (_) => setState(() => _pressed = false) : null,
      onTapCancel: _enabled ? () => setState(() => _pressed = false) : null,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: switch (widget._variant) {
          _KorasButtonVariant.primary =>
            FilledButton(onPressed: onPressed, child: child),
          _KorasButtonVariant.secondary => OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: k.line),
                shape: const StadiumBorder(),
              ),
              child: child,
            ),
          _KorasButtonVariant.ghost =>
            TextButton(onPressed: onPressed, child: child),
          _KorasButtonVariant.cream => FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                backgroundColor: k.paperWarm,
                foregroundColor: k.ink900,
                shape: const StadiumBorder(),
              ),
              child: child,
            ),
        },
      ),
    );
  }
}
