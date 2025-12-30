// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2Tooltip extends StatelessWidget {
  final String message;
  final Widget child;

  const DSV2Tooltip({super.key, required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: DSV2Theme.white,
      ),
      decoration: BoxDecoration(
        color: DSV2Theme.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
      ),
      child: child,
    );
  }
}
