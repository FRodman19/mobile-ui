import 'package:flutter/material.dart';
import '../design_system_v2/theme_v2.dart';
import '../design_system_v2/buttons.dart';
import '../design_system_v2/cards.dart';
import '../design_system_v2/inputs.dart';
import '../design_system_v2/chips.dart';
import '../design_system_v2/modals.dart';
import '../design_system_v2/badges.dart';
import '../design_system_v2/progress.dart';
import '../design_system_v2/tooltips.dart';
import '../design_system_v2/dividers.dart';
import '../design_system_v2/extras.dart';
import '../design_system_v2/toggles.dart';
import '../design_system_v2/sliders.dart';
import '../design_system_v2/keypads.dart';
import '../design_system_v2/lists.dart';
import '../design_system_v2/callouts.dart';
import '../design_system_v2/navigation_alternatives.dart';
import '../widgets/app_tabs.dart';

class DesignSystemV2GalleryScreen extends StatefulWidget {
  const DesignSystemV2GalleryScreen({super.key});

  @override
  State<DesignSystemV2GalleryScreen> createState() =>
      _DesignSystemV2GalleryScreenState();
}

class _DesignSystemV2GalleryScreenState
    extends State<DesignSystemV2GalleryScreen>
    with TickerProviderStateMixin {
  int _currentTabIndex = 0;
  int _currentPillTabIndex = 0;

  // Toggles state
  bool _checkboxValue = false;
  int _radioValue = 1;
  bool _switchValue = false;
  double _sliderValue = 0.5;
  String? _dropdownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use system brightness to determine dark mode
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    // Wrap the entire gallery in a Theme using DSV2Theme based on system settings
    return Theme(
      data: isDarkMode ? DSV2Theme.darkTheme : DSV2Theme.lightTheme,
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text(
                'Design System V2 Gallery',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              iconTheme: IconThemeData(
                color: Theme.of(context).iconTheme.color,
              ),
              actions: [
                // Show current theme mode (informational only)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isDarkMode ? Icons.dark_mode : Icons.light_mode,
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
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, 'Typography'),
                  DSV2Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Display Large (Sora)',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          'Headline Medium (Sora)',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Body Medium (Open Sans)',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Buttons & FAB'),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DSV2Button(label: 'Primary', onPressed: () {}),
                      DSV2Button(
                        label: 'Secondary',
                        type: DSV2ButtonType.secondary,
                        onPressed: () {},
                      ),
                      DSV2Button(
                        label: 'Tertiary',
                        type: DSV2ButtonType.tertiary,
                        onPressed: () {},
                      ),
                      DSV2Button(
                        label: 'Small',
                        size: DSV2ButtonSize.small,
                        onPressed: () {},
                      ),
                      DSV2Button(
                        label: 'Icon',
                        icon: Icons.add,
                        onPressed: () {},
                      ),
                      DSV2FAB(onPressed: () {}, icon: Icons.add, mini: true),
                      DSV2FAB(
                        onPressed: () {},
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Inputs & Dropdowns'),
                  DSV2Card(
                    child: Column(
                      children: [
                        const DSV2Input(hintText: 'Simple Input'),
                        const SizedBox(height: 16),
                        const DSV2Input(
                          hintText: 'With Icon',
                          prefixIcon: Icons.search,
                        ),
                        const SizedBox(height: 16),
                        DSV2Dropdown<String>(
                          label: 'Select Option',
                          value: _dropdownValue,
                          items: const [
                            DropdownMenuItem(
                              value: '1',
                              child: Text('Option 1'),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text('Option 2'),
                            ),
                          ],
                          onChanged: (v) {
                            setState(() {
                              _dropdownValue = v;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Toggles & Sliders'),
                  DSV2Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DSV2Checkbox(
                          value: _checkboxValue,
                          onChanged: (v) =>
                              setState(() => _checkboxValue = v ?? false),
                          label: 'Checkbox Option',
                        ),
                        Row(
                          children: [
                            DSV2Radio<int>(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: (v) =>
                                  setState(() => _radioValue = v!),
                              label: 'Option 1',
                            ),
                            const SizedBox(width: 16),
                            DSV2Radio<int>(
                              value: 2,
                              groupValue: _radioValue,
                              onChanged: (v) =>
                                  setState(() => _radioValue = v!),
                              label: 'Option 2',
                            ),
                          ],
                        ),
                        DSV2Switch(
                          value: _switchValue,
                          onChanged: (v) => setState(() => _switchValue = v),
                          label: 'Switch Option',
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Slider Value: ${_sliderValue.toStringAsFixed(1)}',
                        ),
                        DSV2Slider(
                          value: _sliderValue,
                          onChanged: (v) => setState(() => _sliderValue = v),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Chips & Badges'),
                  Wrap(
                    spacing: 16,
                    children: [
                      const DSV2Chip(label: 'Standard Chip'),
                      DSV2Chip(label: 'Deletable', onDelete: () {}),
                      const DSV2Badge(label: 'Status'),
                      const DSV2Badge(label: 'Error', isError: true),
                      DSV2Badge(
                        label: '9+',
                        child: IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Modals & Tooltips'),
                  Row(
                    children: [
                      DSV2Button(
                        label: 'Open Modal',
                        onPressed: () {
                          DSV2Modal.show(
                            context: context,
                            title: 'Confirm Action',
                            content: const Text(
                              'Are you sure you want to proceed with this action?',
                            ),
                            actions: [
                              DSV2Button(
                                label: 'Cancel',
                                type: DSV2ButtonType.tertiary,
                                onPressed: () => Navigator.pop(context),
                              ),
                              const SizedBox(width: 8),
                              DSV2Button(
                                label: 'Confirm',
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      const DSV2Tooltip(
                        message: 'This is a tooltip',
                        child: Icon(Icons.info_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Progress Indicators'),
                  const SizedBox(height: 16),
                  const DSV2ProgressBar(value: 0.7),
                  const SizedBox(height: 16),
                  const Center(child: DSV2CircularProgress()),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Feedback & Callouts'),
                  Column(
                    children: const [
                      DSV2Callout(
                        text: 'This is an info callout',
                        type: DSV2CalloutType.info,
                      ),
                      SizedBox(height: 8),
                      DSV2Callout(
                        text: 'Warning: Check this out',
                        type: DSV2CalloutType.warning,
                      ),
                      SizedBox(height: 8),
                      DSV2Callout(
                        text: 'Success! Operation completed.',
                        type: DSV2CalloutType.success,
                      ),
                      SizedBox(height: 8),
                      DSV2Callout(
                        text: 'Error occurred.',
                        type: DSV2CalloutType.error,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Numeric Keypad'),
                  DSV2Card(
                    child: DSV2Keypad(
                      onKeyPress: (val) {
                        debugPrint('Key pressed: $val');
                      },
                      onDelete: () {
                        debugPrint('Delete pressed');
                      },
                      biometricEnabled: true,
                      onBiometricPress: () {
                        debugPrint('Biometric pressed');
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Lists & Dividers'),
                  DSV2Card(
                    child: Column(
                      children: [
                        DSV2ListTile(
                          title: 'List Item 1',
                          subtitle: 'Description for item 1',
                          leading: const Icon(Icons.star),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {},
                        ),
                        const DSV2Divider(),
                        DSV2ListTile(
                          title: 'List Item 2',
                          leading: const Icon(Icons.person),
                          onTap: () {},
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('A'),
                            SizedBox(
                              height: 20,
                              child: DSV2Divider(vertical: true),
                            ),
                            Text('B'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle(context, 'Tab Styles (from V1)'),

                  // Standard Tabs
                  Text(
                    'Standard Tabs:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  AppTabs(
                    tabs: const [
                      AppTabItem(label: 'Tab A', icon: Icons.home),
                      AppTabItem(label: 'Tab B', icon: Icons.favorite),
                      AppTabItem(label: 'Tab C', icon: Icons.settings),
                    ],
                    currentIndex: _currentTabIndex,
                    onTabChanged: (index) {
                      setState(() {
                        _currentTabIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 24),

                  // Pill Tabs
                  Text(
                    'Pill Tabs:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  AppTabsPill(
                    tabs: const [
                      AppTabItem(label: 'Tab A'),
                      AppTabItem(label: 'Tab B'),
                      AppTabItem(label: 'Tab C'),
                    ],
                    currentIndex: _currentPillTabIndex,
                    onTabChanged: (index) {
                      setState(() {
                        _currentPillTabIndex = index;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  // Floating Nav Bar Demo (visual only)
                  DSV2FloatingBottomNavBar(
                    currentIndex: 0,
                    onTap: (i) {},
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                    ],
                  ),

                  // Standard Nav Bar (Legacy/V2 Standard)
                  const SizedBox(height: 16),
                  const Text('Standard Bottom Nav:'),
                  DSV2BottomNavBar(
                    currentIndex: 0,
                    onTap: (i) {},
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
