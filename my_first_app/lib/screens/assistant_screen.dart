import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';
import '../grow_out_loud/foundation/gol_radius.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: colors.backgroundPrimary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: GOLPrimitives.success500,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: GOLSpacing.space2),
            Text(
              'AI Assistant',
              style: textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.more),
            onPressed: () {},
          ),
          const SizedBox(width: GOLSpacing.space1),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
              children: [
                Center(
                  child: Text(
                    'Today',
                    style: textTheme.labelSmall?.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ),
                const SizedBox(height: GOLSpacing.space4),
                _SystemMessage(
                  message: 'Hello! I\'m ready to help. You can mention @projects or #skills to give me context.',
                  time: '09:41 AM',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.space4),
                _UserMessage(
                  message: 'Draft a social post for @Apollo Launch announcing the beta release.',
                  time: '09:42 AM',
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.space4),
                _SystemMessage(
                  message: 'Here is a draft based on the project details. You can edit it before applying it to your Content queue.',
                  time: '09:42 AM',
                  hasCard: true,
                  colors: colors,
                  textTheme: textTheme,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(GOLSpacing.space4),
            decoration: BoxDecoration(
              color: colors.backgroundPrimary,
              border: Border(top: BorderSide(color: colors.borderDefault)),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  _IconButton(icon: Iconsax.direct, colors: colors),
                  const SizedBox(width: GOLSpacing.space2),
                  _IconButton(icon: Iconsax.hashtag, colors: colors),
                  const SizedBox(width: GOLSpacing.space3),
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
                      child: Text(
                        'Ask me anything...',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.textTertiary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: GOLSpacing.space3),
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
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final GOLSemanticColors colors;

  const _IconButton({required this.icon, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: colors.surfaceDefault,
        borderRadius: BorderRadius.circular(GOLRadius.sm),
      ),
      child: Icon(icon, size: 18, color: colors.textSecondary),
    );
  }
}

class _SystemMessage extends StatelessWidget {
  final String message;
  final String time;
  final bool hasCard;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _SystemMessage({
    required this.message,
    required this.time,
    this.hasCard = false,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Icon(Iconsax.cpu, color: colors.interactivePrimary, size: 18),
        ),
        const SizedBox(width: GOLSpacing.space3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(GOLSpacing.space3),
                decoration: BoxDecoration(
                  color: colors.surfaceDefault,
                  borderRadius: BorderRadius.circular(GOLRadius.md),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.textPrimary,
                        height: 1.5,
                      ),
                    ),
                    if (hasCard) ...[
                      const SizedBox(height: GOLSpacing.space3),
                      Container(
                        padding: const EdgeInsets.all(GOLSpacing.space3),
                        decoration: BoxDecoration(
                          color: colors.backgroundPrimary,
                          borderRadius: BorderRadius.circular(GOLRadius.sm),
                          border: Border.all(color: colors.borderDefault),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '📄  SOCIAL POST DRAFT',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: colors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colors.interactivePrimary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'AI Generated',
                                    style: textTheme.labelSmall?.copyWith(
                                      color: colors.interactivePrimary,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: GOLSpacing.space2),
                            Text(
                              '🚀 We are thrilled to announce the beta release of #Apollo!\n\nIt\'s been a long journey, but our personal execution system is finally ready for early adopters.',
                              style: textTheme.bodySmall?.copyWith(
                                color: colors.textSecondary,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: GOLSpacing.space1),
              Text(
                time,
                style: textTheme.labelSmall?.copyWith(
                  color: colors.textTertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UserMessage extends StatelessWidget {
  final String message;
  final String time;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _UserMessage({
    required this.message,
    required this.time,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 44),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
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
              const SizedBox(height: GOLSpacing.space1),
              Text(
                time,
                style: textTheme.labelSmall?.copyWith(
                  color: colors.textTertiary,
                ),
              ),
            ],
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
          child: Icon(Iconsax.user, color: colors.textInverse, size: 18),
        ),
      ],
    );
  }
}
