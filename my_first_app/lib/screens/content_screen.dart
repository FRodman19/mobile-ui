import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_card.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Content',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 24),
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
                _buildFilterChip('All', 0),
                _buildFilterChip('YouTube', 1),
                _buildFilterChip('TikTok', 2),
                _buildFilterChip('Blog', 3),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Content sections
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                // IDEAS Section
                _buildSectionHeader('IDEAS', 3),
                const SizedBox(height: 12),
                _buildContentCard(
                  platform: 'YouTube',
                  platformIcon: Icons.play_circle_outline,
                  tag: 'Coding Skill',
                  title: 'AI Automation Video',
                  action: 'Start Outline',
                  actionIcon: Icons.edit_outlined,
                ),
                const SizedBox(height: 12),
                _buildContentCard(
                  platform: 'TikTok',
                  platformIcon: Icons.music_note,
                  tag: 'Personal Brand',
                  title: 'Day in the life of a dev',
                  action: 'Brainstorm Hooks',
                  actionIcon: Icons.lightbulb_outline,
                ),

                const SizedBox(height: 24),

                // SCRIPT Section
                _buildSectionHeader('SCRIPT', 1),
                const SizedBox(height: 12),
                _buildContentCard(
                  platform: 'Blog',
                  platformIcon: Icons.description_outlined,
                  tag: 'Project Alpha',
                  title: 'Q3 Project Update: Lessons Learned',
                  action: 'Finalize Draft',
                  actionIcon: Icons.check_circle_outline,
                ),

                const SizedBox(height: 24),

                // EDIT Section
                _buildSectionHeader('EDIT', 2),
                const SizedBox(height: 12),
                _buildContentCard(
                  platform: 'YouTube',
                  platformIcon: Icons.play_circle_outline,
                  tag: 'Coding',
                  title: 'Building a SaaS in 24 Hours',
                  action: 'Cut A-Roll',
                  actionIcon: Icons.content_cut,
                  progress: 0.70,
                ),
                const SizedBox(height: 12),
                _buildContentCard(
                  platform: 'Facebook',
                  platformIcon: Icons.facebook,
                  tag: 'Community',
                  title: 'Weekly Live Stream Promo',
                  action: 'Create Thumbnail',
                  actionIcon: Icons.image_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1DB954),
        child: const Icon(Icons.add, color: Colors.black),
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

  Widget _buildSectionHeader(String title, int count) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: const BoxDecoration(
            color: Color(0xFF1DB954),
            shape: BoxShape.circle,
          ),
          constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
          child: Center(
            child: Text(
              count.toString(),
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard({
    required String platform,
    required IconData platformIcon,
    required String tag,
    required String title,
    required String action,
    required IconData actionIcon,
    double? progress,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(platformIcon, size: 16, color: const Color(0xFF1DB954)),
                    const SizedBox(width: 6),
                    Text(
                      platform,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1DB954),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tag,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(actionIcon, size: 14, color: const Color(0xFF1DB954)),
                    const SizedBox(width: 6),
                    Text(
                      action,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFF1DB954),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (progress != null) ...[
                      const SizedBox(width: 12),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
                if (progress != null) ...[
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 4,
                      backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1DB954)),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              platformIcon,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
