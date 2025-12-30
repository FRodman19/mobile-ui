import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';

class TypographySection extends StatelessWidget {
  const TypographySection({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Typography',
          subtitle: 'DM Serif Display for headlines, Lora for body text, System fonts for UI elements.',
        ),

        ComponentShowcase(
          title: 'Display Styles',
          description: 'DM Serif Display - Bold headlines',
          children: [
            _buildTextExample(
              context,
              'Display Large',
              'The quick brown fox',
              TextStyles.displayLarge(brightness),
              '40sp / 48sp line / DM Serif Display Bold',
            ),
            SizedBox(height: AppSpacing.stackMd),
            _buildTextExample(
              context,
              'Display Medium',
              'The quick brown fox',
              TextStyles.displayMedium(brightness),
              '32sp / 40sp line / DM Serif Display Bold',
            ),
            SizedBox(height: AppSpacing.stackMd),
            _buildTextExample(
              context,
              'Display Small',
              'The quick brown fox',
              TextStyles.displaySmall(brightness),
              '28sp / 36sp line / DM Serif Display Medium',
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Headline Styles',
          description: 'Lora - SemiBold to Bold',
          children: [
            _buildTextExample(
              context,
              'Headline Large',
              'The quick brown fox',
              TextStyles.headlineLarge(brightness),
              '24sp / 32sp line / Lora Bold',
            ),
            SizedBox(height: AppSpacing.stackMd),
            _buildTextExample(
              context,
              'Headline Medium',
              'The quick brown fox',
              TextStyles.headlineMedium(brightness),
              '20sp / 28sp line / Lora SemiBold',
            ),
            SizedBox(height: AppSpacing.stackMd),
            _buildTextExample(
              context,
              'Headline Small',
              'The quick brown fox',
              TextStyles.headlineSmall(brightness),
              '18sp / 24sp line / Lora SemiBold',
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Body Styles',
          description: 'Lora Regular - Primary reading text',
          children: [
            _buildTextExample(
              context,
              'Body Large (DEFAULT)',
              'The quick brown fox jumps over the lazy dog. This is the default body text size.',
              TextStyles.bodyLarge(brightness),
              '16sp / 24sp line / Lora Regular',
            ),
            SizedBox(height: AppSpacing.stackMd),
            _buildTextExample(
              context,
              'Body Medium',
              'The quick brown fox jumps over the lazy dog. Secondary body text.',
              TextStyles.bodyMedium(brightness),
              '14sp / 20sp line / Lora Regular',
            ),
            SizedBox(height: AppSpacing.stackMd),
            _buildTextExample(
              context,
              'Body Small',
              'The quick brown fox. Captions and helper text.',
              TextStyles.bodySmall(brightness),
              '12sp / 16sp line / Lora Regular',
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Label Styles',
          description: 'System fonts - Buttons and UI labels',
          children: [
            _buildTextExample(
              context,
              'Label Large',
              'Primary Button Label',
              TextStyles.labelLarge(brightness),
              '16sp / 20sp line / System Medium',
            ),
            SizedBox(height: AppSpacing.stackMd),
            _buildTextExample(
              context,
              'Label Medium',
              'Secondary Button Label',
              TextStyles.labelMedium(brightness),
              '14sp / 16sp line / System Medium',
            ),
            SizedBox(height: AppSpacing.stackMd),
            _buildTextExample(
              context,
              'Label Small',
              'BADGE LABEL',
              TextStyles.labelSmall(brightness),
              '12sp / 16sp line / System Medium',
            ),
          ],
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }

  Widget _buildTextExample(
    BuildContext context,
    String label,
    String sampleText,
    TextStyle style,
    String specs,
  ) {
    final brightness = Theme.of(context).brightness;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.labelMedium(brightness).copyWith(
            color: AppColors.teal500,  // Sage green
          ),
        ),
        SizedBox(height: AppSpacing.stack2xs),
        Text(
          sampleText,
          style: style,
        ),
        SizedBox(height: AppSpacing.stack2xs),
        Text(
          specs,
          style: TextStyles.bodySmall(brightness).copyWith(
            color: AppColors.secondaryTextColor(brightness),
          ),
        ),
      ],
    );
  }
}
