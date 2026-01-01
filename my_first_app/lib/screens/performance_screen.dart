import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../grow_out_loud/components/gol_cards.dart';
import '../grow_out_loud/components/gol_chips.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  String _selectedPeriod = 'This Month';

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
          'Performance',
          style: textTheme.headlineLarge?.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.setting_2),
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
                  GOLChip(label: 'Today', selected: _selectedPeriod == 'Today'),
                  const SizedBox(width: GOLSpacing.space2),
                  GOLChip(label: 'This Week', selected: _selectedPeriod == 'This Week'),
                  const SizedBox(width: GOLSpacing.space2),
                  GOLChip(label: 'This Month', selected: _selectedPeriod == 'This Month'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(GOLSpacing.screenPaddingHorizontal),
              children: [
                GOLCard(
                  variant: GOLCardVariant.elevated,
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Icon(Iconsax.chart_21, size: 14, color: colors.textTertiary),
                                  const SizedBox(width: GOLSpacing.space1),
                                  Flexible(
                                    child: Text(
                                      'NET PROFIT',
                                      style: textTheme.labelSmall?.copyWith(
                                        color: colors.textSecondary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: GOLSpacing.space2),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '\$8,240',
                                      style: textTheme.headlineMedium?.copyWith(
                                        color: colors.textPrimary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Iconsax.arrow_up_3,
                                        size: 10,
                                        color: GOLPrimitives.success600,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        '+12%',
                                        style: textTheme.labelSmall?.copyWith(
                                          color: GOLPrimitives.success600,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          color: colors.borderDefault,
                          margin: const EdgeInsets.symmetric(horizontal: GOLSpacing.space3),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Icon(Iconsax.wallet_3, size: 14, color: colors.textTertiary),
                                  const SizedBox(width: GOLSpacing.space1),
                                  Flexible(
                                    child: Text(
                                      'REVENUE',
                                      style: textTheme.labelSmall?.copyWith(
                                        color: colors.textSecondary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: GOLSpacing.space2),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\$12,400',
                                  style: textTheme.headlineMedium?.copyWith(
                                    color: colors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          color: colors.borderDefault,
                          margin: const EdgeInsets.symmetric(horizontal: GOLSpacing.space3),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Icon(Iconsax.card, size: 14, color: colors.textTertiary),
                                  const SizedBox(width: GOLSpacing.space1),
                                  Flexible(
                                    child: Text(
                                      'SPEND',
                                      style: textTheme.labelSmall?.copyWith(
                                        color: colors.textSecondary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: GOLSpacing.space2),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\$4,159',
                                  style: textTheme.headlineMedium?.copyWith(
                                    color: colors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: GOLSpacing.betweenSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Projects',
                      style: textTheme.titleLarge?.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: textTheme.labelMedium?.copyWith(
                          color: colors.interactivePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: GOLSpacing.space3),
                _ProjectProfitCard(
                  icon: Iconsax.star,
                  name: 'NeoLaunch',
                  category: 'SaaS Platform',
                  profit: '+\$3,240',
                  isPositive: true,
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.space3),
                _ProjectProfitCard(
                  icon: Iconsax.microphone,
                  name: 'Podcast Pro',
                  category: 'Media',
                  profit: '+\$1,850',
                  isPositive: true,
                  colors: colors,
                  textTheme: textTheme,
                ),
                const SizedBox(height: GOLSpacing.betweenSections),
                Row(
                  children: [
                    Text(
                      'Worst Projects',
                      style: textTheme.titleLarge?.copyWith(
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
                        color: GOLPrimitives.warning500.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Low ROI',
                        style: textTheme.labelSmall?.copyWith(
                          color: GOLPrimitives.warning600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: GOLSpacing.space3),
                _ProjectProfitCard(
                  icon: Iconsax.box,
                  name: 'DropStore X',
                  category: 'E-commerce',
                  profit: '-\$420',
                  isPositive: false,
                  colors: colors,
                  textTheme: textTheme,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectProfitCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String category;
  final String profit;
  final bool isPositive;
  final GOLSemanticColors colors;
  final TextTheme textTheme;

  const _ProjectProfitCard({
    required this.icon,
    required this.name,
    required this.category,
    required this.profit,
    required this.isPositive,
    required this.colors,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return GOLCard(
      variant: GOLCardVariant.standard,
      child: Row(
        children: [
          Icon(icon, size: 32, color: colors.interactivePrimary),
          const SizedBox(width: GOLSpacing.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: GOLSpacing.space1),
                Text(
                  category,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            profit,
            style: textTheme.headlineSmall?.copyWith(
              color: isPositive ? GOLPrimitives.success500 : GOLPrimitives.error500,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
