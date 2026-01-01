import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/foundation/gol_colors.dart';
import 'home_dashboard_screen.dart';
import 'projects_screen.dart';
import 'skills_screen.dart';
import 'content_screen.dart';
import 'performance_screen.dart';
import 'assistant_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeDashboardScreen(),
    ProjectsScreen(),
    SkillsScreen(),
    ContentScreen(),
    PerformanceScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void _openAssistant() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AssistantScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: colors.borderDefault)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: colors.backgroundPrimary,
          selectedItemColor: colors.interactivePrimary,
          unselectedItemColor: colors.textSecondary,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          elevation: 0,
          enableFeedback: false,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home_2),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.folder),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.book),
              label: 'Skills',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.document),
              label: 'Content',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.chart),
              label: 'Performance',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAssistant,
        backgroundColor: colors.interactivePrimary,
        elevation: 4,
        child: Icon(Iconsax.cpu, color: colors.textInverse, size: 24),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
