import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../theme/spacing.dart';

class ComponentShowcase extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget> children;
  final Map<String, String>? specs;

  const ComponentShowcase({
    super.key,
    required this.title,
    this.description,
    required this.children,
    this.specs,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.screenMarginHorizontal,
        vertical: AppSpacing.stackXs,
      ),
      padding: EdgeInsets.all(AppSpacing.insetMd),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor(brightness),
        borderRadius: BorderRadius.circular(AppSpacing.cardBorderRadius),
        border: Border.all(
          color: AppColors.borderColor(brightness).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.headlineMedium(brightness),
          ),
          if (description != null) ...[
            SizedBox(height: AppSpacing.stack2xs),
            Text(
              description!,
              style: TextStyles.bodyMedium(brightness).copyWith(
                color: AppColors.secondaryTextColor(brightness),
              ),
            ),
          ],
          SizedBox(height: AppSpacing.stackMd),
          ...children,
          if (specs != null) ...[
            SizedBox(height: AppSpacing.stackMd),
            Container(
              padding: EdgeInsets.all(AppSpacing.insetSm),
              decoration: BoxDecoration(
                color: brightness == Brightness.dark
                    ? AppColors.neutral300.withValues(alpha: 0.1)
                    : AppColors.neutral800,
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SPECIFICATIONS',
                    style: TextStyles.labelSmall(brightness).copyWith(
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: AppSpacing.stackXs),
                  ...specs!.entries.map((entry) => Padding(
                        padding: EdgeInsets.only(bottom: AppSpacing.stack2xs),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                '${entry.key}:',
                                style: TextStyles.bodySmall(brightness).copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                entry.value,
                                style: TextStyles.bodySmall(brightness),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
