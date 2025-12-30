import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../design_system_v3/animations.dart';
import '../design_system_v3/badges.dart';
import '../design_system_v3/buttons.dart';
import '../design_system_v3/cards.dart';
import '../design_system_v3/chips.dart';
import '../design_system_v3/dividers.dart';
import '../design_system_v3/inputs.dart';
import '../design_system_v3/lists.dart';
import '../design_system_v3/navigation.dart';
import '../design_system_v3/overlays.dart';
import '../design_system_v3/progress.dart';
import '../design_system_v3/sliders.dart';
import '../design_system_v3/spacing_v3.dart';
import '../design_system_v3/theme_v3.dart';
import '../design_system_v3/tooltips.dart';

class DesignSystemV3GalleryScreen extends StatefulWidget {
  const DesignSystemV3GalleryScreen({super.key});

  @override
  State<DesignSystemV3GalleryScreen> createState() =>
      _DesignSystemV3GalleryScreenState();
}

class _DesignSystemV3GalleryScreenState
    extends State<DesignSystemV3GalleryScreen>
    with TickerProviderStateMixin {
  bool _isDarkMode = false;
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
    return Theme(
      data: _isDarkMode ? DSV3Theme.darkTheme() : DSV3Theme.lightTheme(),
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
                  'Design System V3 Gallery',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(
                        color: _titleAccent ? DSV3Colors.teal500 : null,
                      ),
                ),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              actions: [
                IconButton(
                  tooltip: 'Toggle theme',
                  icon: Icon(
                    _isDarkMode ? Iconsax.sun_1 : Iconsax.moon,
                  ),
                  onPressed: () {
                    setState(() {
                      _isDarkMode = !_isDarkMode;
                    });
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(DSV3Spacing.lg),
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
      padding: const EdgeInsets.only(bottom: DSV3Spacing.md),
      child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  Widget _buildColorSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _paletteRow('Primary Orange', DSV3Colors.orangePalette),
        const SizedBox(height: DSV3Spacing.md),
        _paletteRow('Teal Accents', DSV3Colors.tealPalette),
        const SizedBox(height: DSV3Spacing.md),
        _paletteRow('Neutrals', DSV3Colors.neutralPalette),
        const SizedBox(height: DSV3Spacing.md),
        Wrap(
          spacing: DSV3Spacing.sm,
          runSpacing: DSV3Spacing.sm,
          children: [
            _colorSwatch('Success', DSV3Colors.premiumGreen),
            _colorSwatch('Error', DSV3Colors.premiumRed),
            _colorSwatch('Warning', DSV3Colors.premiumAmber),
            _colorSwatch('Info', DSV3Colors.premiumBlue),
          ],
        ),
        const SizedBox(height: DSV3Spacing.md),
        Row(
          children: [
            Expanded(
              child: _modePreview(
                label: 'Light mode',
                background: DSV3Colors.white,
                textColor: DSV3Colors.black,
              ),
            ),
            const SizedBox(width: DSV3Spacing.md),
            Expanded(
              child: _modePreview(
                label: 'Dark mode',
                background: DSV3Colors.black,
                textColor: DSV3Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: DSV3Spacing.xl),
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
            borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
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
      padding: const EdgeInsets.all(DSV3Spacing.lg),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
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
            style: TextStyle(color: DSV3Colors.teal500),
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
        const SizedBox(height: DSV3Spacing.xl),
      ],
    );
  }

  Widget _typeSample(String label, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DSV3Card(
        padding: const EdgeInsets.all(DSV3Spacing.lg),
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
                          color: DSV3Colors.teal500,
                          borderRadius: BorderRadius.circular(
                            DSV3Spacing.componentRadius,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: DSV3Spacing.lg),
        DSV3Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Spacing Example',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: DSV3Spacing.sm),
              Text('Title goes here',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: DSV3Spacing.md),
              Text(
                'Body copy is separated from the title with 12px, and actions below use 16px.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: DSV3Spacing.lg),
              Row(
                children: [
                  DSV3Button(
                    label: 'Action',
                    onPressed: () {},
                    size: DSV3ButtonSize.small,
                  ),
                  const SizedBox(width: DSV3Spacing.sm),
                  DSV3Button(
                    label: 'Secondary',
                    variant: DSV3ButtonVariant.secondary,
                    onPressed: () {},
                    size: DSV3ButtonSize.small,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: DSV3Spacing.xl),
      ],
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Primary', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _buttonStateRow(DSV3ButtonVariant.primary),
        const SizedBox(height: DSV3Spacing.md),
        Text('Secondary', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _buttonStateRow(DSV3ButtonVariant.secondary),
        const SizedBox(height: DSV3Spacing.md),
        Text('Tertiary', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _buttonStateRow(DSV3ButtonVariant.tertiary),
        const SizedBox(height: DSV3Spacing.md),
        Text('Text / Link', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _buttonStateRow(DSV3ButtonVariant.text),
        const SizedBox(height: DSV3Spacing.md),
        Text('Sizes', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            DSV3Button(
              label: 'Small',
              size: DSV3ButtonSize.small,
              onPressed: () {},
            ),
            DSV3Button(
              label: 'Medium',
              size: DSV3ButtonSize.medium,
              onPressed: () {},
            ),
            DSV3Button(
              label: 'Large',
              size: DSV3ButtonSize.large,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: DSV3Spacing.md),
        Text('Icon & FAB', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          children: [
            DSV3IconButton(icon: Iconsax.heart, onPressed: () {}),
            DSV3IconButton(
              icon: Iconsax.star,
              onPressed: () {},
              isActive: true,
            ),
            DSV3Fab(onPressed: () {}, icon: Iconsax.add, mini: true),
            DSV3Fab(
              onPressed: () {},
              icon: Iconsax.edit,
              label: 'Compose',
            ),
          ],
        ),
        const SizedBox(height: DSV3Spacing.xl),
      ],
    );
  }

  Widget _buttonStateRow(DSV3ButtonVariant variant) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        IgnorePointer(
          child: DSV3Button(
            label: 'Default',
            variant: variant,
            onPressed: () {},
          ),
        ),
        IgnorePointer(
          child: DSV3Button(
            label: 'Hover',
            variant: variant,
            onPressed: () {},
            stateOverride: DSV3ButtonState.hover,
          ),
        ),
        IgnorePointer(
          child: DSV3Button(
            label: 'Pressed',
            variant: variant,
            onPressed: () {},
            stateOverride: DSV3ButtonState.pressed,
          ),
        ),
        IgnorePointer(
          child: DSV3Button(
            label: 'Disabled',
            variant: variant,
            onPressed: null,
          ),
        ),
        IgnorePointer(
          child: DSV3Button(
            label: 'Loading',
            variant: variant,
            onPressed: () {},
            stateOverride: DSV3ButtonState.loading,
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
              child: DSV3Card(
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
              child: DSV3Card(
                tone: DSV3CardTone.elevated,
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
              child: DSV3Card(
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
        const SizedBox(height: DSV3Spacing.md),
        SizedBox(
          width: 260,
          child: DSV3Card(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(DSV3Spacing.cardRadius),
                ),
                  child: Container(
                    height: 120,
                    color: DSV3Colors.neutral200,
                    alignment: Alignment.center,
                    child: Text(
                      'Image',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(DSV3Spacing.lg),
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
        const SizedBox(height: DSV3Spacing.xl),
      ],
    );
  }

  Widget _buildInputsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSV3Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Text Fields',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              const DSV3TextField(
                label: 'Default',
                hintText: 'Enter text',
              ),
              const SizedBox(height: 12),
              const DSV3TextField(
                label: 'Focused',
                hintText: 'Active state',
              ),
              const SizedBox(height: 12),
              const DSV3TextField(
                label: 'Error',
                hintText: 'Something went wrong',
                errorText: 'Please check your input',
              ),
              const SizedBox(height: 12),
              const DSV3TextField(
                label: 'Disabled',
                hintText: 'Disabled',
                enabled: false,
              ),
            ],
          ),
        ),
        const SizedBox(height: DSV3Spacing.md),
        DSV3Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dropdown / Select',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              DSV3Dropdown<String>(
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
        const SizedBox(height: DSV3Spacing.md),
        DSV3Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Checkbox / Radio / Switch',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              DSV3CheckboxTile(
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
                  DSV3RadioTile<int>(
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
                  DSV3RadioTile<int>(
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
              DSV3SwitchTile(
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
        const SizedBox(height: DSV3Spacing.md),
        DSV3Card(
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
        const SizedBox(height: DSV3Spacing.md),
        DSV3Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Search Field',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              const DSV3SearchField(hintText: 'Search components'),
            ],
          ),
        ),
        const SizedBox(height: DSV3Spacing.md),
        DSV3Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sliders', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              DSV3Slider(
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
        const SizedBox(height: DSV3Spacing.xl),
      ],
    );
  }

  Widget _buildNavigationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DSV3Spacing.horizontalPadding,
            vertical: DSV3Spacing.verticalPadding,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius:
                BorderRadius.circular(DSV3Spacing.componentRadius),
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
        const SizedBox(height: DSV3Spacing.md),
        DSV3Card(
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
        const SizedBox(height: DSV3Spacing.md),
        DSV3BottomNavBar(
          items: const [
            DSV3NavItem(icon: Iconsax.home_2, label: 'Home'),
            DSV3NavItem(icon: Iconsax.folder, label: 'Projects'),
            DSV3NavItem(icon: Iconsax.calendar_1, label: 'Plan'),
            DSV3NavItem(icon: Iconsax.user, label: 'Profile'),
          ],
          currentIndex: 0,
          onTap: (_) {},
        ),
        const SizedBox(height: DSV3Spacing.md),
        DSV3Sidebar(
          items: const [
            DSV3NavItem(icon: Iconsax.category, label: 'Dashboard'),
            DSV3NavItem(icon: Iconsax.note_2, label: 'Notes'),
            DSV3NavItem(icon: Iconsax.calendar_1, label: 'Calendar'),
            DSV3NavItem(icon: Iconsax.setting_2, label: 'Settings'),
          ],
        ),
        const SizedBox(height: DSV3Spacing.xl),
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
            DSV3Button(
              label: 'Open Modal',
              onPressed: () {
                DSV3Modal.show(
                  context: context,
                  title: 'Confirm action',
                  content: const Text('This will update the system state.'),
                  actions: [
                    DSV3Button(
                      label: 'Cancel',
                      variant: DSV3ButtonVariant.tertiary,
                      onPressed: () => Navigator.pop(context),
                    ),
                    DSV3Button(
                      label: 'Confirm',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
            ),
            DSV3Button(
              label: 'Bottom Sheet',
              variant: DSV3ButtonVariant.secondary,
              onPressed: () {
                DSV3BottomSheet.show(
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
            DSV3Button(
              label: 'Toast',
              variant: DSV3ButtonVariant.text,
              onPressed: () {
                DSV3Toast.show(
                  context: context,
                  message: 'Saved to your workspace.',
                );
              },
            ),
          ],
        ),
        const SizedBox(height: DSV3Spacing.md),
        const DSV3InlineModal(
          title: 'Dialog Preview',
          body: 'A static modal preview with 16px radius and no shadow.',
        ),
        const SizedBox(height: DSV3Spacing.md),
        Container(
          padding: const EdgeInsets.all(DSV3Spacing.lg),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius:
                BorderRadius.circular(DSV3Spacing.componentRadius),
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
                      color: DSV3Colors.neutral300,
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
        const SizedBox(height: DSV3Spacing.md),
        Row(
          children: [
            const DSV3Tooltip(
              message: 'Tooltip text',
              child: Icon(Iconsax.info_circle),
            ),
            const SizedBox(width: 8),
            Text('Tooltip example',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: DSV3Spacing.xl),
      ],
    );
  }

  Widget _buildListsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSV3Card(
          child: Column(
            children: [
              DSV3ListTile(
                title: 'List item one',
                subtitle: 'Supporting text goes here',
                leading: const Icon(Iconsax.folder_2),
                trailing: const Icon(Iconsax.arrow_right_3, size: 16),
                onTap: () {},
              ),
              const DSV3Divider(length: double.infinity),
              DSV3ListTile(
                title: 'List item two',
                subtitle: 'Secondary line',
                leading: const Icon(Iconsax.document_text),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: DSV3Spacing.md),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            const DSV3Chip(label: 'Chip'),
            DSV3Chip(label: 'Removable', onDeleted: () {}),
            const DSV3Badge(label: 'New'),
            const DSV3Badge(label: 'Success', variant: DSV3BadgeVariant.success),
            const DSV3Badge(label: 'Error', variant: DSV3BadgeVariant.error),
          ],
        ),
        const SizedBox(height: DSV3Spacing.md),
        Row(
          children: [
            const Text('A'),
            const SizedBox(width: 8),
            const DSV3Divider(vertical: true, length: 18),
            const SizedBox(width: 8),
            const Text('B'),
          ],
        ),
        const SizedBox(height: DSV3Spacing.md),
        const DSV3ProgressBar(value: 0.7),
        const SizedBox(height: DSV3Spacing.md),
        DSV3EmptyState(
          title: 'No items yet',
          description: 'Create your first entry to see it here.',
          icon: Iconsax.archive_1,
          action: DSV3Button(label: 'Create', onPressed: () {}),
        ),
        const SizedBox(height: DSV3Spacing.xl),
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
        const SizedBox(height: DSV3Spacing.md),
        Wrap(
          spacing: 12,
          children: [
            Icon(
              Iconsax.flash_1,
              color: Theme.of(context).brightness == Brightness.dark
                  ? DSV3Colors.white
                  : DSV3Colors.black,
            ),
            const Icon(Iconsax.flash_1, color: DSV3Colors.neutral500),
            const Icon(Iconsax.flash_1, color: DSV3Colors.orange500),
            const Icon(Iconsax.flash_1, color: DSV3Colors.teal500),
            const Icon(Iconsax.flash_1, color: DSV3Colors.premiumGreen),
            const Icon(Iconsax.flash_1, color: DSV3Colors.premiumRed),
          ],
        ),
        const SizedBox(height: DSV3Spacing.md),
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
        const SizedBox(height: DSV3Spacing.xl),
      ],
    );
  }

  Widget _buildAnimationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSV3Card(
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
                  color: DSV3Colors.orange500,
                  borderRadius:
                      BorderRadius.circular(DSV3Spacing.componentRadius),
                ),
              ),
              const SizedBox(height: 12),
              DSV3Button(
                label: _transitionToggled ? 'Reset' : 'Animate',
                variant: DSV3ButtonVariant.secondary,
                onPressed: () {
                  setState(() {
                    _transitionToggled = !_transitionToggled;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: DSV3Spacing.md),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            DSV3GridLoader(size: 28),
            DSV3GridLoader(size: 44),
            const DSV3ProgressBar(value: 0.4),
          ],
        ),
        const SizedBox(height: DSV3Spacing.md),
        const Row(
          children: [
            DSV3SuccessIcon(),
            SizedBox(width: 24),
            DSV3ErrorIcon(),
          ],
        ),
        const SizedBox(height: DSV3Spacing.xl),
      ],
    );
  }
}
