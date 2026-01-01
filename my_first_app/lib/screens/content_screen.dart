import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/components/gol_chips.dart';
import '../grow_out_loud/components/gol_progress.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  String _selectedPlatform = 'All';

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
        title: Text(
          'Content',
          style: textTheme.headlineLarge?.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.search_normal),
            onPressed: () {},
            color: colors.textSecondary,
          ),
          const SizedBox(width: GOLSpacing.space2),
        ],
      ),
      body: Column(
        children: [
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
                    onTap: () => setState(() => _selectedPlatform = 'All'),
                    child: GOLChip(label: 'All', selected: _selectedPlatform == 'All'),
                  ),
                  const SizedBox(width: GOLSpacing.space2),
                  GestureDetector(
                    onTap: () => setState(() => _selectedPlatform = 'YouTube'),
                    child: GOLChip(label: 'YouTube', selected: _selectedPlatform == 'YouTube'),
                  ),
                  const SizedBox(width: GOLSpacing.space2),
                  GestureDetector(
                    onTap: () => setState(() => _selectedPlatform = 'TikTok'),
                    child: GOLChip(label: 'TikTok', selected: _selectedPlatform == 'TikTok'),
                  ),
                  const SizedBox(width: GOLSpacing.space2),
                  GestureDetector(
                    onTap: () => setState(() => _selectedPlatform = 'Blog'),
                    child: GOLChip(label: 'Blog', selected: _selectedPlatform == 'Blog'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
              children: [
                _SectionHeader(title: 'IDEAS', count: 3, colors: colors, textTheme: textTheme),
                const SizedBox(height: GOLSpacing.space3),
                _ContentCard(
                  platform: '🎥 YouTube',
                  tag: 'Coding Skill',
                  title: 'AI Automation Video',
                  action: '✏️  Start Outline',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.space3),
                _ContentCard(
                  platform: '🎵 TikTok',
                  tag: 'Personal Brand',
                  title: 'Day in the life of a dev',
                  action: '💡  Brainstorm Hooks',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.betweenSections),
                _SectionHeader(title: 'SCRIPT', count: 1, colors: colors, textTheme: textTheme),
                const SizedBox(height: GOLSpacing.space3),
                _ContentCard(
                  platform: '📝 Blog',
                  tag: 'Project Alpha',
                  title: 'Q3 Project Update: Lessons Learned',
                  action: '✅  Finalize Draft',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.betweenSections),
                _SectionHeader(title: 'EDIT', count: 2, colors: colors, textTheme: textTheme),
                const SizedBox(height: GOLSpacing.space3),
                _ContentCard(
                  platform: '🎥 YouTube',
                  tag: 'Coding',
                  title: 'Building a SaaS in 24 Hours',
                  action: '✂️  Cut A-Roll',
                  progress: 0.70,
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.space3),
                _ContentCard(
                  platform: '🔵 Facebook',
                  tag: 'Community',
                  title: 'Weekly Live Stream Promo',
                  action: '🎨  Create Thumbnail',
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

class _SectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _SectionHeader({
    required this.title,
    required this.count,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: GOLSpacing.space2),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: GOLSpacing.space2,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: colors.interactivePrimary,
            shape: BoxShape.circle,
          ),
          child: Text(
            count.toString(),
            style: textTheme.labelSmall?.copyWith(
              color: colors.textInverse,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _ContentCard extends StatelessWidget {
  final String platform;
  final String tag;
  final String title;
  final String action;
  final double? progress;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _ContentCard({
    required this.platform,
    required this.tag,
    required this.title,
    required this.action,
    this.progress,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GOLCard(
      variant: GOLCardVariant.standard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          platform,
                          style: textTheme.labelMedium?.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: GOLSpacing.space2),
                        Text(
                          '•',
                          style: textTheme.bodySmall?.copyWith(
                            color: colors.textTertiary,
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
                    const SizedBox(height: GOLSpacing.space2),
                    Text(
                      title,
                      style: textTheme.bodyLarge?.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: GOLSpacing.space3),
            Row(
              children: [
                Expanded(child: GOLLinearProgress(value: progress!)),
                const SizedBox(width: GOLSpacing.space2),
                Text(
                  '${(progress! * 100).toInt()}%',
                  style: textTheme.labelSmall?.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: GOLSpacing.space3),
          Text(
            action,
            style: textTheme.labelMedium?.copyWith(
              color: colors.interactivePrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
