// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class DSV2Slider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;

  const DSV2Slider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
  });

  @override
  Widget build(BuildContext context) {
    // Slider Theme is applied globally via Theme.of(context)
    return Slider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
    );
  }
}
