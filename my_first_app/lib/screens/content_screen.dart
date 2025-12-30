import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../design_system/badges.dart';
import '../design_system/cards.dart';
import '../design_system/chips.dart';
import '../design_system/icon_container.dart';
import '../design_system/progress.dart';
import '../design_system/spacing.dart';
import '../design_system/theme.dart';

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
      backgroundColor: isDark ? DSColors.darkBackground : DSColors.white,
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
                        ? DSColors.neutral300
                        : DSColors.neutral500,
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
              horizontal: DSSpacing.horizontalPadding,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DSChip(
                  label: 'All',
                  isSelected: _selectedFilter == 0,
                  onTap: () => setState(() => _selectedFilter = 0),
                ),
                DSChip(
                  label: 'YouTube',
                  isSelected: _selectedFilter == 1,
                  onTap: () => setState(() => _selectedFilter = 1),
                ),
                DSChip(
                  label: 'TikTok',
                  isSelected: _selectedFilter == 2,
                  onTap: () => setState(() => _selectedFilter = 2),
                ),
                DSChip(
                  label: 'Blog',
                  isSelected: _selectedFilter == 3,
                  onTap: () => setState(() => _selectedFilter = 3),
                ),
              ],
            ),
          ),

          const SizedBox(height: DSSpacing.lg),

          // Content sections
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              children: [
                // IDEAS Section
                _buildSectionHeader(context, 'IDEAS', 3),
                const SizedBox(height: DSSpacing.md),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'YouTube',
                  platformIcon: Iconsax.video,
                  platformColor: DSColors.premiumRed,
                  tag: 'Coding Skill',
                  title: 'AI Automation Video',
                  action: 'Start Outline',
                  actionIcon: Iconsax.edit_2,
                ),
                const SizedBox(height: DSSpacing.sm),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'TikTok',
                  platformIcon: Iconsax.music,
                  platformColor: DSColors.black,
                  tag: 'Personal Brand',
                  title: 'Day in the life of a dev',
                  action: 'Brainstorm Hooks',
                  actionIcon: Iconsax.lamp_on,
                ),

                const SizedBox(height: DSSpacing.xl),

                // SCRIPT Section
                _buildSectionHeader(context, 'SCRIPT', 1),
                const SizedBox(height: DSSpacing.md),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'Blog',
                  platformIcon: Iconsax.document_text,
                  platformColor: DSColors.orange500,
                  tag: 'Project Alpha',
                  title: 'Q3 Project Update: Lessons Learned',
                  action: 'Finalize Draft',
                  actionIcon: Iconsax.tick_circle,
                ),

                const SizedBox(height: DSSpacing.xl),

                // EDIT Section
                _buildSectionHeader(context, 'EDIT', 2),
                const SizedBox(height: DSSpacing.md),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'YouTube',
                  platformIcon: Iconsax.video,
                  platformColor: DSColors.premiumRed,
                  tag: 'Coding',
                  title: 'Building a SaaS in 24 Hours',
                  action: 'Cut A-Roll',
                  actionIcon: Iconsax.scissor,
                  progress: 0.70,
                ),
                const SizedBox(height: DSSpacing.sm),
                _buildContentCard(
                  context,
                  isDark,
                  platform: 'Facebook',
                  platformIcon: Iconsax.message,
                  platformColor: DSColors.premiumBlue,
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
        backgroundColor: DSColors.teal500,
        child: const Icon(Iconsax.add, color: DSColors.white),
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
        const SizedBox(width: DSSpacing.sm),
        DSBadge(
          label: count.toString(),
          variant: DSBadgeVariant.info,
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
    return DSCard(
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
                            color: platformColor,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? DSColors.neutral300
                                : DSColors.neutral500,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tag,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: isDark
                                ? DSColors.neutral300
                                : DSColors.neutral500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: DSSpacing.sm),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: DSSpacing.sm),
                Row(
                  children: [
                    Icon(
                      actionIcon,
                      size: 14,
                      color: DSColors.teal500,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      action,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: DSColors.teal500,
                          ),
                    ),
                    if (progress != null) ...[
                      const SizedBox(width: 12),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ],
                ),
                if (progress != null) ...[
                  const SizedBox(height: DSSpacing.sm),
                  DSProgressBar(value: progress),
                ],
              ],
            ),
          ),
          const SizedBox(width: DSSpacing.md),
          DSIconContainer(
            icon: platformIcon,
            color: platformColor,
            size: 64,
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}
