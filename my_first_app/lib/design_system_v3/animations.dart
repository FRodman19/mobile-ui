import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'theme_v3.dart';

class DSV3SuccessIcon extends StatelessWidget {
  const DSV3SuccessIcon({super.key, this.size = 64});

  final double size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.7, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Icon(Icons.check_circle, color: DSV3Colors.premiumGreen, size: size),
    );
  }
}

class DSV3ErrorIcon extends StatelessWidget {
  const DSV3ErrorIcon({super.key, this.size = 64});

  final double size;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        final wobble = math.sin(value * math.pi * 2) * 0.06;
        return Transform.rotate(angle: wobble, child: child);
      },
      child: Icon(Icons.error, color: DSV3Colors.premiumRed, size: size),
    );
  }
}
