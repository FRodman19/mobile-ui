import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/components/gol_chips.dart';
import '../grow_out_loud/components/gol_progress.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
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
              'Projects',
              style: textTheme.headlineLarge?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: GOLSpacing.space1),
            Text(
              'Manage your ventures',
              style: textTheme.bodySmall?.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.add_circle),
            onPressed: () {},
            color: colors.interactivePrimary,
            iconSize: 28,
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
                  _FilterChip(
                    label: 'Active',
                    selected: _selectedFilter == 'Active',
                    onTap: () => setState(() => _selectedFilter = 'Active'),
                    colors: colors,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: GOLSpacing.space2),
                  _FilterChip(
                    label: 'All Projects',
                    selected: _selectedFilter == 'All Projects',
                    onTap: () => setState(() => _selectedFilter = 'All Projects'),
                    colors: colors,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: GOLSpacing.space2),
                  _FilterChip(
                    label: 'Preparing',
                    selected: _selectedFilter == 'Preparing',
                    onTap: () => setState(() => _selectedFilter = 'Preparing'),
                    colors: colors,
                    textTheme: textTheme,
                  ),
                ],
              ),
            ),
          ),

          // Projects List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
              children: [
                _ProjectCard(
                  icon: Iconsax.rocket,
                  name: 'NeoMarket App',
                  status: 'Preparing',
                  statusColor: GOLPrimitives.info500,
                  progress: 0.85,
                  message: 'Market analysis complete. Pending budget approval for Q4 launch sequence.',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.betweenCards),
                _ProjectCard(
                  icon: Iconsax.shop,
                  name: 'EcoStore',
                  status: 'Launched',
                  statusColor: GOLPrimitives.success500,
                  progress: 1.0,
                  message: 'User growth +15% this week. Retention metrics exceeding baseline.',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.betweenCards),
                _ProjectCard(
                  icon: Iconsax.brush_2,
                  name: 'Brand Redesign',
                  status: 'Paused',
                  statusColor: GOLPrimitives.warning500,
                  progress: 0.45,
                  message: 'Waiting for new creative direction assets from agency.',
                  colors: colors,
                  textTheme: textTheme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GOLChip(
      label: label,
      selected: selected,
      onTap: onTap,
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String status;
  final Color statusColor;
  final double progress;
  final String message;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _ProjectCard({
    required this.icon,
    required this.name,
    required this.status,
    required this.statusColor,
    required this.progress,
    required this.message,
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
          Row(
            children: [
              Icon(icon, size: 32, color: colors.interactivePrimary),
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
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: GOLSpacing.space2),
                        Text(
                          status,
                          style: textTheme.labelMedium?.copyWith(
                            color: colors.textSecondary,
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
                    style: textTheme.headlineMedium?.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'READY',
                    style: textTheme.labelSmall?.copyWith(
                      color: colors.interactivePrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: GOLSpacing.space4),
          GOLLinearProgress(value: progress),
          const SizedBox(height: GOLSpacing.space4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                status == 'Paused' ? Iconsax.pause : Iconsax.info_circle,
                size: 16,
                color: colors.textTertiary,
              ),
              const SizedBox(width: GOLSpacing.space2),
              Expanded(
                child: Text(
                  message,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.textSecondary,
                    height: 1.5,
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
