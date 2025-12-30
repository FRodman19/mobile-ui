import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/color_swatch.dart' as custom;

class ColorsSection extends StatelessWidget {
  const ColorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Colors',
          subtitle: 'Premium vibrant teal, warm neutrals, and semantic colors. Modern, energetic palette.',
        ),

        // Brand Teal Palette
        _buildColorGroup(
          context,
          'Brand Teal Palette (Primary)',
          [
            _ColorData(AppColors.teal50, 'Teal 50', '#ECFEFF'),
            _ColorData(AppColors.teal100, 'Teal 100', '#CFFAFE'),
            _ColorData(AppColors.teal200, 'Teal 200', '#A5F3FC'),
            _ColorData(AppColors.teal300, 'Teal 300', '#67E8F9'),
            _ColorData(AppColors.teal400, 'Teal 400', '#22D3EE'),
            _ColorData(AppColors.teal500, 'Teal 500', '#06B6D4', isPrimary: true),
            _ColorData(AppColors.teal600, 'Teal 600', '#0891B2'),
            _ColorData(AppColors.teal700, 'Teal 700', '#0E7490'),
            _ColorData(AppColors.teal800, 'Teal 800', '#155E75'),
            _ColorData(AppColors.teal900, 'Teal 900', '#164E63'),
            _ColorData(AppColors.teal950, 'Teal 950', '#083344'),
          ],
        ),

        SizedBox(height: AppSpacing.stackLg),

        // Neutral Palette (Dark Mode)
        _buildColorGroup(
          context,
          'Neutral Palette (Dark Mode)',
          [
            _ColorData(AppColors.neutral0, 'Neutral 0', '#000000'),
            _ColorData(AppColors.neutral50, 'Neutral 50', '#0A0A0A'),
            _ColorData(AppColors.neutral100, 'Neutral 100', '#0A1929', isPrimary: true),
            _ColorData(AppColors.neutral200, 'Neutral 200', '#1E293B'),
            _ColorData(AppColors.neutral300, 'Neutral 300', '#334155'),
            _ColorData(AppColors.neutral400, 'Neutral 400', '#475569'),
            _ColorData(AppColors.neutral500, 'Neutral 500', '#64748B'),
            _ColorData(AppColors.neutral600, 'Neutral 600', '#94A3B8'),
            _ColorData(AppColors.neutral700, 'Neutral 700', '#CBD5E1'),
            _ColorData(AppColors.neutral800, 'Neutral 800', '#E2E8F0'),
            _ColorData(AppColors.neutral900, 'Neutral 900', '#F1F5F9'),
          ],
        ),

        SizedBox(height: AppSpacing.stackLg),

        // Neutral Palette (Light Mode)
        _buildColorGroup(
          context,
          'Neutral Palette (Light Mode)',
          [
            _ColorData(AppColors.neutral1000, 'Neutral 1000', '#FFFFFF'),
            _ColorData(AppColors.neutral950, 'Neutral 950', '#FDFCFF', isPrimary: true),
          ],
        ),

        SizedBox(height: AppSpacing.stackLg),

        // Success Colors
        _buildColorGroup(
          context,
          'Success Colors',
          [
            _ColorData(AppColors.success50, 'Success 50', '#F0FDF4'),
            _ColorData(AppColors.success100, 'Success 100', '#DCFCE7'),
            _ColorData(AppColors.success500, 'Success 500', '#22C55E', isPrimary: true),
            _ColorData(AppColors.success600, 'Success 600', '#16A34A'),
            _ColorData(AppColors.success700, 'Success 700', '#15803D'),
            _ColorData(AppColors.success900, 'Success 900', '#14532D'),
          ],
        ),

        SizedBox(height: AppSpacing.stackLg),

        // Error Colors
        _buildColorGroup(
          context,
          'Error Colors',
          [
            _ColorData(AppColors.error50, 'Error 50', '#FEF2F2'),
            _ColorData(AppColors.error100, 'Error 100', '#FEE2E2'),
            _ColorData(AppColors.error500, 'Error 500', '#EF4444', isPrimary: true),
            _ColorData(AppColors.error600, 'Error 600', '#DC2626'),
            _ColorData(AppColors.error700, 'Error 700', '#B91C1C'),
            _ColorData(AppColors.error900, 'Error 900', '#7F1D1D'),
          ],
        ),

        SizedBox(height: AppSpacing.stackLg),

        // Warning Colors
        _buildColorGroup(
          context,
          'Warning Colors',
          [
            _ColorData(AppColors.warning50, 'Warning 50', '#FFFBEB'),
            _ColorData(AppColors.warning100, 'Warning 100', '#FEF3C7'),
            _ColorData(AppColors.warning500, 'Warning 500', '#F59E0B', isPrimary: true),
            _ColorData(AppColors.warning600, 'Warning 600', '#D97706'),
            _ColorData(AppColors.warning700, 'Warning 700', '#B45309'),
            _ColorData(AppColors.warning900, 'Warning 900', '#78350F'),
          ],
        ),

        SizedBox(height: AppSpacing.stackLg),

        // Info Colors
        _buildColorGroup(
          context,
          'Info Colors',
          [
            _ColorData(AppColors.info50, 'Info 50', '#EFF6FF'),
            _ColorData(AppColors.info100, 'Info 100', '#DBEAFE'),
            _ColorData(AppColors.info500, 'Info 500', '#3B82F6', isPrimary: true),
            _ColorData(AppColors.info600, 'Info 600', '#2563EB'),
            _ColorData(AppColors.info700, 'Info 700', '#1D4ED8'),
            _ColorData(AppColors.info900, 'Info 900', '#1E3A8A'),
          ],
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }

  Widget _buildColorGroup(
    BuildContext context,
    String title,
    List<_ColorData> colors,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenMarginHorizontal),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        SizedBox(height: AppSpacing.stackSm),
        SizedBox(
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenMarginHorizontal),
            itemCount: colors.length,
            separatorBuilder: (context, index) => SizedBox(width: AppSpacing.inlineXs),
            itemBuilder: (context, index) {
              final colorData = colors[index];
              return custom.ColorSwatch(
                color: colorData.color,
                name: colorData.name,
                hexCode: colorData.hexCode,
                isPrimary: colorData.isPrimary,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ColorData {
  final Color color;
  final String name;
  final String hexCode;
  final bool isPrimary;

  _ColorData(
    this.color,
    this.name,
    this.hexCode, {
    this.isPrimary = false,
  });
}
