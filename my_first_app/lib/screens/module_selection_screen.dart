import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_dashboard_screen.dart';

class ModuleSelectionScreen extends StatefulWidget {
  const ModuleSelectionScreen({super.key});

  @override
  State<ModuleSelectionScreen> createState() => _ModuleSelectionScreenState();
}

class _ModuleSelectionScreenState extends State<ModuleSelectionScreen> {
  final Map<String, bool> _modules = {
    'Skills': true,
    'Projects (Ventures)': true,
    'Performance Tracker': true,
    'Content Creation': false,
    'AI Assistant': true,
  };

  final Map<String, Map<String, dynamic>> _moduleDetails = {
    'Skills': {
      'icon': Icons.school_outlined,
      'color': const Color(0xFF10B981),
      'subtitle': 'Master skills through practice',
      'description': 'Track sessions, earn milestones',
    },
    'Projects (Ventures)': {
      'icon': Icons.rocket_launch_outlined,
      'color': const Color(0xFF8B5CF6),
      'subtitle': 'Execute ideas into reality',
      'description': 'Manage tasks, goals, milestones',
    },
    'Performance Tracker': {
      'icon': Icons.trending_up,
      'color': const Color(0xFFF59E0B),
      'subtitle': 'Monitor campaign profitability',
      'description': 'Track revenue, spend, ROI',
    },
    'Content Creation': {
      'icon': Icons.edit_note,
      'color': const Color(0xFFEC4899),
      'subtitle': 'AI-powered content generation',
      'description': 'Create posts, flyers, copy',
    },
    'AI Assistant': {
      'icon': Icons.smart_toy_outlined,
      'color': const Color(0xFF3B82F6),
      'subtitle': 'Smart suggestions & automation',
      'description': 'Recommended for all users',
    },
  };

  int get selectedCount => _modules.values.where((v) => v).length;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Choose Your Modules',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeDashboardScreen(),
                ),
              );
            },
            child: Text(
              'Skip',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What Do You Want to Build?',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                      height: 1.2,
                    ),
                  ).animate().fadeIn(delay: 100.ms),
                  const SizedBox(height: 12),
                  Text(
                    'Select the modules you\'ll use.\nYou can change this anytime.',
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      color: colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ).animate().fadeIn(delay: 200.ms),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _modules.updateAll((key, value) => true);
                          });
                        },
                        child: Text(
                          'Select All',
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _modules.updateAll((key, value) => false);
                          });
                        },
                        child: Text(
                          'Deselect All',
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(delay: 300.ms),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _modules.length,
                itemBuilder: (context, index) {
                  final entry = _modules.entries.elementAt(index);
                  final details = _moduleDetails[entry.key]!;
                  return _buildModuleCard(
                    entry.key,
                    entry.value,
                    details,
                    colorScheme,
                    index,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'You selected $selectedCount module${selectedCount != 1 ? 's' : ''}',
                            style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [colorScheme.primary, colorScheme.secondary],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: selectedCount > 0
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeDashboardScreen(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        disabledBackgroundColor:
                            colorScheme.surfaceContainerHighest,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Continue',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: selectedCount > 0
                                  ? Colors.white
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: selectedCount > 0
                                ? Colors.white
                                : colorScheme.onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard(
    String title,
    bool isSelected,
    Map<String, dynamic> details,
    ColorScheme colorScheme,
    int index,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected
              ? details['color']
              : colorScheme.surfaceContainerHighest,
          width: 2,
        ),
        color: isSelected
            ? details['color'].withOpacity(0.1)
            : colorScheme.surfaceContainerHighest,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _modules[title] = !_modules[title]!;
          });
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: details['color'].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  details['icon'],
                  color: details['color'],
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      details['subtitle'],
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    _modules[title] = value ?? false;
                  });
                },
                activeColor: details['color'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (400 + index * 100).ms, duration: 400.ms)
        .slideX(begin: 0.2, end: 0);
  }
}
