import 'package:flutter/material.dart';

import 'spacing_v3.dart';
import 'theme_v3.dart';

class DSV3Divider extends StatelessWidget {
  const DSV3Divider({
    super.key,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
  });

  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Divider(
      height: height,
      thickness: thickness ?? 1,
      indent: indent,
      endIndent: endIndent,
      color: isDark ? DSV3Colors.neutral500 : DSV3Colors.neutral200,
    );
  }
}

class DSV3VerticalDivider extends StatelessWidget {
  const DSV3VerticalDivider({
    super.key,
    this.width,
    this.thickness,
    this.indent,
    this.endIndent,
  });

  final double? width;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return VerticalDivider(
      width: width,
      thickness: thickness ?? 1,
      indent: indent,
      endIndent: endIndent,
      color: isDark ? DSV3Colors.neutral500 : DSV3Colors.neutral200,
    );
  }
}
