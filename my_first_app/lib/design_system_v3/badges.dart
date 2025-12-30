import 'package:flutter/material.dart';

import 'spacing_v3.dart';
import 'theme_v3.dart';

enum DSV3BadgeVariant { neutral, success, error, warning, info }

class DSV3Badge extends StatelessWidget {
  const DSV3Badge({
    super.key,
    required this.label,
    this.variant = DSV3BadgeVariant.neutral,
    this.child,
  });

  final String label;
  final DSV3BadgeVariant variant;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _background(),
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: _foreground(),
            ),
      ),
    );

    if (child == null) {
      return badge;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child!,
        Positioned(right: -6, top: -6, child: badge),
      ],
    );
  }

  Color _background() {
    switch (variant) {
      case DSV3BadgeVariant.success:
        return DSV3Colors.premiumGreenSoft;
      case DSV3BadgeVariant.error:
        return DSV3Colors.premiumRedSoft;
      case DSV3BadgeVariant.warning:
        return DSV3Colors.premiumAmberSoft;
      case DSV3BadgeVariant.info:
        return DSV3Colors.premiumBlueSoft;
      case DSV3BadgeVariant.neutral:
        return DSV3Colors.neutral200;
    }
  }

  Color _foreground() {
    switch (variant) {
      case DSV3BadgeVariant.success:
        return DSV3Colors.premiumGreen;
      case DSV3BadgeVariant.error:
        return DSV3Colors.premiumRed;
      case DSV3BadgeVariant.warning:
        return DSV3Colors.premiumAmber;
      case DSV3BadgeVariant.info:
        return DSV3Colors.premiumBlue;
      case DSV3BadgeVariant.neutral:
        return DSV3Colors.black;
    }
  }
}
