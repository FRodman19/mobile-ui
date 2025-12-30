import 'package:flutter/material.dart';

import 'spacing_v3.dart';
import 'theme_v3.dart';

class DSV3NavItem {
  const DSV3NavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

class DSV3BottomNavBar extends StatelessWidget {
  const DSV3BottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<DSV3NavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark ? DSV3Colors.surfaceDark : DSV3Colors.white;
    final inactive = isDark ? DSV3Colors.neutral300 : DSV3Colors.neutral500;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DSV3Spacing.horizontalPadding,
        vertical: DSV3Spacing.verticalPadding,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isActive = index == currentIndex;

          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
                borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      size: 22,
                      color: isActive ? DSV3Colors.orange500 : inactive,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color:
                                isActive ? DSV3Colors.orange500 : inactive,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class DSV3Sidebar extends StatelessWidget {
  const DSV3Sidebar({super.key, required this.items});

  final List<DSV3NavItem> items;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark ? DSV3Colors.surfaceDark : DSV3Colors.surfaceLight;

    return Container(
      width: 220,
      padding: const EdgeInsets.all(DSV3Spacing.lg),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Icon(item.icon, size: 18),
                    const SizedBox(width: 8),
                    Text(item.label),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
