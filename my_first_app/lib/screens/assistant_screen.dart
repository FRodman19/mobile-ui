import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../grow_out_loud/components/gol_buttons.dart';
import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/components/gol_inputs.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';
import '../grow_out_loud/foundation/gol_radius.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: colors.stateSuccess,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: GOLSpacing.space2),
            Text(
              'AI Assistant',
              style: textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.more),
            color: colors.textSecondary,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
              children: [
                _buildSystemMessage(
                  colors,
                  textTheme,
                  'Hi! I\'m your AI assistant. I can help you with:\n• Creating content (@mention projects)\n• Tracking skills (#mention skills)\n• Analyzing performance\n• Managing tasks',
                ),
                const SizedBox(height: GOLSpacing.space4),
                _buildUserMessage(
                  colors,
                  textTheme,
                  'Help me write a YouTube script for @NeoLaunch',
                ),
                const SizedBox(height: GOLSpacing.space4),
                _buildSystemMessage(
                  colors,
                  textTheme,
                  'I\'ll help you create a YouTube script for NeoLaunch. Let me draft something for you.',
                ),
                const SizedBox(height: GOLSpacing.space4),
                _buildContentCard(
                  colors,
                  textTheme,
                  'YouTube Script Draft',
                  'YouTube',
                  'Hook: "What if I told you that you could validate your SaaS idea in 48 hours?"\n\nIntro: Today I\'m breaking down the exact framework we used to...',
                  'NeoLaunch',
                ),
                const SizedBox(height: GOLSpacing.space4),
                _buildUserMessage(
                  colors,
                  textTheme,
                  'Can you update my progress on #Python for Data Science?',
                ),
                const SizedBox(height: GOLSpacing.space4),
                _buildSystemMessage(
                  colors,
                  textTheme,
                  'Sure! I see you\'ve completed "Pandas Library Basics". Would you like me to mark this milestone as complete and suggest the next one?',
                ),
                const SizedBox(height: GOLSpacing.space4),
                _buildSystemMessage(
                  colors,
                  textTheme,
                  'Your next milestone would be "Data Visualization with Matplotlib". Ready to start?',
                ),
              ],
            ),
          ),

          // Input bar
          Container(
            padding: const EdgeInsets.all(GOLSpacing.space4),
            decoration: BoxDecoration(
              color: colors.backgroundPrimary,
              border: Border(
                top: BorderSide(
                  color: colors.borderDefault,
                  width: 1,
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // @ button
                  _buildIconButton(colors, Iconsax.direct),
                  const SizedBox(width: GOLSpacing.space2),
                  // # button
                  _buildIconButton(colors, Iconsax.tag),
                  const SizedBox(width: GOLSpacing.space3),
                  // Input field
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: GOLSpacing.space4,
                        vertical: GOLSpacing.space2,
                      ),
                      decoration: BoxDecoration(
                        color: colors.surfaceDefault,
                        borderRadius: BorderRadius.circular(GOLRadius.full),
                      ),
                      child: TextField(
                        controller: _messageController,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.textPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Ask me anything...',
                          hintStyle: textTheme.bodyMedium?.copyWith(
                            color: colors.textTertiary,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: GOLSpacing.space3),
                  // Voice button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colors.interactivePrimary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Iconsax.microphone,
                      color: colors.textInverse,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(GOLSemanticColors colors, IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: colors.surfaceDefault,
        borderRadius: BorderRadius.circular(GOLRadius.sm),
      ),
      child: Icon(
        icon,
        size: 18,
        color: colors.textSecondary,
      ),
    );
  }

  Widget _buildSystemMessage(
    GOLSemanticColors colors,
    TextTheme textTheme,
    String message,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: colors.interactivePrimary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Iconsax.cpu,
            color: colors.interactivePrimary,
            size: 18,
          ),
        ),
        const SizedBox(width: GOLSpacing.space3),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(GOLSpacing.space3),
            decoration: BoxDecoration(
              color: colors.surfaceDefault,
              borderRadius: BorderRadius.circular(GOLRadius.md),
            ),
            child: Text(
              message,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.textPrimary,
                height: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(width: 44),
      ],
    );
  }

  Widget _buildUserMessage(
    GOLSemanticColors colors,
    TextTheme textTheme,
    String message,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 44),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(GOLSpacing.space3),
            decoration: BoxDecoration(
              color: colors.interactivePrimary,
              borderRadius: BorderRadius.circular(GOLRadius.md),
            ),
            child: Text(
              message,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.textInverse,
                height: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(width: GOLSpacing.space3),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: colors.interactivePrimary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Iconsax.user,
            color: colors.textInverse,
            size: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildContentCard(
    GOLSemanticColors colors,
    TextTheme textTheme,
    String title,
    String platform,
    String content,
    String project,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: colors.interactivePrimary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Iconsax.cpu,
            color: colors.interactivePrimary,
            size: 18,
          ),
        ),
        const SizedBox(width: GOLSpacing.space3),
        Expanded(
          child: GOLCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Iconsax.video,
                      size: 16,
                      color: colors.interactivePrimary,
                    ),
                    const SizedBox(width: GOLSpacing.space1),
                    Text(
                      platform,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.interactivePrimary,
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
                      project,
                      style: textTheme.labelSmall?.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: GOLSpacing.space3),
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: GOLSpacing.space3),
                Text(
                  content,
                  style: textTheme.bodySmall?.copyWith(
                    height: 1.5,
                    color: colors.textSecondary,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: GOLSpacing.space4),
                Row(
                  children: [
                    Expanded(
                      child: GOLButton(
                        label: 'Edit Draft',
                        variant: GOLButtonVariant.secondary,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: GOLSpacing.space2),
                    Expanded(
                      child: GOLButton(
                        label: 'Apply to Content',
                        variant: GOLButtonVariant.primary,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 44),
      ],
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
