import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../design_system_v3/badges.dart';
import '../design_system_v3/cards.dart';
import '../design_system_v3/progress.dart';
import '../design_system_v3/spacing_v3.dart';
import '../design_system_v3/theme_v3.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int _selectedFilter = 0;

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
              'CONTENT',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    letterSpacing: 0.5,
                    color: isDark
                        ? DSV3Colors.neutral300
                        : DSV3Colors.neutral500,
                  ),
            ),
            Text(
              'Pipeline',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.search_normal),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Filter tabs
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: DSV3Spacing.horizontalPadding,
            ),
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

          const SizedBox(height: DSV3Spacing.lg),

          // Content sections
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.horizontalPadding,
              ),
              children: [
                // IDEAS Section
                _buildSectionHeader(context, 'IDEAS', 3),
                const SizedBox(height: DSV3Spacing.md),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'YouTube',
                  platformIcon: Iconsax.video,
                  platformColor: DSV3Colors.premiumRed,
                  tag: 'Coding Skill',
                  title: 'AI Automation Video',
                  action: 'Start Outline',
                  actionIcon: Iconsax.edit_2,
                ),
                const SizedBox(height: DSV3Spacing.sm),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'TikTok',
                  platformIcon: Iconsax.music,
                  platformColor: DSV3Colors.black,
                  tag: 'Personal Brand',
                  title: 'Day in the life of a dev',
                  action: 'Brainstorm Hooks',
                  actionIcon: Iconsax.lamp_on,
                ),

                const SizedBox(height: DSV3Spacing.xl),

                // SCRIPT Section
                _buildSectionHeader(context, 'SCRIPT', 1),
                const SizedBox(height: DSV3Spacing.md),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'Blog',
                  platformIcon: Iconsax.document_text,
                  platformColor: DSV3Colors.orange500,
                  tag: 'Project Alpha',
                  title: 'Q3 Project Update: Lessons Learned',
                  action: 'Finalize Draft',
                  actionIcon: Iconsax.tick_circle,
                ),

                const SizedBox(height: DSV3Spacing.xl),

                // EDIT Section
                _buildSectionHeader(context, 'EDIT', 2),
                const SizedBox(height: DSV3Spacing.md),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'YouTube',
                  platformIcon: Iconsax.video,
                  platformColor: DSV3Colors.premiumRed,
                  tag: 'Coding',
                  title: 'Building a SaaS in 24 Hours',
                  action: 'Cut A-Roll',
                  actionIcon: Iconsax.scissor,
                  progress: 0.70,
                ),
                const SizedBox(height: DSV3Spacing.sm),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'Facebook',
                  platformIcon: Iconsax.message,
                  platformColor: DSV3Colors.premiumBlue,
                  tag: 'Community',
                  title: 'Weekly Live Stream Promo',
                  action: 'Create Thumbnail',
                  actionIcon: Iconsax.gallery,
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: DSV3Colors.teal500,
        child: const Icon(Iconsax.add, color: DSV3Colors.white),
      ),
    );
  }

  Widget _buildFilterChip(String label, int index) {
    final isSelected = _selectedFilter == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? DSV3Colors.teal500
              : (isDark ? DSV3Colors.surfaceDark : DSV3Colors.neutral100),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(
                  color: isDark ? DSV3Colors.neutral500 : DSV3Colors.neutral200,
                ),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: isSelected
                      ? DSV3Colors.white
                      : (isDark ? DSV3Colors.neutral200 : DSV3Colors.black),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, int count) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                letterSpacing: 0.5,
              ),
        ),
        const SizedBox(width: DSV3Spacing.sm),
        DSV3Badge(
          label: count.toString(),
          variant: DSV3BadgeVariant.info,
        ),
      ],
    );
  }

  Widget _buildContentCard(
    BuildContext context,
    bool isDark, {
    required String platform,
    required IconData platformIcon,
    required Color platformColor,
    required String tag,
    required String title,
    required String action,
    required IconData actionIcon,
    double? progress,
  }) {
    return DSV3Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      platformIcon,
                      size: 16,
                      color: platformColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      platform,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: platformColor,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? DSV3Colors.neutral300
                                : DSV3Colors.neutral500,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tag,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: isDark
                                ? DSV3Colors.neutral300
                                : DSV3Colors.neutral500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: DSV3Spacing.sm),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: DSV3Spacing.sm),
                Row(
                  children: [
                    Icon(
                      actionIcon,
                      size: 14,
                      color: DSV3Colors.teal500,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      action,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: DSV3Colors.teal500,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (progress != null) ...[
                      const SizedBox(width: 12),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ],
                ),
                if (progress != null) ...[
                  const SizedBox(height: DSV3Spacing.sm),
                  DSV3ProgressBar(value: progress),
                ],
              ],
            ),
          ),
          const SizedBox(width: DSV3Spacing.md),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: platformColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
            ),
            child: Icon(
              platformIcon,
              color: platformColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
