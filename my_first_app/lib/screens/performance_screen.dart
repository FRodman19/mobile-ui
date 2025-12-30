import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../design_system/badges.dart';
import '../design_system/buttons.dart';
import '../design_system/cards.dart';
import '../design_system/chips.dart';
import '../design_system/icon_container.dart';
import '../design_system/spacing.dart';
import '../design_system/theme.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  int _selectedFilter = 2;

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
              'PERFORMANCE',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    letterSpacing: 0.5,
                    color: isDark
                        ? DSColors.neutral300
                        : DSColors.neutral500,
                  ),
            ),
            Text(
              'Analytics',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Iconsax.setting_2),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time filter tabs
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DSChip(
                    label: 'Today',
                    isSelected: _selectedFilter == 0,
                    onTap: () => setState(() => _selectedFilter = 0),
                  ),
                  DSChip(
                    label: 'This Week',
                    isSelected: _selectedFilter == 1,
                    onTap: () => setState(() => _selectedFilter = 1),
                  ),
                  DSChip(
                    label: 'This Month',
                    isSelected: _selectedFilter == 2,
                    onTap: () => setState(() => _selectedFilter = 2),
                  ),
                ],
              ),
            ),

            const SizedBox(height: DSSpacing.lg),

            // Net Profit Card
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              child: DSCard(
                tone: DSCardTone.elevated,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'NET PROFIT',
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      letterSpacing: 0.5,
                                      color: isDark
                                          ? DSColors.neutral300
                                          : DSColors.neutral500,
                                    ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Iconsax.info_circle,
                                size: 16,
                                color: isDark
                                    ? DSColors.neutral500
                                    : DSColors.neutral500,
                              ),
                            ],
                          ),
                          const SizedBox(height: DSSpacing.sm),
                          Text(
                            '\$8,240.50',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    const DSBadge(
                      label: '+12.5%',
                      variant: DSBadgeVariant.success,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: DSSpacing.md),

            // Revenue & Spend
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DSCard(
                      tone: DSCardTone.elevated,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.wallet_money,
                            size: 28,
                            color: DSColors.teal500,
                          ),
                          const SizedBox(height: DSSpacing.sm),
                          Text(
                            'Revenue',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: isDark
                                      ? DSColors.neutral300
                                      : DSColors.neutral500,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$12,400',
                            style: Theme.of(context).textTheme.headlineSmall,
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
                            Iconsax.card,
                            size: 28,
                            color: DSColors.orange500,
                          ),
                          const SizedBox(height: DSSpacing.sm),
                          Text(
                            'Spend',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: isDark
                                      ? DSColors.neutral300
                                      : DSColors.neutral500,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$4,159',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: DSSpacing.lg),

            // Quick Actions
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              child: Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            const SizedBox(height: DSSpacing.sm),

            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: DSSpacing.horizontalPadding,
                ),
                children: [
                  _buildQuickActionButton(Iconsax.add, 'Add Entry', false),
                  _buildQuickActionButton(
                    Iconsax.flash,
                    'Create Project',
                    true,
                  ),
                  _buildQuickActionButton(Iconsax.chart, 'View Report', false),
                ],
              ),
            ),

            const SizedBox(height: DSSpacing.lg),

            // Top Projects
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Projects',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'View All',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: DSColors.teal500),
                  ),
                ],
              ),
            ),

            const SizedBox(height: DSSpacing.sm),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              child: Column(
                children: [
                  _buildProjectCard(
                    Iconsax.flash,
                    'NeoLaunch',
                    'SaaS Platform',
                    '+\$3,240',
                    true,
                  ),
                  const SizedBox(height: DSSpacing.sm),
                  _buildProjectCard(
                    Iconsax.microphone,
                    'Podcast Pro',
                    'Media',
                    '+\$1,850',
                    true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: DSSpacing.lg),

            // Worst Projects
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              child: Row(
                children: [
                  Text(
                    'Worst Projects',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(width: 8),
                  const DSBadge(
                    label: 'Low ROI',
                    variant: DSBadgeVariant.error,
                  ),
                ],
              ),
            ),

            const SizedBox(height: DSSpacing.sm),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSSpacing.horizontalPadding,
              ),
              child: _buildProjectCard(
                Iconsax.box,
                'DropStore X',
                'E-commerce',
                '-\$420',
                false,
              ),
            ),

            const SizedBox(height: DSSpacing.xl),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(IconData icon, String label, bool isPrimary) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: DSButton(
        label: label,
        icon: icon,
        variant: isPrimary
            ? DSButtonVariant.primary
            : DSButtonVariant.secondary,
        onPressed: () {},
        size: DSButtonSize.small,
      ),
    );
  }

  Widget _buildProjectCard(
    IconData icon,
    String name,
    String category,
    String amount,
    bool isPositive,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isPositive ? DSColors.teal500 : DSColors.premiumRed;

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
                  name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? DSColors.neutral300
                            : DSColors.neutral500,
                      ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: isPositive
                      ? DSColors.premiumGreen
                      : DSColors.premiumRed,
                ),
          ),
        ],
      ),
    );
  }
}
