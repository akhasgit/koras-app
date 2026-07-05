import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// A single tab entry in the [KorasTabBar].
class KorasTabItem {
  const KorasTabItem(this.icon, this.label);
  final IconData icon;
  final String label;
}

/// Floating "Liquid Glass" bottom tab bar with an optional centre FAB.
/// Port of `TabBar` in `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasTabBar extends StatelessWidget {
  const KorasTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onSelect,
    this.fabIcon,
    this.onFabTap,
  });

  final List<KorasTabItem> tabs;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final IconData? fabIcon;
  final VoidCallback? onFabTap;

  static const double _barHeight = 66;
  static const double _hInset = 8; // Container inner horizontal padding.
  static const double _fabSlot = 70; // Fab (50) + 10 padding each side.

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final hasFab = fabIcon != null;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final n = tabs.length;

    // How many tabs sit to the left of the centre FAB.
    final leftCount = hasFab ? (n / 2).ceil() : n;

    final left = <Widget>[];
    final right = <Widget>[];
    for (var i = 0; i < n; i++) {
      final tab = Expanded(
        child: _Tab(
          item: tabs[i],
          active: i == selectedIndex,
          onTap: () => onSelect(i),
        ),
      );
      if (i < leftCount) {
        left.add(tab);
      } else {
        right.add(tab);
      }
    }

    final bar = ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: _barHeight,
          padding: const EdgeInsets.symmetric(horizontal: _hInset),
          decoration: BoxDecoration(
            color: k.glassFill,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: k.glassBorder, width: 0.75),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final innerW = constraints.maxWidth;
              final fabW = hasFab ? _fabSlot : 0.0;
              final tabW = (innerW - fabW) / n;

              // X offset (within the inner area) of the selected tab cell.
              double selX;
              final sel = selectedIndex.clamp(0, n - 1);
              if (sel < leftCount) {
                selX = sel * tabW;
              } else {
                selX = leftCount * tabW + fabW + (sel - leftCount) * tabW;
              }

              const pillInset = 6.0;
              const pillH = 50.0;

              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 340),
                    curve: Curves.easeOutCubic,
                    left: selX + pillInset,
                    top: (_barHeight - pillH) / 2,
                    width: math.max(0, tabW - pillInset * 2),
                    height: pillH,
                    child: const _SelectorPill(),
                  ),
                  Row(
                    children: [
                      ...left,
                      if (hasFab) _Fab(icon: fabIcon!, onTap: onFabTap),
                      ...right,
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );

    // Sit lower — hug the bottom safe-area more tightly than before.
    final bottomPad = math.max(6.0, bottomInset - 6);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPad),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF141428).withValues(alpha: 0.12),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: bar,
      ),
    );
  }
}

/// The sliding "liquid glass" highlight that sits behind the active tab.
class _SelectorPill extends StatelessWidget {
  const _SelectorPill();

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            k.glassSheen.withValues(alpha: 0.9),
            k.ember.withValues(alpha: 0.16),
          ],
        ),
        border: Border.all(color: k.ember.withValues(alpha: 0.28), width: 0.75),
        boxShadow: [
          BoxShadow(
            color: k.ember.withValues(alpha: 0.18),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({required this.item, required this.active, required this.onTap});
  final KorasTabItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final color = active ? k.ember : k.muted;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: 23, color: color),
          const SizedBox(height: 3),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              color: color,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _Fab extends StatelessWidget {
  const _Fab({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: k.ember,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: k.accentDeep.withValues(alpha: 0.5),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(icon, size: 24, color: k.onAccent),
        ),
      ),
    );
  }
}
