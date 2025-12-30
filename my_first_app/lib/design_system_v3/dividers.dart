import 'package:flutter/material.dart';

import 'theme_v3.dart';

class DSV3Divider extends StatelessWidget {
  const DSV3Divider({super.key, this.vertical = false, this.length = 24});

  final bool vertical;
  final double length;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? DSV3Colors.neutral500
        : DSV3Colors.neutral200;

    return SizedBox(
      width: vertical ? 1 : length,
      height: vertical ? length : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}
