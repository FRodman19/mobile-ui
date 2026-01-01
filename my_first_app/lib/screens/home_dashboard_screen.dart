import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;
    const dateStr = 'MONDAY, OCT 24';

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
              dateStr,
              style: textTheme.labelSmall?.copyWith(
                color: colors.textTertiary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: GOLSpacing.space1),
            Text(
              'Dashboard',
              style: textTheme.headlineLarge?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.notification),
            onPressed: () {},
            color: colors.textSecondary,
          ),
          const SizedBox(width: GOLSpacing.space2),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick Actions
            Text(
              'Quick Actions',
              style: textTheme.titleLarge?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: GOLSpacing.space4),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _QuickActionItem(
                    icon: Iconsax.folder_add,
                    label: 'New\nProject',
                    colors: colors,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: GOLSpacing.space3),
                  _QuickActionItem(
                    icon: Iconsax.book,
                    label: 'New\nSkill',
                    colors: colors,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: GOLSpacing.space3),
                  _QuickActionItem(
                    icon: Iconsax.document,
                    label: 'New\nContent',
                    colors: colors,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: GOLSpacing.space3),
                  _QuickActionItem(
                    icon: Iconsax.chart,
                    label: 'Daily\nEntry',
                    colors: colors,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: GOLSpacing.space3),
                  _QuickActionItem(
                    icon: Iconsax.cpu,
                    label: 'Open\nAssist',
                    colors: colors,
                    textTheme: textTheme,
                  ),
                ],
              ),
            ),

            const SizedBox(height: GOLSpacing.betweenSections),

            // Today's Focus
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Focus',
                  style: textTheme.titleLarge?.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: textTheme.labelMedium?.copyWith(
                      color: colors.interactivePrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: GOLSpacing.space3),
            _FocusTaskCard(
              title: 'Complete Project Strategy',
              subtitle: 'Projects • High Priority',
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GOLSpacing.space3),
            _FocusTaskCard(
              title: 'Read "Clean Code" Ch. 4',
              subtitle: 'Skills • 30 mins',
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GOLSpacing.space3),
            _FocusTaskCard(
              title: 'Review Q3 Metrics',
              subtitle: 'Performance • Weekly',
              colors: colors,
              textTheme: textTheme,
            ),

            const SizedBox(height: GOLSpacing.betweenSections),

            // System Overview
            Text(
              'System Overview',
              style: textTheme.titleLarge?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: GOLSpacing.space4),
            Row(
              children: [
                Expanded(
                  child: _OverviewCard(
                    icon: Iconsax.folder,
                    title: 'PROJECTS',
                    value: '3',
                    subtitle: 'Active ventures',
                    colors: colors,
                    textTheme: textTheme,
                  ),
                ),
                const SizedBox(width: GOLSpacing.space3),
                Expanded(
                  child: _OverviewCard(
                    icon: Iconsax.book,
                    title: 'SKILLS',
                    value: '2',
                    subtitle: 'In progress',
                    colors: colors,
                    textTheme: textTheme,
                  ),
                ),
              ],
            ),
            const SizedBox(height: GOLSpacing.space3),
            Row(
              children: [
                Expanded(
                  child: _OverviewCard(
                    icon: Iconsax.document,
                    title: 'CONTENT',
                    value: '5',
                    subtitle: 'Drafts pending',
                    colors: colors,
                    textTheme: textTheme,
                  ),
                ),
                const SizedBox(width: GOLSpacing.space3),
                Expanded(
                  child: _OverviewCard(
                    icon: Iconsax.chart,
                    title: 'PERF.',
                    value: '94%',
                    subtitle: 'Weekly score',
                    colors: colors,
                    textTheme: textTheme,
                    highlight: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: GOLSpacing.space8),
          ],
        ),
      ),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: colors.surfaceRaised,
            shape: BoxShape.circle,
            border: Border.all(
              color: colors.borderDefault,
              width: 1.5,
            ),
          ),
          child: Icon(
            icon,
            size: 28,
            color: colors.interactivePrimary,
          ),
        ),
        const SizedBox(height: GOLSpacing.space2),
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colors.textSecondary,
            height: 1.3,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _FocusTaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _FocusTaskCard({
    required this.title,
    required this.subtitle,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GOLCard(
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colors.borderStrong,
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: GOLSpacing.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: GOLSpacing.space1),
                Text(
                  subtitle,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final GOLSemanticColors colors;
  final TextTheme textTheme;
  final bool highlight;

  const _OverviewCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.colors,
    required this.textTheme,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return GOLCard(
      variant: highlight ? GOLCardVariant.elevated : GOLCardVariant.standard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: highlight ? colors.interactivePrimary : colors.textSecondary,
              ),
              const SizedBox(width: GOLSpacing.space2),
              Text(
                title,
                style: textTheme.labelSmall?.copyWith(
                  color: colors.textTertiary,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: GOLSpacing.space3),
          Text(
            value,
            style: textTheme.displaySmall?.copyWith(
              color: highlight ? colors.interactivePrimary : colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: GOLSpacing.space1),
          Text(
            subtitle,
            style: textTheme.bodySmall?.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
