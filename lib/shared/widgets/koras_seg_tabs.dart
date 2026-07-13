import 'package:flutter/material.dart';

import '../../core/theme/koras_theme.dart';

/// Segmented pill tabs on a strong glass track — active segment filled ember.
/// Port of `SegTabs` in `handoffs/koras-mobile-handoff/koras-ui.jsx`.
class KorasSegTabs extends StatelessWidget {
  const KorasSegTabs({
    super.key,
    required this.tabs,
    required this.activeIndex,
    required this.onSelect,
  });

  final List<String> tabs;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: k.glassFillStrong,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: k.glassBorder, width: 0.75),
      ),
      child: Row(
        children: [
          for (var i = 0; i < tabs.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () => onSelect(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(vertical: 9, horizontal: 6),
                  decoration: BoxDecoration(
                    color: i == activeIndex ? k.ember : Colors.transparent,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    tabs[i],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: i == activeIndex ? k.onAccent : k.ink700,
                        ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
