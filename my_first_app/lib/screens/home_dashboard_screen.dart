import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../design_system/badges.dart';
import '../design_system/buttons.dart';
import '../design_system/cards.dart';
import '../design_system/icon_container.dart';
import '../design_system/progress.dart';
import '../design_system/spacing.dart';
import '../design_system/theme.dart';

class HomeDashboardContent extends StatelessWidget {
  const HomeDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? DSColors.darkBackground : DSColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MONDAY, OCT 24',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    letterSpacing: 0.5,
                    color: isDark
                        ? DSColors.neutral300
                        : DSColors.neutral500,
                  ),
            ),
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        actions: [
          if (kDebugMode)
            IconButton(
              icon: const Icon(Iconsax.color_swatch),
              onPressed: () {
                Navigator.pushNamed(context, '/design-system');
              },
              tooltip: 'Design System V1',
            ),
          if (kDebugMode)
            IconButton(
              icon: const Icon(Iconsax.brush_2),
              onPressed: () {
                Navigator.pushNamed(context, '/design-system-v2');
              },
              tooltip: 'Design System V2',
            ),
          if (kDebugMode)
            IconButton(
              icon: const Icon(Iconsax.layer),
              onPressed: () {
                Navigator.pushNamed(context, '/design-system-v3');
              },
              tooltip: 'Design System V3',
            ),
          IconButton(
            icon: const Icon(Iconsax.notification),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DSSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Overview
            Text(
              'Overview',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: DSSpacing.md),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: DSColors.orange500,
                      borderRadius:
                          BorderRadius.circular(DSSpacing.cardRadius),
                    ),
                    padding: const EdgeInsets.all(DSSpacing.lg),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.chart_success,
                            color: DSColors.white,
                            size: 24,
                          ),
                          const SizedBox(height: DSSpacing.sm),
                          Text(
                            '94%',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: DSColors.white,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Weekly Score',
                            style:
                                Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: DSColors.white.withValues(alpha: 0.9),
                                    ),
                          ),
                        ],
                      ),
                  ),
                ),
                const SizedBox(width: DSSpacing.md),
                Expanded(
                  child: DSCard(
                    tone: DSCardTone.elevated,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.crown_1,
                          color: DSColors.teal500,
                          size: 24,
                        ),
                        const SizedBox(height: DSSpacing.sm),
                        Text(
                          '12',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Day Streak',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: isDark
                                        ? DSColors.neutral300
                                        : DSColors.neutral500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: DSSpacing.xl),

            // Quick Actions
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: DSSpacing.md),
            Row(
              children: [
                Expanded(
                  child: DSButton(
                    label: 'New Project',
                    icon: Iconsax.folder_add,
                    variant: DSButtonVariant.primary,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: DSSpacing.sm),
                Expanded(
                  child: DSButton(
                    label: 'Add Skill',
                    icon: Iconsax.book,
                    variant: DSButtonVariant.secondary,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: DSButton(
                    label: 'Content',
                    icon: Iconsax.document_text,
                    variant: DSButtonVariant.tertiary,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: DSSpacing.sm),
                Expanded(
                  child: DSButton(
                    label: 'Daily Entry',
                    icon: Iconsax.note_text,
                    variant: DSButtonVariant.text,
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: DSSpacing.xl),

            // Progress
            Text(
              'This Week\'s Progress',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: DSSpacing.md),
            DSCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Projects',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const DSBadge(
                        label: '3/5',
                        variant: DSBadgeVariant.info,
                      ),
                    ],
                  ),
                  const SizedBox(height: DSSpacing.sm),
                  const DSProgressBar(value: 0.6),
                  const SizedBox(height: DSSpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Skills',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const DSBadge(
                        label: '2/3',
                        variant: DSBadgeVariant.warning,
                      ),
                    ],
                  ),
                  const SizedBox(height: DSSpacing.sm),
                  const DSProgressBar(value: 0.67),
                  const SizedBox(height: DSSpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily Entries',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const DSBadge(
                        label: '7/7',
                        variant: DSBadgeVariant.success,
                      ),
                    ],
                  ),
                  const SizedBox(height: DSSpacing.sm),
                  const DSProgressBar(value: 1.0),
                ],
              ),
            ),

            const SizedBox(height: DSSpacing.xl),

            // Today's Focus
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Focus',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: DSColors.teal500,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.md),
            _buildFocusTask(
              context,
              isDark,
              'Complete Project Strategy',
              'Projects',
              'High Priority',
              DSColors.premiumRed,
              Iconsax.folder,
            ),
            const SizedBox(height: DSSpacing.sm),
            _buildFocusTask(
              context,
              isDark,
              'Read "Clean Code" Ch. 4',
              'Skills',
              '30 mins',
              DSColors.orange500,
              Iconsax.book_1,
            ),
            const SizedBox(height: DSSpacing.sm),
            _buildFocusTask(
              context,
              isDark,
              'Review Q3 Metrics',
              'Performance',
              'Weekly',
              DSColors.teal500,
              Iconsax.chart,
            ),

            const SizedBox(height: DSSpacing.xl),

            // System Overview
            Text(
              'System Overview',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: DSSpacing.md),
            Row(
              children: [
                Expanded(
                  child: DSCard(
                    tone: DSCardTone.elevated,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.folder_2,
                          color: DSColors.teal500,
                          size: 24,
                        ),
                        const SizedBox(height: DSSpacing.md),
                        Text(
                          '3',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Active Projects',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: isDark
                                        ? DSColors.neutral300
                                        : DSColors.neutral500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: DSSpacing.md),
                Expanded(
                  child: DSCard(
                    tone: DSCardTone.elevated,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.book_1,
                          color: DSColors.orange500,
                          size: 24,
                        ),
                        const SizedBox(height: DSSpacing.md),
                        Text(
                          '2',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Skills Learning',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: isDark
                                        ? DSColors.neutral300
                                        : DSColors.neutral500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildFocusTask(
    BuildContext context,
    bool isDark,
    String title,
    String category,
    String metadata,
    Color accentColor,
    IconData icon,
  ) {
    return DSCard(
      child: Row(
        children: [
          DSIconContainer(
            icon: icon,
            color: accentColor,
          ),
          const SizedBox(width: DSSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      category,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? DSColors.neutral300
                                : DSColors.neutral500,
                          ),
                    ),
                    Text(
                      ' • ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? DSColors.neutral300
                                : DSColors.neutral500,
                          ),
                    ),
                    Text(
                      metadata,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? DSColors.neutral300
                                : DSColors.neutral500,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isDark ? DSColors.neutral500 : DSColors.neutral300,
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
