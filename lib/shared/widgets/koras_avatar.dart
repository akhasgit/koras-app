import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Circular initials avatar. Port of `Avatar` in
/// `handoffs/koras-mobile-handoff/koras-ui.jsx`. When [onTap] is set it becomes
/// tappable (used as the header entry to the Inbox/Profile menu).
class KorasAvatar extends StatelessWidget {
  const KorasAvatar({
    super.key,
    required this.name,
    this.size = 40,
    this.ring = false,
    this.onTap,
  });

  final String name;
  final double size;
  final bool ring;
  final VoidCallback? onTap;

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+'));
    final letters = parts
        .where((p) => p.isNotEmpty)
        .take(2)
        .map((p) => p[0].toUpperCase())
        .join();
    return letters.isEmpty ? '?' : letters;
  }

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    // Deterministic tone from the name.
    final palette = [k.ember, k.accentDeep, k.success, k.warn];
    final tone = palette[(name.isEmpty ? 0 : name.codeUnitAt(0) + name.length) %
        palette.length];

    final avatar = Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.18),
        shape: BoxShape.circle,
        border: ring ? Border.all(color: tone, width: 2) : null,
      ),
      child: Text(
        _initials,
        style: TextStyle(
          color: tone,
          fontWeight: FontWeight.w700,
          fontSize: size * 0.36,
        ),
      ),
    );

    if (onTap == null) return avatar;
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: avatar,
    );
  }
}
