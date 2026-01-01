import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/components/gol_chips.dart';
import '../grow_out_loud/components/gol_progress.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  String _selectedFilter = 'Active';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: colors.backgroundPrimary,
        elevation: 0,
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills',
              style: textTheme.headlineLarge?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: GOLSpacing.space1),
            Text(
              'My learning path',
              style: textTheme.bodySmall?.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.search_normal),
            onPressed: () {},
            color: colors.textSecondary,
          ),
          IconButton(
            icon: const Icon(Iconsax.user),
            onPressed: () {},
            color: colors.textSecondary,
          ),
          const SizedBox(width: GOLSpacing.space2),
        ],
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: GOLSpacing.screenPaddingHorizontal,
              vertical: GOLSpacing.space3,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _selectedFilter = 'Active'),
                    child: GOLChip(
                      label: 'Active',
                      selected: _selectedFilter == 'Active',
                    ),
                  ),
                  const SizedBox(width: GOLSpacing.space2),
                  GestureDetector(
                    onTap: () => setState(() => _selectedFilter = 'All'),
                    child: GOLChip(
                      label: 'All',
                      selected: _selectedFilter == 'All',
                    ),
                  ),
                  const SizedBox(width: GOLSpacing.space2),
                  GestureDetector(
                    onTap: () => setState(() => _selectedFilter = 'Paused'),
                    child: GOLChip(
                      label: 'Paused',
                      selected: _selectedFilter == 'Paused',
                    ),
                  ),
                  const SizedBox(width: GOLSpacing.space2),
                  GestureDetector(
                    onTap: () => setState(() => _selectedFilter = 'Completed'),
                    child: GOLChip(
                      label: 'Completed',
                      selected: _selectedFilter == 'Completed',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Skills List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
              children: [
                _SkillCard(
                  emoji: '🐍',
                  name: 'Python for Data Science',
                  milestone: 'Pandas Library Basics',
                  progress: 0.65,
                  timeThisWeek: '4.5h this week',
                  nextSession: 'Today @ 18:00',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.betweenCards),
                _SkillCard(
                  emoji: '🎤',
                  name: 'Public Speaking',
                  milestone: 'Impromptu Speech Drills',
                  progress: 0.30,
                  timeThisWeek: '1h 20m this week',
                  nextSession: 'Tomorrow @ 09:00',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.betweenCards),
                _SkillCard(
                  emoji: '🌮',
                  name: 'Spanish Language',
                  milestone: 'Conversational Fluency',
                  progress: 0.80,
                  timeThisWeek: '3h this week',
                  nextSession: 'Fri @ 12:00',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.betweenCards),
                _SkillCard(
                  emoji: '🎹',
                  name: 'Jazz Piano',
                  milestone: 'Major Scales',
                  progress: 0.0,
                  timeThisWeek: '0h this week',
                  nextSession: null,
                  colors: colors,
                  textTheme: textTheme,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colors.interactivePrimary,
        child: Icon(Iconsax.add, color: colors.textInverse),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final String emoji;
  final String name;
  final String milestone;
  final double progress;
  final String timeThisWeek;
  final String? nextSession;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _SkillCard({
    required this.emoji,
    required this.name,
    required this.milestone,
    required this.progress,
    required this.timeThisWeek,
    this.nextSession,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GOLCard(
      variant: GOLCardVariant.elevated,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and title on same line
          Row(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: GOLSpacing.space3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textTheme.headlineSmall?.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: GOLSpacing.space1),
                    Row(
                      children: [
                        Icon(
                          Iconsax.flag,
                          size: 14,
                          color: colors.textTertiary,
                        ),
                        const SizedBox(width: GOLSpacing.space1),
                        Text(
                          milestone,
                          style: textTheme.bodySmall?.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: textTheme.headlineMedium?.copyWith(
                  color: progress > 0 ? colors.interactivePrimary : colors.textTertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: GOLSpacing.space4),
          GOLLinearProgress(value: progress),
          const SizedBox(height: GOLSpacing.space4),
          Row(
            children: [
              Icon(Iconsax.clock, size: 16, color: colors.textTertiary),
              const SizedBox(width: GOLSpacing.space2),
              Text(
                timeThisWeek,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              const Spacer(),
              Icon(
                nextSession != null ? Iconsax.calendar : Iconsax.alarm,
                size: 16,
                color: colors.textTertiary,
              ),
              const SizedBox(width: GOLSpacing.space2),
              Text(
                nextSession ?? 'Schedule',
                style: textTheme.bodySmall?.copyWith(
                  color: nextSession != null ? colors.textSecondary : colors.interactivePrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
