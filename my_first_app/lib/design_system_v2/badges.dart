// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2Badge extends StatelessWidget {
  final String label;
  final bool isError;
  final Widget? child;

  const DSV2Badge({
    super.key,
    required this.label,
    this.isError = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (child != null) {
      return Badge(
        backgroundColor: isError
            ? DSV2Theme.elegantRed
            : DSV2Theme.elegantGreen,
        label: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: DSV2Theme.white,
            fontSize: 10,
          ),
        ),
        child: child,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isError ? DSV2Theme.elegantRed : DSV2Theme.elegantGreen,
        borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: DSV2Theme.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
