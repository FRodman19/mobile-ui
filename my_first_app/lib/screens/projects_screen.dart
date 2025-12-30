import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  int _selectedFilter = 0;

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
              'Projects',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Manage your ventures',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter tabs
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFilterChip('Active', 0),
                _buildFilterChip('All Projects', 1),
                _buildFilterChip('Preparing', 2),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Project cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProjectCard(
                  icon: Icons.rocket_launch,
                  name: 'NeoMarket App',
                  status: 'Preparing',
                  statusColor: Colors.blue,
                  progress: 0.85,
                  message: 'Market analysis complete. Pending budget approval for Q4 launch sequence.',
                ),
                const SizedBox(height: 12),
                _buildProjectCard(
                  icon: Icons.shopping_bag_outlined,
                  name: 'EcoStore',
                  status: 'Launched',
                  statusColor: const Color(0xFF1DB954),
                  progress: 1.0,
                  message: 'User growth +15% this week. Retention metrics exceeding baseline.',
                ),
                const SizedBox(height: 12),
                _buildProjectCard(
                  icon: Icons.brush_outlined,
                  name: 'Brand Redesign',
                  status: 'Paused',
                  statusColor: Colors.orange,
                  progress: 0.45,
                  message: 'Waiting for new creative direction assets from agency.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, int index) {
    final isSelected = _selectedFilter == index;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = index;
          });
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedColor: const Color(0xFF1DB954),
        labelStyle: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.black : Theme.of(context).colorScheme.onSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide.none,
      ),
    );
  }

  Widget _buildProjectCard({
    required IconData icon,
    required String name,
    required String status,
    required Color statusColor,
    required double progress,
    required String message,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF1DB954).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF1DB954), size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          status,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1DB954).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'READY',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1DB954),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1DB954)),
            ),
          ),

          const SizedBox(height: 12),

          // Status message
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
