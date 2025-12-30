import 'package:flutter/material.dart';

class DSV3Tooltip extends StatelessWidget {
  const DSV3Tooltip({super.key, required this.message, required this.child});

  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: child,
    );
  }
}
