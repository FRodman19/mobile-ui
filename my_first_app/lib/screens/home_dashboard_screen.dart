import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_card.dart';

class HomeDashboardContent extends StatelessWidget {
  const HomeDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MONDAY, OCT 24',
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              'Dashboard',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          if (kDebugMode)
            IconButton(
              icon: const Icon(Icons.palette_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/design-system');
              },
              tooltip: 'Design System Gallery',
            ),
          if (kDebugMode)
            IconButton(
              icon: const Icon(Icons.layers_outlined),
              onPressed: () {
                Navigator.pushNamed(context, '/design-system-v3');
              },
              tooltip: 'Design System V3',
            ),
          IconButton(
            icon: const Icon(Icons.brush),
            onPressed: () {
              Navigator.pushNamed(context, '/design-system-v2');
            },
            tooltip: 'Design System V2',
          ),

          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Actions
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Text(
                'Quick Actions',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildQuickAction(
                    context,
                    Icons.rocket_launch_outlined,
                    'New\nProject',
                  ),
                  _buildQuickAction(
                    context,
                    Icons.school_outlined,
                    'New\nSkill',
                  ),
                  _buildQuickAction(
                    context,
                    Icons.edit_outlined,
                    'New\nContent',
                  ),
                  _buildQuickAction(context, Icons.bar_chart, 'Daily\nEntry'),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Today's Focus
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today\'s Focus',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: const Color(0xFF1DB954),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildFocusTask(
                    context,
                    'Complete Project Strategy',
                    'Projects • High Priority',
                  ),
                  const SizedBox(height: 8),
                  _buildFocusTask(
                    context,
                    'Read "Clean Code" Ch. 4',
                    'Skills • 30 mins',
                  ),
                  const SizedBox(height: 8),
                  _buildFocusTask(
                    context,
                    'Review Q3 Metrics',
                    'Performance • Weekly',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // System Overview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'System Overview',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildOverviewCard(
                          context,
                          Icons.folder_outlined,
                          'PROJECTS',
                          '3',
                          'Active ventures',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildOverviewCard(
                          context,
                          Icons.school_outlined,
                          'SKILLS',
                          '2',
                          'In progress',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildOverviewCard(
                          context,
                          Icons.description_outlined,
                          'CONTENT',
                          '5',
                          'Drafts pending',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildOverviewCard(
                          context,
                          Icons.bar_chart,
                          'PERF.',
                          '94%',
                          'Weekly score',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(BuildContext context, IconData icon, String label) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF121212) : const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF1DB954), size: 26),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 10, height: 1.2),
          ),
        ],
      ),
    );
  }

  Widget _buildFocusTask(BuildContext context, String title, String metadata) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(
                  context,
                ).colorScheme.onSurfaceVariant.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  metadata,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(
    BuildContext context,
    IconData icon,
    String title,
    String metric,
    String subtitle,
  ) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF1DB954), size: 24),
          const SizedBox(height: 16),
          Text(
            metric,
            style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
