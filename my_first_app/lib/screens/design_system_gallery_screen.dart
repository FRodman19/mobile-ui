import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import '../design_system/animations.dart';
import '../design_system/badges.dart';
import '../design_system/buttons.dart';
import '../design_system/cards.dart';
import '../design_system/chips.dart';
import '../design_system/dividers.dart';
import '../design_system/icon_container.dart';
import '../design_system/inputs.dart';
import '../design_system/lists.dart';
import '../design_system/navigation.dart';
import '../design_system/overlays.dart';
import '../design_system/progress.dart';
import '../design_system/skeleton.dart';
import '../design_system/sliders.dart';
import '../design_system/spacing.dart';
import '../design_system/theme.dart';
import '../design_system/tooltips.dart';

class DesignSystemGalleryScreen extends StatefulWidget {
  const DesignSystemGalleryScreen({super.key});

  @override
  State<DesignSystemGalleryScreen> createState() =>
      _DesignSystemGalleryScreenState();
}

class _DesignSystemGalleryScreenState
    extends State<DesignSystemGalleryScreen>
    with TickerProviderStateMixin {
  bool _checkboxValue = true;
  int _radioValue = 1;
  bool _switchValue = false;
  String? _dropdownValue = 'Option 1';
  DateTime _selectedDate = DateTime.now();
  bool _transitionToggled = false;
  bool _titleAccent = false;
  double _sliderValue = 0.5;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use system brightness to determine dark mode
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    // Wrap the entire gallery in a Theme using DSTheme based on system settings
    return Theme(
      data: isDarkMode ? DSTheme.darkTheme() : DSTheme.lightTheme(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _titleAccent = !_titleAccent;
                  });
                },
                child: Text(
                  'Design System V1 Gallery',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(
                        color: _titleAccent ? DSColors.teal500 : null,
                      ),
                ),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              actions: [
                // Show current theme mode (informational only)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isDarkMode ? Iconsax.moon : Iconsax.sun_1,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isDarkMode ? 'Dark' : 'Light',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(DSSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader('Colors'),
                  _buildColorSection(context),
                  _sectionHeader('Typography'),
                  _buildTypographySection(context),
                  _sectionHeader('Spacing System'),
                  _buildSpacingSection(context),
                  _sectionHeader('Buttons'),
                  _buildButtonsSection(context),
                  _sectionHeader('Cards'),
                  _buildCardsSection(context),
                  _sectionHeader('Form Inputs'),
                  _buildInputsSection(context),
                  _sectionHeader('Navigation'),
                  _buildNavigationSection(context),
                  _sectionHeader('Modals & Overlays'),
                  _buildOverlaysSection(context),
                  _sectionHeader('Lists & Data Display'),
                  _buildListsSection(context),
                  _sectionHeader('Dividers'),
                  _buildDividersSection(context),
                  _sectionHeader('Menus'),
                  _buildMenuSection(context),
                  _sectionHeader('Skeleton States'),
                  _buildSkeletonSection(context),
                  _sectionHeader('Icons'),
                  _buildIconsSection(context),
                  _sectionHeader('Animations'),
                  _buildAnimationsSection(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DSSpacing.md),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget _buildColorSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _paletteRow('Primary Orange', DSColors.orangePalette),
        const SizedBox(height: DSSpacing.md),
        _paletteRow('Teal Accents', DSColors.tealPalette),
        const SizedBox(height: DSSpacing.md),
        _paletteRow('Neutrals', DSColors.neutralPalette),
        const SizedBox(height: DSSpacing.md),
        Wrap(
          spacing: DSSpacing.sm,
          runSpacing: DSSpacing.sm,
          children: [
            _colorSwatch('Success', DSColors.premiumGreen),
            _colorSwatch('Error', DSColors.premiumRed),
            _colorSwatch('Warning', DSColors.premiumAmber),
            _colorSwatch('Info', DSColors.premiumBlue),
          ],
        ),
        const SizedBox(height: DSSpacing.md),
        Row(
          children: [
            Expanded(
              child: _modePreview(
                label: 'Light mode',
                background: DSColors.white,
                textColor: DSColors.black,
              ),
            ),
            const SizedBox(width: DSSpacing.md),
            Expanded(
              child: _modePreview(
                label: 'Dark mode',
                background: DSColors.black,
                textColor: DSColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _paletteRow(String label, List<Color> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: colors
                .map((color) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _colorSwatch('', color, size: 48),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _colorSwatch(String label, Color color, {double size = 56}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(DSSpacing.componentRadius),
          ),
        ),
        if (label.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ],
    );
  }

  Widget _modePreview({
    required String label,
    required Color background,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(DSSpacing.lg),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(DSSpacing.componentRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: textColor)),
          const SizedBox(height: 6),
          Text(
            'Primary text',
            style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            'Teal link',
            style: TextStyle(color: DSColors.teal500),
          ),
        ],
      ),
    );
  }

  Widget _buildTypographySection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _typeSample('H1 / Display Large', textTheme.displayLarge!),
        _typeSample('H2 / Display Medium', textTheme.displayMedium!),
        _typeSample('H3 / Display Small', textTheme.displaySmall!),
        _typeSample('H4 / Headline Large', textTheme.headlineLarge!),
        _typeSample('H5 / Headline Medium', textTheme.headlineMedium!),
        _typeSample('H6 / Headline Small', textTheme.headlineSmall!),
        _typeSample('Body Large', textTheme.bodyLarge!),
        _typeSample('Body Medium', textTheme.bodyMedium!),
        _typeSample('Body Small', textTheme.bodySmall!),
        _typeSample('Caption', textTheme.labelSmall!),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _typeSample(String label, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DSCard(
        padding: const EdgeInsets.all(DSSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('The quick brown fox', style: style),
            const SizedBox(height: 6),
            Text(label, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacingSection(BuildContext context) {
    final scale = [4, 8, 12, 16, 24, 32, 40, 48];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: scale
              .map(
                (value) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Text('$value',
                            style: Theme.of(context).textTheme.labelSmall),
                      ),
                      Container(
                        width: value.toDouble() * 3,
                        height: 10,
                        decoration: BoxDecoration(
                          color: DSColors.teal500,
                          borderRadius: BorderRadius.circular(
                            DSSpacing.componentRadius,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: DSSpacing.lg),
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Spacing Example',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: DSSpacing.sm),
              Text('Title goes here',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: DSSpacing.md),
              Text(
                'Body copy is separated from the title with 12px, and actions below use 16px.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: DSSpacing.lg),
              Row(
                children: [
                  DSButton(
                    label: 'Action',
                    onPressed: () {},
                    size: DSButtonSize.small,
                  ),
                  const SizedBox(width: DSSpacing.sm),
                  DSButton(
                    label: 'Secondary',
                    variant: DSButtonVariant.secondary,
                    onPressed: () {},
                    size: DSButtonSize.small,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Primary', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _buttonStateRow(DSButtonVariant.primary),
        const SizedBox(height: DSSpacing.md),
        Text('Secondary', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _buttonStateRow(DSButtonVariant.secondary),
        const SizedBox(height: DSSpacing.md),
        Text('Tertiary', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _buttonStateRow(DSButtonVariant.tertiary),
        const SizedBox(height: DSSpacing.md),
        Text('Text / Link', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _buttonStateRow(DSButtonVariant.text),
        const SizedBox(height: DSSpacing.md),
        Text('Sizes', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            DSButton(
              label: 'Small',
              size: DSButtonSize.small,
              onPressed: () {},
            ),
            DSButton(
              label: 'Medium',
              size: DSButtonSize.medium,
              onPressed: () {},
            ),
            DSButton(
              label: 'Large',
              size: DSButtonSize.large,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: DSSpacing.md),
        Text('Icon & FAB', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          children: [
            DSIconButton(icon: Iconsax.heart, onPressed: () {}),
            DSIconButton(
              icon: Iconsax.star,
              onPressed: () {},
              isActive: true,
            ),
            DSFab(onPressed: () {}, icon: Iconsax.add, mini: true),
            DSFab(
              onPressed: () {},
              icon: Iconsax.edit,
              label: 'Compose',
            ),
          ],
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buttonStateRow(DSButtonVariant variant) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        IgnorePointer(
          child: DSButton(
            label: 'Default',
            variant: variant,
            onPressed: () {},
          ),
        ),
        IgnorePointer(
          child: DSButton(
            label: 'Hover',
            variant: variant,
            onPressed: () {},
            stateOverride: DSButtonState.hover,
          ),
        ),
        IgnorePointer(
          child: DSButton(
            label: 'Pressed',
            variant: variant,
            onPressed: () {},
            stateOverride: DSButtonState.pressed,
          ),
        ),
        IgnorePointer(
          child: DSButton(
            label: 'Disabled',
            variant: variant,
            onPressed: null,
          ),
        ),
        IgnorePointer(
          child: DSButton(
            label: 'Loading',
            variant: variant,
            onPressed: () {},
            stateOverride: DSButtonState.loading,
          ),
        ),
      ],
    );
  }

  Widget _buildCardsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            SizedBox(
              width: 220,
              child: DSCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Standard Card',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 6),
                    Text(
                      'Minimal surface, no shadow, 16px radius.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 220,
              child: DSCard(
                tone: DSCardTone.elevated,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Elevated Card',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 6),
                    Text(
                      'Uses a lighter surface tone instead of shadow.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 220,
              child: DSCard(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Interactive Card',
                        style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 6),
                    Text(
                      'Tap highlights with a teal wash.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: DSSpacing.md),
        SizedBox(
          width: 260,
          child: DSCard(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(DSSpacing.cardRadius),
                ),
                  child: Container(
                    height: 120,
                    color: DSColors.neutral200,
                    alignment: Alignment.center,
                    child: Text(
                      'Image',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(DSSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Image Card',
                          style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(height: 6),
                      Text(
                        'Card with image header and content.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildInputsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Text Fields',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              const DSTextField(
                label: 'Default',
                hintText: 'Enter text',
              ),
              const SizedBox(height: 12),
              const DSTextField(
                label: 'Focused',
                hintText: 'Active state',
              ),
              const SizedBox(height: 12),
              const DSTextField(
                label: 'Error',
                hintText: 'Something went wrong',
                errorText: 'Please check your input',
              ),
              const SizedBox(height: 12),
              const DSTextField(
                label: 'Disabled',
                hintText: 'Disabled',
                enabled: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dropdown / Select',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              DSDropdown<String>(
                label: 'Choose option',
                value: _dropdownValue,
                items: const [
                  DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                  DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                  DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
                ],
                onChanged: (value) {
                  setState(() {
                    _dropdownValue = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Checkbox / Radio / Switch',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              DSCheckboxTile(
                value: _checkboxValue,
                label: 'Checkbox option',
                onChanged: (value) {
                  setState(() {
                    _checkboxValue = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  DSRadioTile<int>(
                    value: 1,
                    groupValue: _radioValue,
                    label: 'Option A',
                    onChanged: (value) {
                      setState(() {
                        _radioValue = value ?? 1;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  DSRadioTile<int>(
                    value: 2,
                    groupValue: _radioValue,
                    label: 'Option B',
                    onChanged: (value) {
                      setState(() {
                        _radioValue = value ?? 2;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              DSSwitchTile(
                value: _switchValue,
                label: 'Toggle option',
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date Picker',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime(2023),
                lastDate: DateTime(2030),
                onDateChanged: (value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Search Field',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              const DSSearchField(hintText: 'Search components'),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sliders', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              DSSlider(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
                divisions: 4,
                label: '${(_sliderValue * 100).round()}%',
              ),
              const SizedBox(height: 8),
              Text(
                'Value: ${(_sliderValue * 100).round()}%',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildNavigationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DSSpacing.horizontalPadding,
            vertical: DSSpacing.verticalPadding,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius:
                BorderRadius.circular(DSSpacing.componentRadius),
          ),
          child: Row(
            children: [
              const Icon(Iconsax.arrow_left_2),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Top App Bar',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              IconButton(
                icon: const Icon(Iconsax.search_normal),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Iconsax.more),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tab Bar', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Overview'),
                  Tab(text: 'Details'),
                  Tab(text: 'Insights'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        DSBottomNavBar(
          items: const [
            DSNavItem(icon: Iconsax.home_2, label: 'Home'),
            DSNavItem(icon: Iconsax.folder, label: 'Projects'),
            DSNavItem(icon: Iconsax.calendar_1, label: 'Plan'),
            DSNavItem(icon: Iconsax.user, label: 'Profile'),
          ],
          currentIndex: 0,
          onTap: (_) {},
        ),
        const SizedBox(height: DSSpacing.md),
        DSSidebar(
          items: const [
            DSNavItem(icon: Iconsax.category, label: 'Dashboard'),
            DSNavItem(icon: Iconsax.note_2, label: 'Notes'),
            DSNavItem(icon: Iconsax.calendar_1, label: 'Calendar'),
            DSNavItem(icon: Iconsax.setting_2, label: 'Settings'),
          ],
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildOverlaysSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            DSButton(
              label: 'Open Modal',
              onPressed: () {
                DSModal.show(
                  context: context,
                  title: 'Confirm action',
                  content: const Text('This will update the system state.'),
                  actions: [
                    DSButton(
                      label: 'Cancel',
                      variant: DSButtonVariant.tertiary,
                      onPressed: () => Navigator.pop(context),
                    ),
                    DSButton(
                      label: 'Confirm',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
            ),
            DSButton(
              label: 'Bottom Sheet',
              variant: DSButtonVariant.secondary,
              onPressed: () {
                DSBottomSheet.show(
                  context: context,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bottom Sheet',
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 8),
                      Text(
                        'Use for quick actions and settings.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
            DSButton(
              label: 'Toast',
              variant: DSButtonVariant.text,
              onPressed: () {
                DSToast.show(
                  context: context,
                  message: 'Saved to your workspace.',
                );
              },
            ),
          ],
        ),
        const SizedBox(height: DSSpacing.md),
        const DSInlineModal(
          title: 'Dialog Preview',
          body: 'A static modal preview with 16px radius and no shadow.',
        ),
        const SizedBox(height: DSSpacing.md),
        Container(
          padding: const EdgeInsets.all(DSSpacing.lg),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius:
                BorderRadius.circular(DSSpacing.componentRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      color: DSColors.neutral300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text('Bottom Sheet Preview',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 6),
              Text(
                'Rounded top corners, no shadow, minimal content.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        Row(
          children: [
            const DSTooltip(
              message: 'Tooltip text',
              child: Icon(Iconsax.info_circle),
            ),
            const SizedBox(width: 8),
            Text('Tooltip example',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildListsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSCard(
          child: Column(
            children: [
              DSListTile(
                title: 'List item one',
                subtitle: 'Supporting text goes here',
                leading: const Icon(Iconsax.folder_2),
                trailing: const Icon(Iconsax.arrow_right_3, size: 16),
                onTap: () {},
              ),
              const DSDivider(),
              DSListTile(
                title: 'List item two',
                subtitle: 'Secondary line',
                leading: const Icon(Iconsax.document_text),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            DSChip(label: 'Selected', isSelected: true, onTap: () {}),
            DSChip(label: 'Unselected', isSelected: false, onTap: () {}),
            const DSBadge(label: 'New'),
            const DSBadge(label: 'Success', variant: DSBadgeVariant.success),
            const DSBadge(label: 'Error', variant: DSBadgeVariant.error),
          ],
        ),
        const SizedBox(height: DSSpacing.md),
        Row(
          children: [
            const Text('A'),
            const SizedBox(width: 8),
            const DSVerticalDivider(width: 1, indent: 4, endIndent: 4),
            const SizedBox(width: 8),
            const Text('B'),
          ],
        ),
        const SizedBox(height: DSSpacing.md),
        const DSProgressBar(value: 0.7),
        const SizedBox(height: DSSpacing.md),
        DSEmptyState(
          title: 'No items yet',
          description: 'Create your first entry to see it here.',
          icon: Iconsax.archive_1,
          action: DSButton(label: 'Create', onPressed: () {}),
        ),
        const SizedBox(height: DSSpacing.xl),
        Text(
          'Brand Icons',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: DSSpacing.md),
        Text(
          'Social media and brand icons using flutter_svg',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? DSColors.neutral300
                    : DSColors.neutral500,
              ),
        ),
        const SizedBox(height: DSSpacing.md),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            DSIconContainer(
              icon: Icons.tiktok,
              color: DSColors.black,
              size: 64,
              iconSize: 32,
            ),
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: DSColors.neutral100,
                borderRadius: BorderRadius.circular(DSSpacing.componentRadius),
              ),
              child: SvgPicture.asset('assets/icons/tiktok.svg'),
            ),
            Container(
              width: 64,
              height: 64,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: DSColors.neutral100,
                borderRadius: BorderRadius.circular(DSSpacing.componentRadius),
              ),
              child: SvgPicture.asset('assets/icons/facebook.svg'),
            ),
          ],
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildIconsSection(BuildContext context) {
    const sizes = [16.0, 20.0, 24.0, 32.0, 40.0];
    final iconSamples = <MapEntry<String, IconData>>[
      const MapEntry('home-2', Iconsax.home_2),
      const MapEntry('folder-2', Iconsax.folder_2),
      const MapEntry('teacher', Iconsax.teacher),
      const MapEntry('document-text', Iconsax.document_text),
      const MapEntry('message', Iconsax.message_programming),
      const MapEntry('chart-square', Iconsax.chart_square),
      const MapEntry('add-circle', Iconsax.add_circle),
      const MapEntry('edit-2', Iconsax.edit_2),
      const MapEntry('trash', Iconsax.trash),
      const MapEntry('save-2', Iconsax.save_2),
      const MapEntry('share', Iconsax.share),
      const MapEntry('search', Iconsax.search_normal),
      const MapEntry('filter', Iconsax.filter),
      const MapEntry('settings', Iconsax.setting_2),
      const MapEntry('calendar', Iconsax.calendar_1),
      const MapEntry('flash', Iconsax.flash_1),
      const MapEntry('graph', Iconsax.graph),
      const MapEntry('heart', Iconsax.heart),
      const MapEntry('task', Iconsax.task_square),
      const MapEntry('star', Iconsax.star),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 16,
          children: sizes
              .map(
                (size) => Column(
                  children: [
                    Icon(Iconsax.home_2, size: size),
                    const SizedBox(height: 4),
                    Text('${size.toInt()}px',
                        style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
              )
              .toList(),
        ),
        const SizedBox(height: DSSpacing.md),
        Wrap(
          spacing: 12,
          children: [
            Icon(
              Iconsax.flash_1,
              color: Theme.of(context).brightness == Brightness.dark
                  ? DSColors.white
                  : DSColors.black,
            ),
            const Icon(Iconsax.flash_1, color: DSColors.neutral500),
            const Icon(Iconsax.flash_1, color: DSColors.orange500),
            const Icon(Iconsax.flash_1, color: DSColors.teal500),
            const Icon(Iconsax.flash_1, color: DSColors.premiumGreen),
            const Icon(Iconsax.flash_1, color: DSColors.premiumRed),
          ],
        ),
        const SizedBox(height: DSSpacing.md),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: iconSamples
              .map(
                (entry) => SizedBox(
                  width: 72,
                  child: Column(
                    children: [
                      Icon(entry.value, size: 24),
                      const SizedBox(height: 4),
                      Text(
                        entry.key,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildAnimationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transition Example',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: _transitionToggled ? 80 : 48,
                width: _transitionToggled ? 160 : 120,
                decoration: BoxDecoration(
                  color: DSColors.orange500,
                  borderRadius:
                      BorderRadius.circular(DSSpacing.componentRadius),
                ),
              ),
              const SizedBox(height: 12),
              DSButton(
                label: _transitionToggled ? 'Reset' : 'Animate',
                variant: DSButtonVariant.secondary,
                onPressed: () {
                  setState(() {
                    _transitionToggled = !_transitionToggled;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.md),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            DSGridLoader(size: 28),
            DSGridLoader(size: 44),
            const DSProgressBar(value: 0.4),
          ],
        ),
        const SizedBox(height: DSSpacing.md),
        const Row(
          children: [
            DSSuccessIcon(),
            SizedBox(width: 24),
            DSErrorIcon(),
          ],
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildDividersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Horizontal Dividers'),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            children: [
              const Text('Content above divider'),
              const SizedBox(height: DSSpacing.md),
              const DSDivider(),
              const SizedBox(height: DSSpacing.md),
              const Text('Content below divider'),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.lg),
        const Text('Horizontal Divider with custom thickness'),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            children: [
              const Text('Thicker divider'),
              const SizedBox(height: DSSpacing.md),
              const DSDivider(thickness: 2),
              const SizedBox(height: DSSpacing.md),
              const Text('Below thick divider'),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.lg),
        const Text('Vertical Dividers'),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  child: Center(child: Text('Section A')),
                ),
                const DSVerticalDivider(thickness: 1, width: 20),
                const Expanded(
                  child: Center(child: Text('Section B')),
                ),
                const DSVerticalDivider(thickness: 1, width: 20),
                const Expanded(
                  child: Center(child: Text('Section C')),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: DSSpacing.lg),
        const Text('Divider with indents'),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            children: [
              const Text('Full width text'),
              const SizedBox(height: DSSpacing.md),
              const DSDivider(indent: 16, endIndent: 16),
              const SizedBox(height: DSSpacing.md),
              const Text('Indented divider above'),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    const menuEntries = [
      {'label': 'Profile', 'icon': Iconsax.user},
      {'label': 'Settings', 'icon': Iconsax.setting_2},
      {'label': 'Help', 'icon': Iconsax.info_circle},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Menu'),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: MenuAnchor(
            style: MenuStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
            ),
            menuChildren: menuEntries.map((entry) => MenuItemButton(
              leadingIcon: Icon(entry['icon'] as IconData, size: 20),
              child: Text(entry['label'] as String),
              onPressed: () {},
            )).toList(),
            builder: (context, controller, child) {
              return FilledButton.icon(
                onPressed: controller.open,
                icon: const Icon(Iconsax.menu),
                label: const Text('Open Menu'),
              );
            },
          ),
        ),
        const SizedBox(height: DSSpacing.lg),
      ],
    );
  }

  Widget _buildSkeletonSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Loading states for components:'),
        const SizedBox(height: DSSpacing.md),
        DSCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const DSSkeleton(width: 48, height: 48, radius: 24),
                  const SizedBox(width: DSSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DSSkeleton(height: 16, width: 150),
                        const SizedBox(height: 8),
                        const DSSkeleton(height: 14, width: 100),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DSSpacing.md),
              const DSDivider(),
              const SizedBox(height: DSSpacing.md),
              const DSSkeleton(height: 100, width: double.infinity),
              const SizedBox(height: DSSpacing.md),
              Row(
                children: [
                  const Expanded(child: DSSkeleton(height: 40)),
                  const SizedBox(width: DSSpacing.sm),
                  const Expanded(child: DSSkeleton(height: 40)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: DSSpacing.xl),
      ],
    );
  }
}
