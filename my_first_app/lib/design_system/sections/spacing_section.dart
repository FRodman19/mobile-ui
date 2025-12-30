import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';
import '../../widgets/app_divider.dart';

class SpacingSection extends StatelessWidget {
  const SpacingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Spacing',
          subtitle: '8-point grid system. All spacing uses multiples of 8.',
        ),

        ComponentShowcase(
          title: 'Spacing Scale',
          description: '1 unit = 8px (BASE)',
          children: [
            _buildSpacingBar(context, '4px', AppSpacing.baseHalf, '0.5 unit'),
            _buildSpacingBar(context, '8px', AppSpacing.base, '1 unit (BASE)'),
            _buildSpacingBar(context, '16px', 16, '2 units (MOST COMMON)'),
            _buildSpacingBar(context, '24px', 24, '3 units'),
            _buildSpacingBar(context, '32px', 32, '4 units'),
            _buildSpacingBar(context, '40px', 40, '5 units'),
            _buildSpacingBar(context, '48px', 48, '6 units'),
          ],
        ),

        ComponentShowcase(
          title: 'Inset Spacing (Padding)',
          description: 'Padding inside elements',
          specs: {
            'insetXs': '4px - Chip padding, small badges',
            'insetSm': '8px - Button padding (vertical)',
            'insetMd': '16px - Card padding (MOST COMMON)',
            'insetLg': '24px - Modal padding',
            'insetXl': '32px - Screen edge margins',
          },
          children: [],
        ),

        ComponentShowcase(
          title: 'Stack Spacing (Vertical)',
          description: 'Vertical spacing between elements',
          specs: {
            'stack2xs': '4px - Tight grouping (label + input)',
            'stackXs': '8px - Related items',
            'stackSm': '12px - Form fields',
            'stackMd': '16px - Paragraphs (MOST COMMON)',
            'stackLg': '24px - Section spacing',
            'stackXl': '32px - Major section breaks',
          },
          children: [],
        ),

        ComponentShowcase(
          title: 'Inline Spacing (Horizontal)',
          description: 'Horizontal spacing between elements',
          specs: {
            'inline2xs': '4px - Icon + text (tight)',
            'inlineXs': '8px - Chip gap (MOST COMMON)',
            'inlineSm': '12px - Button icon + text',
            'inlineMd': '16px - Card columns',
            'inlineLg': '24px - Large card spacing',
          },
          children: [],
        ),

        ComponentShowcase(
          title: 'Dividers',
          description: 'Horizontal and vertical dividers for content separation',
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppDivider(),
                SizedBox(height: AppSpacing.stackMd),
                const AppDivider(thickness: DividerThickness.medium),
                SizedBox(height: AppSpacing.stackMd),
                const AppDividerWithLabel(label: 'OR'),
                SizedBox(height: AppSpacing.stackMd),
                const AppDividerWithIcon(icon: Icons.star),
                SizedBox(height: AppSpacing.stackMd),
                Row(
                  children: [
                    const Expanded(child: Text('Left content')),
                    const AppDividerVertical(width: 32),
                    const Expanded(child: Text('Right content')),
                  ],
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }

  Widget _buildSpacingBar(
    BuildContext context,
    String label,
    double size,
    String description,
  ) {
    final brightness = Theme.of(context).brightness;

    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.stackSm),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: TextStyles.labelMedium(brightness),
            ),
          ),
          Container(
            width: size,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.teal500,  // Sage green
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(width: AppSpacing.inlineSm),
          Expanded(
            child: Text(
              description,
              style: TextStyles.bodySmall(brightness),
            ),
          ),
        ],
      ),
    );
  }
}
