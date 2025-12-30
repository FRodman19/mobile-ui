import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2Card extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;

  const DSV2Card({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(DSV2Theme.horizontalPadding),
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? DSV2Theme.white,
        borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
        // No shadow, no outline
      ),
      padding: padding,
      child: child,
    );
  }
}
