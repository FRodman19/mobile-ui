import 'package:flutter/material.dart';

import 'spacing_v3.dart';
import 'theme_v3.dart';

class DSV3Slider extends StatelessWidget {
  const DSV3Slider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 4,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: DSV3Spacing.componentRadius,
        ),
        overlayShape: RoundSliderOverlayShape(
          overlayRadius: DSV3Spacing.componentRadius * 2,
        ),
        activeTrackColor: DSV3Colors.teal500,
        inactiveTrackColor: DSV3Colors.neutral200,
        thumbColor: DSV3Colors.teal500,
        overlayColor: DSV3Colors.teal500.withOpacity(0.2),
        valueIndicatorColor: DSV3Colors.teal500,
      ),
      child: Slider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
        label: label,
        inactiveColor: DSV3Colors.neutral200,
      ),
    );
  }
}
