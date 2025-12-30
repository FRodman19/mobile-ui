import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_card.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'My learning path',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, size: 24),
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
                _buildFilterChip('All', 1),
                _buildFilterChip('Paused', 2),
                _buildFilterChip('Completed', 3),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Skill cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildSkillCard(
                  icon: '🐍',
                  name: 'Python for Data Science',
                  milestone: 'Pandas Library Basics',
                  progress: 0.65,
                  timeThisWeek: '4.5h this week',
                  nextSession: 'Today @ 18:00',
                ),
                const SizedBox(height: 12),
                _buildSkillCard(
                  icon: '🎤',
                  name: 'Public Speaking',
                  milestone: 'Impromptu Speech Drills',
                  progress: 0.30,
                  timeThisWeek: '1h 20m this week',
                  nextSession: 'Tomorrow @ 09:00',
                ),
                const SizedBox(height: 12),
                _buildSkillCard(
                  icon: '🌮',
                  name: 'Spanish Language',
                  milestone: 'Conversational Fluency',
                  progress: 0.80,
                  timeThisWeek: '3h this week',
                  nextSession: 'Fri @ 12:00',
                ),
                const SizedBox(height: 12),
                _buildSkillCard(
                  icon: '🎹',
                  name: 'Jazz Piano',
                  milestone: 'Major Scales',
                  progress: 0.0,
                  timeThisWeek: '0h this week',
                  nextSession: 'Schedule',
                  isUnstarted: true,
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

  Widget _buildSkillCard({
    required String icon,
    required String name,
    required String milestone,
    required double progress,
    required String timeThisWeek,
    required String nextSession,
    bool isUnstarted = false,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                icon,
                style: const TextStyle(fontSize: 32),
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
                        const Icon(Icons.flag_outlined, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          milestone,
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
              Text(
                '${(progress * 100).toInt()}%',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 5,
              backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(
                isUnstarted ? Colors.grey : const Color(0xFF1DB954),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Time and next session
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 14,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                timeThisWeek,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              Icon(
                isUnstarted ? Icons.schedule : Icons.calendar_today_outlined,
                size: 14,
                color: isUnstarted ? const Color(0xFF1DB954) : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                nextSession,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: isUnstarted ? const Color(0xFF1DB954) : Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: isUnstarted ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
