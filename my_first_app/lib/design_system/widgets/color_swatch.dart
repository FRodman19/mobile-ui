import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../theme/spacing.dart';

class ColorSwatch extends StatelessWidget {
  final Color color;
  final String name;
  final String hexCode;
  final bool isPrimary;

  const ColorSwatch({
    super.key,
    required this.color,
    required this.name,
    required this.hexCode,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isLight = color.computeLuminance() > 0.5;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                border: Border.all(
                  color: AppColors.borderColor(brightness).withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
            ),
            if (isPrimary)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isLight ? AppColors.black : AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.star,
                    size: 12,
                    color: isLight ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: AppSpacing.stackXs),
        Text(
          name,
          style: TextStyles.labelSmall(brightness),
          textAlign: TextAlign.center,
        ),
        Text(
          hexCode,
          style: TextStyles.bodySmall(brightness).copyWith(
            fontFamily: 'monospace',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
