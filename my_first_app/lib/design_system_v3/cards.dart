import 'package:flutter/material.dart';

import 'spacing_v3.dart';
import 'theme_v3.dart';

enum DSV3CardTone { standard, elevated }

class DSV3Card extends StatelessWidget {
  const DSV3Card({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.tone = DSV3CardTone.standard,
  });

  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final DSV3CardTone tone;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? DSV3Colors.surfaceDark : DSV3Colors.surfaceLight;
    final elevated = isDark ? DSV3Colors.surfaceDark : DSV3Colors.white;
    final background = tone == DSV3CardTone.elevated ? elevated : base;

    final widget = Material(
      color: background,
      borderRadius: BorderRadius.circular(DSV3Spacing.cardRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DSV3Spacing.cardRadius),
        highlightColor: DSV3Colors.teal500.withOpacity(0.08),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(DSV3Spacing.lg),
          child: child,
        ),
      ),
    );

    if (tone == DSV3CardTone.elevated) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DSV3Spacing.cardRadius),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.08),
              blurRadius: isDark ? 16 : 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: widget,
      );
    }

    return widget;
  }
}
