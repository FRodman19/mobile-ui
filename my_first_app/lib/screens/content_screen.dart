import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../grow_out_loud/components/gol_badges.dart';
import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/components/gol_chips.dart';
import '../grow_out_loud/components/gol_progress.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';

// Platform colors
const Color _youtubeRed = Color(0xFFFF0000);
const Color _tiktokBlack = Color(0xFF000000);
const Color _blogOrange = Color(0xFFFF6B00);
const Color _facebookBlue = Color(0xFF1877F2);

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CONTENT',
              style: textTheme.bodySmall?.copyWith(
                letterSpacing: 0.5,
                color: colors.textSecondary,
              ),
            ),
            Text(
              'Pipeline',
              style: textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.search_normal),
            color: colors.textSecondary,
            onPressed: () {},
          ),
          const SizedBox(width: GOLSpacing.space2),
        ],
      ),
      body: Column(
        children: [
          // Filter tabs
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: GOLSpacing.screenPaddingHorizontal,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _selectedFilter = 0),
                  child: GOLChip(
                    label: 'All',
                    selected: _selectedFilter == 0,
                  ),
                ),
                const SizedBox(width: GOLSpacing.space2),
                GestureDetector(
                  onTap: () => setState(() => _selectedFilter = 1),
                  child: GOLChip(
                    label: 'YouTube',
                    selected: _selectedFilter == 1,
                  ),
                ),
                const SizedBox(width: GOLSpacing.space2),
                GestureDetector(
                  onTap: () => setState(() => _selectedFilter = 2),
                  child: GOLChip(
                    label: 'TikTok',
                    selected: _selectedFilter == 2,
                  ),
                ),
                const SizedBox(width: GOLSpacing.space2),
                GestureDetector(
                  onTap: () => setState(() => _selectedFilter = 3),
                  child: GOLChip(
                    label: 'Blog',
                    selected: _selectedFilter == 3,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: GOLSpacing.space6),

          // Content sections
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: GOLSpacing.screenPaddingHorizontal,
              ),
              children: [
                // IDEAS Section
                _buildSectionHeader(context, colors, textTheme, 'IDEAS', 3),
                const SizedBox(height: GOLSpacing.space4),
                _buildContentCard(
                  context,
                  colors,
                  textTheme,
                  platform: 'YouTube',
                  platformIcon: Iconsax.video,
                  platformColor: _youtubeRed,
                  tag: 'Coding Skill',
                  title: 'AI Automation Video',
                  action: 'Start Outline',
                  actionIcon: Iconsax.edit_2,
                ),
                const SizedBox(height: GOLSpacing.space3),
                _buildContentCard(
                  context,
                  colors,
                  textTheme,
                  platform: 'TikTok',
                  platformIcon: Iconsax.music,
                  platformColor: _tiktokBlack,
                  tag: 'Personal Brand',
                  title: 'Day in the life of a dev',
                  action: 'Brainstorm Hooks',
                  actionIcon: Iconsax.lamp_on,
                ),

                const SizedBox(height: GOLSpacing.space8),

                // SCRIPT Section
                _buildSectionHeader(context, colors, textTheme, 'SCRIPT', 1),
                const SizedBox(height: GOLSpacing.space4),
                _buildContentCard(
                  context,
                  colors,
                  textTheme,
                  platform: 'Blog',
                  platformIcon: Iconsax.document_text,
                  platformColor: _blogOrange,
                  tag: 'Project Alpha',
                  title: 'Q3 Project Update: Lessons Learned',
                  action: 'Finalize Draft',
                  actionIcon: Iconsax.tick_circle,
                ),

                const SizedBox(height: GOLSpacing.space8),

                // EDIT Section
                _buildSectionHeader(context, colors, textTheme, 'EDIT', 2),
                const SizedBox(height: GOLSpacing.space4),
                _buildContentCard(
                  context,
                  colors,
                  textTheme,
                  platform: 'YouTube',
                  platformIcon: Iconsax.video,
                  platformColor: _youtubeRed,
                  tag: 'Coding',
                  title: 'Building a SaaS in 24 Hours',
                  action: 'Cut A-Roll',
                  actionIcon: Iconsax.scissor,
                  progress: 0.70,
                ),
                const SizedBox(height: GOLSpacing.space3),
                _buildContentCard(
                  context,
                  colors,
                  textTheme,
                  platform: 'Facebook',
                  platformIcon: Iconsax.message,
                  platformColor: _facebookBlue,
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
        backgroundColor: colors.interactivePrimary,
        child: Icon(Iconsax.add, color: colors.textInverse),
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    GOLSemanticColors colors,
    TextTheme textTheme,
    String title,
    int count,
  ) {
    return Row(
      children: [
        Text(
          title,
          style: textTheme.headlineMedium?.copyWith(
            letterSpacing: 0.5,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(width: GOLSpacing.space3),
        GOLBadge(
          variant: GOLBadgeVariant.count,
          count: count.toString(),
        ),
      ],
    );
  }

  Widget _buildContentCard(
    BuildContext context,
    GOLSemanticColors colors,
    TextTheme textTheme, {
    required String platform,
    required IconData platformIcon,
    required Color platformColor,
    required String tag,
    required String title,
    required String action,
    required IconData actionIcon,
    double? progress,
  }) {
    return GOLCard(
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
                    const SizedBox(width: GOLSpacing.space1),
                    Text(
                      platform,
                      style: textTheme.labelSmall?.copyWith(
                        color: platformColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: GOLSpacing.space2),
                    Text(
                      '•',
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: GOLSpacing.space2),
                    Text(
                      tag,
                      style: textTheme.labelSmall?.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: GOLSpacing.space3),
                Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: GOLSpacing.space3),
                Row(
                  children: [
                    Icon(
                      actionIcon,
                      size: 14,
                      color: colors.interactivePrimary,
                    ),
                    const SizedBox(width: GOLSpacing.space1),
                    Text(
                      action,
                      style: textTheme.labelMedium?.copyWith(
                        color: colors.interactivePrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (progress != null) ...[
                      const SizedBox(width: GOLSpacing.space3),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: textTheme.labelMedium?.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
                if (progress != null) ...[
                  const SizedBox(height: GOLSpacing.space3),
                  GOLLinearProgress(value: progress),
                ],
              ],
            ),
          ),
          const SizedBox(width: GOLSpacing.space4),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: platformColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              platformIcon,
              size: 28,
              color: platformColor,
            ),
          ),
        ],
      ),
    );
  }
}
