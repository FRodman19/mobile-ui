import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import '../theme/spacing.dart';
import 'sections/colors_section.dart';
import 'sections/typography_section.dart';
import 'sections/spacing_section.dart';
import 'sections/icons_section.dart';
import 'sections/buttons_section.dart';
import 'sections/cards_section.dart';
import 'sections/forms_section.dart';
import 'sections/navigation_section.dart';
import 'sections/overlays_section.dart';
import 'sections/feedback_section.dart';

class DesignSystemGallery extends StatefulWidget {
  const DesignSystemGallery({super.key});

  @override
  State<DesignSystemGallery> createState() => _DesignSystemGalleryState();
}

class _DesignSystemGalleryState extends State<DesignSystemGallery> {
  ThemeMode _themeMode = ThemeMode.system;
  String _selectedSection = 'All';

  final List<String> _sections = [
    'All',
    'Foundation',
    'Components',
  ];

  @override
  Widget build(BuildContext context) {
    final brightness = _themeMode == ThemeMode.system
        ? MediaQuery.of(context).platformBrightness
        : _themeMode == ThemeMode.dark
            ? Brightness.dark
            : Brightness.light;

    return Theme(
      data: brightness == Brightness.dark
          ? ThemeData.dark(useMaterial3: true).copyWith(
              scaffoldBackgroundColor: AppColors.neutral100,
              colorScheme: ColorScheme.dark(
                primary: AppColors.teal500,  // Vibrant teal
                surface: AppColors.neutral200,
              ),
            )
          : ThemeData.light(useMaterial3: true).copyWith(
              scaffoldBackgroundColor: AppColors.neutral950,
              colorScheme: ColorScheme.light(
                primary: AppColors.teal500,  // Vibrant teal
                surface: AppColors.neutral900,
              ),
            ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Design System Gallery',
            style: TextStyles.headlineMedium(brightness),
          ),
          actions: [
            // Dark/Light mode toggle
            IconButton(
              icon: Icon(
                _themeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: () {
                setState(() {
                  _themeMode = _themeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
                });
              },
              tooltip: 'Toggle theme',
            ),
            SizedBox(width: AppSpacing.inlineXs),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction
              Container(
                padding: EdgeInsets.all(AppSpacing.screenMarginHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Grow Out Loud',
                      style: TextStyles.displayMedium(brightness),
                    ),
                    SizedBox(height: AppSpacing.stack2xs),
                    Text(
                      'Version 1.0 - Complete Design System',
                      style: TextStyles.bodyMedium(brightness).copyWith(
                        color: AppColors.secondaryTextColor(brightness),
                      ),
                    ),
                    SizedBox(height: AppSpacing.stackSm),
                    Container(
                      padding: EdgeInsets.all(AppSpacing.insetSm),
                      decoration: BoxDecoration(
                        color: AppColors.teal500.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                        border: Border.all(
                          color: AppColors.teal500.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, size: 16, color: AppColors.teal500),
                          SizedBox(width: AppSpacing.inlineXs),
                          Expanded(
                            child: Text(
                              'Premium palette - Vibrant teal, modern & energetic',
                              style: TextStyles.bodySmall(brightness).copyWith(
                                color: AppColors.teal600,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Section filter chips
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenMarginHorizontal),
                  itemCount: _sections.length,
                  separatorBuilder: (context, index) => SizedBox(width: AppSpacing.inlineXs),
                  itemBuilder: (context, index) {
                    final section = _sections[index];
                    final isSelected = section == _selectedSection;

                    return FilterChip(
                      label: Text(section),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() => _selectedSection = section);
                      },
                      backgroundColor: AppColors.surfaceColor(brightness),
                      selectedColor: AppColors.teal500,  // Vibrant teal
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.white : null,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: AppSpacing.stackMd),

              // All sections
              if (_selectedSection == 'All' || _selectedSection == 'Foundation') ...[
                const ColorsSection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
                const TypographySection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
                const SpacingSection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
                const IconsSection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
              ],

              if (_selectedSection == 'All' || _selectedSection == 'Components') ...[
                const ButtonsSection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
                const CardsSection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
                const FormsSection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
                const NavigationSection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
                const OverlaysSection(),
                Divider(height: 1, color: AppColors.borderColor(brightness)),
                const FeedbackSection(),
              ],

              // Footer
              Container(
                padding: EdgeInsets.all(AppSpacing.screenMarginHorizontal),
                child: Center(
                  child: Text(
                    'Design System Gallery v1.0\nGrow Out Loud',
                    textAlign: TextAlign.center,
                    style: TextStyles.bodySmall(brightness).copyWith(
                      color: AppColors.secondaryTextColor(brightness),
                    ),
                  ),
                ),
              ),

              SizedBox(height: AppSpacing.stackXl),
            ],
          ),
        ),
      ),
    );
  }
}
