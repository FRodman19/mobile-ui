import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2ProgressBar extends StatelessWidget {
  final double value; // 0.0 to 1.0

  const DSV2ProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: DSV2Theme.grey,
      valueColor: const AlwaysStoppedAnimation<Color>(DSV2Theme.teal),
      minHeight: 8,
      borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
    );
  }
}

class DSV2CircularProgress extends StatelessWidget {
  const DSV2CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(DSV2Theme.teal),
    );
  }
}
