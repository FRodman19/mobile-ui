import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/components/gol_badges.dart';
import '../grow_out_loud/components/gol_buttons.dart';
import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/components/gol_chips.dart';
import '../grow_out_loud/components/gol_progress.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';
import '../grow_out_loud/foundation/gol_radius.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: colors.backgroundPrimary,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MONDAY, OCT 24',
              style: textTheme.bodySmall?.copyWith(
                letterSpacing: 0.5,
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(height: GOLSpacing.space1),
            Text(
              'Dashboard',
              style: textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          if (kDebugMode)
            IconButton(
              icon: const Icon(Iconsax.brush),
              color: colors.textSecondary,
              onPressed: () => Navigator.pushNamed(context, '/design-system-v3'),
            ),
          IconButton(
            icon: const Icon(Iconsax.notification),
            color: colors.textSecondary,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: GOLSpacing.space4,
          vertical: GOLSpacing.space5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heroBanner(context, colors),
            const SizedBox(height: GOLSpacing.space6),
            _statsGrid(context, colors),
            const SizedBox(height: GOLSpacing.space6),
            _contentSection(context, colors),
            const SizedBox(height: GOLSpacing.space6),
            _aiSection(context, colors),
            const SizedBox(height: GOLSpacing.space6),
            _projectsSection(context, colors),
          ],
        ),
      ),
    );
  }

  Widget _heroBanner(BuildContext context, GOLSemanticColors colors) {
    return Container(
      decoration: BoxDecoration(
        color: colors.interactivePrimary,
        borderRadius: BorderRadius.circular(GOLRadius.lg),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            offset: Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
      padding: const EdgeInsets.all(GOLSpacing.space5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grow Out Loud',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: colors.textInverse,
                ),
          ),
          const SizedBox(height: GOLSpacing.space2),
          Text(
            'Today we have 3 prioritized initiatives. Stay focused, ship cleaner, and keep momentum.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.textInverse.withValues(alpha: 0.9),
                ),
          ),
          const SizedBox(height: GOLSpacing.space4),
          Row(
            children: [
              _heroChip(context, 'Focus Mode', Iconsax.flash_1, colors),
              const SizedBox(width: GOLSpacing.space3),
              _heroChip(context, 'Sync Ready', Iconsax.cloud, colors),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroChip(BuildContext context, String label, IconData icon, GOLSemanticColors colors) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GOLSpacing.space3,
        vertical: GOLSpacing.space1,
      ),
      decoration: BoxDecoration(
        color: colors.textInverse.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(GOLRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: colors.textInverse),
          const SizedBox(width: GOLSpacing.space1),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.textInverse,
                ),
          ),
        ],
      ),
    );
  }

  Widget _statsGrid(BuildContext context, GOLSemanticColors colors) {
    final stats = [
      {
        'value': '94%',
        'label': 'Weekly Score',
        'icon': Iconsax.graph,
        'accent': colors.interactivePrimary,
        'sub': 'On track'
      },
      {
        'value': '12',
        'label': 'Day Streak',
        'icon': Iconsax.crown,
        'accent': colors.textAccent,
        'sub': 'New best'
      },
      {
        'value': '7',
        'label': 'Live Tasks',
        'icon': Iconsax.task,
        'accent': colors.stateInfo,
        'sub': 'Minimal distractions'
      },
    ];

    return Row(
      children: stats
          .map(
            (stat) => Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: stat == stats.last ? 0 : GOLSpacing.space3,
                ),
                padding: const EdgeInsets.all(GOLSpacing.space4),
                decoration: BoxDecoration(
                  color: colors.surfaceRaised,
                  borderRadius: BorderRadius.circular(GOLRadius.md),
                  border: Border.all(color: colors.borderDefault),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      stat['icon'] as IconData,
                      color: stat['accent'] as Color,
                      size: 22,
                    ),
                    const SizedBox(height: GOLSpacing.space2),
                    Text(
                      stat['value'] as String,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: colors.textPrimary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stat['label'] as String,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: colors.textSecondary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stat['sub'] as String,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: colors.textTertiary),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _contentSection(BuildContext context, GOLSemanticColors colors) {
    final contents = [
      {
        'title': 'Creative Brief',
        'subtitle': 'Due today • 3 collaborators',
        'status': 'Draft',
      },
      {
        'title': 'Launch Video',
        'subtitle': 'Needs review',
        'status': 'Live',
      },
      {
        'title': 'Weekly Substack',
        'subtitle': 'Scheduled for Thursday',
        'status': 'Scheduled',
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Content',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: GOLSpacing.space3),
        GOLCard(
          variant: GOLCardVariant.elevated,
          child: Column(
            children: contents
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: GOLSpacing.space3,
                    ),
                    child: Row(
                      children: [
                        GOLBadge(
                          variant: GOLBadgeVariant.count,
                          count: (item['status'] as String).substring(0, 1),
                        ),
                        const SizedBox(width: GOLSpacing.space3),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'] as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: colors.textPrimary),
                              ),
                              const SizedBox(height: GOLSpacing.space1),
                              Text(
                                item['subtitle'] as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: colors.textSecondary),
                              ),
                            ],
                          ),
                        ),
                        GOLChip(
                          label: item['status'] as String,
                          selected: item['status'] == 'Live',
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _aiSection(BuildContext context, GOLSemanticColors colors) {
    return GOLCard(
      variant: GOLCardVariant.elevated,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Companion',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: colors.textPrimary),
          ),
          const SizedBox(height: GOLSpacing.space2),
          Text(
            'Your personal assistant has synthesized the latest notes and recommends 3 actions to unblock content, campaigns, and metrics.',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: GOLSpacing.space3),
          Row(
            children: [
              GOLButton(
                label: 'Review Insight',
                onPressed: () {},
                variant: GOLButtonVariant.primary,
              ),
              const SizedBox(width: GOLSpacing.space3),
              GOLButton(
                label: 'Share Insight',
                onPressed: () {},
                variant: GOLButtonVariant.tertiary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _projectsSection(BuildContext context, GOLSemanticColors colors) {
    final projects = [
      {
        'title': 'Grow Out Loud Launch',
        'progress': 0.72,
        'focus': 'Content sprint',
      },
      {
        'title': 'Community Studio',
        'progress': 0.36,
        'focus': 'AI integrations',
      },
      {
        'title': 'Metrics Playbook',
        'progress': 0.89,
        'focus': 'Publish',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Projects',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: GOLSpacing.space3),
        Column(
          children: projects
              .map(
                (project) => Padding(
                  padding: const EdgeInsets.only(bottom: GOLSpacing.space3),
                  child: GOLCard(
                    variant: GOLCardVariant.interactive,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              project['title'] as String,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: colors.textPrimary),
                            ),
                            Text(
                              '${((project['progress'] as double) * 100).round()}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: colors.textSecondary),
                            ),
                          ],
                        ),
                        const SizedBox(height: GOLSpacing.space2),
                        GOLLinearProgress(value: project['progress'] as double),
                        const SizedBox(height: GOLSpacing.space2),
                        Text(
                          project['focus'] as String,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: colors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
