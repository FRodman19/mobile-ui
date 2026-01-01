import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

    final List<Widget> _screens = [
      const HomeDashboardScreen(),
    const ProjectsScreen(),
    const SkillsScreen(),
    const ContentScreen(),
    const PerformanceScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openAssistant() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AssistantScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isDark ? const Color(0xFF282828) : const Color(0xFFE0E0E0),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: isDark ? Colors.black : Colors.white,
          selectedItemColor: const Color(0xFF1DB954),
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          selectedFontSize: 11,
          unselectedFontSize: 11,
          selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.inter(),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 24),
              activeIcon: Icon(Icons.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined, size: 24),
              activeIcon: Icon(Icons.folder, size: 24),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined, size: 24),
              activeIcon: Icon(Icons.school, size: 24),
              label: 'Skills',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined, size: 24),
              activeIcon: Icon(Icons.description, size: 24),
              label: 'Content',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined, size: 24),
              activeIcon: Icon(Icons.bar_chart, size: 24),
              label: 'Performance',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAssistant,
        backgroundColor: const Color(0xFF1DB954),
        elevation: 4,
        child: const Icon(Icons.smart_toy, color: Colors.black, size: 26),
      ),
    );
  }
}
