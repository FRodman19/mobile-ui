import 'package:flutter/material.dart';

class DSV2Divider extends StatelessWidget {
  final bool vertical;

  const DSV2Divider({super.key, this.vertical = false});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).dividerTheme.color;
    if (vertical) {
      return VerticalDivider(
        color: color,
        thickness: 1,
        width: 32, // Minimal spacing
      );
    }
    return Divider(
      color: color,
      thickness: 1,
      height: 32, // Minimal spacing
    );
  }
}
