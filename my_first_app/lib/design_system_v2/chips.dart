import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2Chip extends StatelessWidget {
  final String label;
  final VoidCallback? onDelete;
  final Color? backgroundColor;
  final Color? textColor;

  const DSV2Chip({
    super.key,
    required this.label,
    this.onDelete,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultBg = isDark ? DSV2Theme.greyDark : DSV2Theme.grey;
    final defaultText = Theme.of(context).colorScheme.onSurface;

    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
        side: BorderSide.none, // No outline
      ),
      backgroundColor: backgroundColor ?? defaultBg,
      deleteIconColor: textColor ?? defaultText,
      onDeleted: onDelete,
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: textColor ?? defaultText,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0, // No shadow
    );
  }
}
