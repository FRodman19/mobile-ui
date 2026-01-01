import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/components/gol_lists.dart';
import '../grow_out_loud/components/gol_progress.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';
import '../grow_out_loud/foundation/gol_radius.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

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
              'PERFORMANCE',
              style: textTheme.bodySmall?.copyWith(
                letterSpacing: 0.5,
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(height: GOLSpacing.space1),
            Text(
              'Analytics',
              style: textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.setting_2),
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
            _performancePulse(context, colors, textTheme),
            const SizedBox(height: GOLSpacing.space6),
            _financeRow(context, colors, textTheme),
            const SizedBox(height: GOLSpacing.space6),
            _signalsList(colors, textTheme),
          ],
        ),
      ),
    );
  }

  Widget _performancePulse(BuildContext context, GOLSemanticColors colors, TextTheme textTheme) {
    return GOLCard(
      variant: GOLCardVariant.elevated,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Net Profit',
                  style: textTheme.labelMedium?.copyWith(
                    color: colors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: GOLSpacing.space2),
                Text(
                  '\$8,240',
                  style: textTheme.headlineSmall?.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
                const SizedBox(height: GOLSpacing.space3),
                Row(
                  children: [
                    _statusPill('+12.5%', colors.stateSuccess),
                    const SizedBox(width: GOLSpacing.space2),
                    _statusPill('Monthly', colors.textAccent),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: GOLSpacing.space4),
          GOLCircularProgress(value: 0.72, size: 88),
        ],
      ),
    );
  }

  Widget _financeRow(BuildContext context, GOLSemanticColors colors, TextTheme textTheme) {
    final metrics = [
      {
        'label': 'Revenue',
        'value': '\$12,400',
        'icon': Iconsax.wallet,
        'color': colors.interactivePrimary,
      },
      {
        'label': 'Spend',
        'value': '\$6,120',
        'icon': Iconsax.card,
        'color': colors.stateWarning,
      },
      {
        'label': 'Margin',
        'value': '52%',
        'icon': Iconsax.chart,
        'color': colors.stateSuccess,
      },
    ];

    return Row(
      children: metrics
          .map(
            (metric) => Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: metric == metrics.last ? 0 : GOLSpacing.space3,
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
                      metric['icon'] as IconData,
                      color: metric['color'] as Color,
                      size: 24,
                    ),
                    const SizedBox(height: GOLSpacing.space2),
                    Text(
                      metric['value'] as String,
                      style: textTheme.headlineSmall?.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      metric['label'] as String,
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _signalsList(GOLSemanticColors colors, TextTheme textTheme) {
    final signals = [
      {
        'title': 'Engagement up +18%',
        'detail': 'Creator Q3 series',
        'type': 'Signal',
      },
      {
        'title': 'Review workflow blocks',
        'detail': 'AI flagged risk of delay',
        'type': 'Alert',
      },
      {
        'title': 'Campaign ready to ship',
        'detail': 'Client approval pending',
        'type': 'Action',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Signals',
          style: textTheme.headlineSmall?.copyWith(color: colors.textPrimary),
        ),
        const SizedBox(height: GOLSpacing.space3),
        GOLCard(
          variant: GOLCardVariant.standard,
          child: Column(
            children: signals
                .map(
                  (signal) => Column(
                    children: [
                      GOLListItem(
                        title: signal['title'] as String,
                        subtitle: signal['detail'] as String,
                        leading: Icon(
                          Iconsax.activity,
                          color: colors.interactivePrimary,
                          size: 24,
                        ),
                        trailing: Text(
                          signal['type'] as String,
                          style: textTheme.bodySmall?.copyWith(color: colors.textSecondary),
                        ),
                      ),
                      if (signals.indexOf(signal) != signals.length - 1)
                        const Divider(height: 1),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: GOLSpacing.space4),
        Text(
          'Smooth trends with the 8-point grid and keep your metrics within the golden accent band.',
          style: textTheme.bodySmall?.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }

  Widget _statusPill(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GOLSpacing.space3,
        vertical: GOLSpacing.space1,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(GOLRadius.full),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
