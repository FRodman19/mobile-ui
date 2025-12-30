import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../theme/spacing.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenMarginHorizontal,
        AppSpacing.stackLg,
        AppSpacing.screenMarginHorizontal,
        AppSpacing.stackMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.headlineLarge(brightness),
          ),
          if (subtitle != null) ...[
            SizedBox(height: AppSpacing.stackXs),
            Text(
              subtitle!,
              style: TextStyles.bodyMedium(brightness).copyWith(
                color: AppColors.secondaryTextColor(brightness),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
