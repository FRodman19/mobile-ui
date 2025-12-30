import 'package:flutter/material.dart';

import '../foundation/gol_colors.dart';

class GOLLinearProgress extends StatelessWidget {
  final double? value;

  const GOLLinearProgress({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(9999),
      child: LinearProgressIndicator(
        minHeight: 4,
        value: value,
        backgroundColor: colors.backgroundTertiary,
        valueColor: AlwaysStoppedAnimation<Color>(colors.interactivePrimary),
      ),
    );
  }
}

class GOLCircularProgress extends StatelessWidget {
  final double size;
  final double? value;

  const GOLCircularProgress({
    super.key,
    this.size = 48,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: 4,
        backgroundColor: colors.backgroundTertiary,
        valueColor: AlwaysStoppedAnimation<Color>(colors.interactivePrimary),
      ),
    );
  }
}
