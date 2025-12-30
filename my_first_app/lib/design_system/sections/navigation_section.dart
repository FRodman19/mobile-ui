import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';
import '../../widgets/app_tabs.dart';
import '../../widgets/app_navbar.dart';
import '../../widgets/app_badge.dart';

class NavigationSection extends StatefulWidget {
  const NavigationSection({super.key});

  @override
  State<NavigationSection> createState() => _NavigationSectionState();
}

class _NavigationSectionState extends State<NavigationSection> {
  int _currentTabIndex = 0;
  int _currentNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Navigation',
          subtitle: 'Bottom navigation, app bars, and tab bars.',
        ),

        ComponentShowcase(
          title: 'Bottom Navigation Bar',
          description: '3-5 items with icons and labels',
          specs: {
            'Height': '56dp',
            'Icon Size': '24dp',
            'Label Size': '12sp',
          },
          children: [
            Container(
              height: 56,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor(Theme.of(context).brightness)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', true),
                  _buildNavItem(Icons.folder, 'Projects', false),
                  _buildNavItem(Icons.school, 'Skills', false),
                  _buildNavItem(Icons.bar_chart, 'Stats', false),
                ],
              ),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Tab Bars',
          description: 'Various tab styles with 16px radius',
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Standard Tabs',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: AppSpacing.stackXs),
                AppTabs(
                  tabs: const [
                    AppTabItem(label: 'Home', icon: Icons.home),
                    AppTabItem(label: 'Explore', icon: Icons.explore),
                    AppTabItem(label: 'Profile', icon: Icons.person),
                  ],
                  currentIndex: _currentTabIndex,
                  onTabChanged: (index) => setState(() => _currentTabIndex = index),
                ),
                SizedBox(height: AppSpacing.stackMd),
                Text(
                  'Pill Tabs',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: AppSpacing.stackXs),
                AppTabsPill(
                  tabs: [
                    const AppTabItem(label: 'All'),
                    AppTabItem(label: 'Active', badge: const AppBadgeSuccess(label: '3', type: BadgeType.count, size: BadgeSize.small)),
                    const AppTabItem(label: 'Completed'),
                  ],
                  currentIndex: _currentTabIndex,
                  onTabChanged: (index) => setState(() => _currentTabIndex = index),
                ),
              ],
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Bottom Navigation',
          description: 'Bottom navigation bars with design system styling',
          children: [
            Column(
              children: [
                Text(
                  'Standard Bottom Nav',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: AppSpacing.stackXs),
                AppBottomNavBar(
                  items: const [
                    AppNavItem(label: 'Home', icon: Icons.home),
                    AppNavItem(label: 'Projects', icon: Icons.folder),
                    AppNavItem(label: 'Skills', icon: Icons.school),
                    AppNavItem(label: 'Stats', icon: Icons.bar_chart),
                  ],
                  currentIndex: _currentNavIndex,
                  onTabChanged: (index) => setState(() => _currentNavIndex = index),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
          weight: 600,  // Thicker icons
          color: isActive ? AppColors.teal500 : Colors.grey,  // Sage green
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? AppColors.teal500 : Colors.grey,  // Sage green
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
