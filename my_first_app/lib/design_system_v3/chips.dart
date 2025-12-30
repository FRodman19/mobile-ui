import 'package:flutter/material.dart';

import 'theme_v3.dart';

class DSV3Chip extends StatelessWidget {
  const DSV3Chip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? DSV3Colors.teal500
              : (isDark ? DSV3Colors.surfaceDark : DSV3Colors.neutral100),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(
                  color: isDark ? DSV3Colors.neutral500 : DSV3Colors.neutral200,
                ),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isSelected
                      ? DSV3Colors.white
                      : (isDark ? DSV3Colors.neutral200 : DSV3Colors.black),
                ),
          ),
        ),
      ),
    );
  }
}
