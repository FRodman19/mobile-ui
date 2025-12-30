import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'spacing_v3.dart';
import 'theme_v3.dart';

class DSV3Chip extends StatelessWidget {
  const DSV3Chip({
    super.key,
    required this.label,
    this.onDeleted,
  });

  final String label;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark ? DSV3Colors.surfaceDark : DSV3Colors.surfaceLight;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelMedium),
          if (onDeleted != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onDeleted,
              child: const Icon(Iconsax.close_circle, size: 16),
            ),
          ],
        ],
      ),
    );
  }
}
