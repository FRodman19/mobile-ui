import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../design_system_v3/badges.dart';
import '../design_system_v3/buttons.dart';
import '../design_system_v3/cards.dart';
import '../design_system_v3/progress.dart';
import '../design_system_v3/spacing_v3.dart';
import '../design_system_v3/theme_v3.dart';

class HomeDashboardContent extends StatelessWidget {
  const HomeDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? DSV3Colors.darkBackground : DSV3Colors.white,
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
                        ? DSV3Colors.neutral300
                        : DSV3Colors.neutral500,
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
        padding: const EdgeInsets.all(DSV3Spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Overview
            Text(
              'Overview',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: DSV3Spacing.md),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          DSV3Colors.orange500,
                          DSV3Colors.orange600,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          BorderRadius.circular(DSV3Spacing.cardRadius),
                    ),
                    padding: const EdgeInsets.all(DSV3Spacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.chart_success,
                          color: DSV3Colors.white,
                          size: 24,
                        ),
                        const SizedBox(height: DSV3Spacing.sm),
                        Text(
                          '94%',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: DSV3Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Weekly Score',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: DSV3Colors.white.withValues(alpha: 0.9),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: DSV3Spacing.md),
                Expanded(
                  child: DSV3Card(
                    tone: DSV3CardTone.elevated,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.crown_1,
                          color: DSV3Colors.teal500,
                          size: 24,
                        ),
                        const SizedBox(height: DSV3Spacing.sm),
                        Text(
                          '12',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Day Streak',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: isDark
                                        ? DSV3Colors.neutral300
                                        : DSV3Colors.neutral500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: DSV3Spacing.xl),

            // Quick Actions
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: DSV3Spacing.md),
            Row(
              children: [
                Expanded(
                  child: DSV3Button(
                    label: 'New Project',
                    icon: Iconsax.folder_add,
                    variant: DSV3ButtonVariant.primary,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: DSV3Spacing.sm),
                Expanded(
                  child: DSV3Button(
                    label: 'Add Skill',
                    icon: Iconsax.book,
                    variant: DSV3ButtonVariant.secondary,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSV3Spacing.sm),
            Row(
              children: [
                Expanded(
                  child: DSV3Button(
                    label: 'Content',
                    icon: Iconsax.document_text,
                    variant: DSV3ButtonVariant.tertiary,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: DSV3Spacing.sm),
                Expanded(
                  child: DSV3Button(
                    label: 'Daily Entry',
                    icon: Iconsax.note_text,
                    variant: DSV3ButtonVariant.text,
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: DSV3Spacing.xl),

            // Progress
            Text(
              'This Week\'s Progress',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: DSV3Spacing.md),
            DSV3Card(
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
                      const DSV3Badge(
                        label: '3/5',
                        variant: DSV3BadgeVariant.info,
                      ),
                    ],
                  ),
                  const SizedBox(height: DSV3Spacing.sm),
                  const DSV3ProgressBar(value: 0.6),
                  const SizedBox(height: DSV3Spacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Skills',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const DSV3Badge(
                        label: '2/3',
                        variant: DSV3BadgeVariant.warning,
                      ),
                    ],
                  ),
                  const SizedBox(height: DSV3Spacing.sm),
                  const DSV3ProgressBar(value: 0.67),
                  const SizedBox(height: DSV3Spacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daily Entries',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const DSV3Badge(
                        label: '7/7',
                        variant: DSV3BadgeVariant.success,
                      ),
                    ],
                  ),
                  const SizedBox(height: DSV3Spacing.sm),
                  const DSV3ProgressBar(value: 1.0),
                ],
              ),
            ),

            const SizedBox(height: DSV3Spacing.xl),

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
                          color: DSV3Colors.teal500,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSV3Spacing.md),
            _buildFocusTask(
              context,
              isDark,
              'Complete Project Strategy',
              'Projects',
              'High Priority',
              DSV3Colors.premiumRed,
              Iconsax.folder,
            ),
            const SizedBox(height: DSV3Spacing.sm),
            _buildFocusTask(
              context,
              isDark,
              'Read "Clean Code" Ch. 4',
              'Skills',
              '30 mins',
              DSV3Colors.orange500,
              Iconsax.book_1,
            ),
            const SizedBox(height: DSV3Spacing.sm),
            _buildFocusTask(
              context,
              isDark,
              'Review Q3 Metrics',
              'Performance',
              'Weekly',
              DSV3Colors.teal500,
              Iconsax.chart,
            ),

            const SizedBox(height: DSV3Spacing.xl),

            // System Overview
            Text(
              'System Overview',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: DSV3Spacing.md),
            Row(
              children: [
                Expanded(
                  child: DSV3Card(
                    tone: DSV3CardTone.elevated,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.folder_2,
                          color: DSV3Colors.teal500,
                          size: 24,
                        ),
                        const SizedBox(height: DSV3Spacing.md),
                        Text(
                          '3',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Active Projects',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: isDark
                                        ? DSV3Colors.neutral300
                                        : DSV3Colors.neutral500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: DSV3Spacing.md),
                Expanded(
                  child: DSV3Card(
                    tone: DSV3CardTone.elevated,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.book_1,
                          color: DSV3Colors.orange500,
                          size: 24,
                        ),
                        const SizedBox(height: DSV3Spacing.md),
                        Text(
                          '2',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Skills Learning',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: isDark
                                        ? DSV3Colors.neutral300
                                        : DSV3Colors.neutral500,
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
    return DSV3Card(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
            ),
            child: Icon(
              icon,
              color: accentColor,
              size: 24,
            ),
          ),
          const SizedBox(width: DSV3Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      category,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? DSV3Colors.neutral300
                                : DSV3Colors.neutral500,
                          ),
                    ),
                    Text(
                      ' • ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? DSV3Colors.neutral300
                                : DSV3Colors.neutral500,
                          ),
                    ),
                    Text(
                      metadata,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? DSV3Colors.neutral300
                                : DSV3Colors.neutral500,
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
                color: isDark ? DSV3Colors.neutral500 : DSV3Colors.neutral300,
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
