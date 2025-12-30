import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../design_system_v3/badges.dart';
import '../design_system_v3/buttons.dart';
import '../design_system_v3/cards.dart';
import '../design_system_v3/chips.dart';
import '../design_system_v3/icon_container.dart';
import '../design_system_v3/spacing_v3.dart';
import '../design_system_v3/theme_v3.dart';

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
      backgroundColor: isDark ? DSV3Colors.darkBackground : DSV3Colors.white,
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
                        ? DSV3Colors.neutral300
                        : DSV3Colors.neutral500,
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
                horizontal: DSV3Spacing.horizontalPadding,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DSV3Chip(
                    label: 'Today',
                    isSelected: _selectedFilter == 0,
                    onTap: () => setState(() => _selectedFilter = 0),
                  ),
                  DSV3Chip(
                    label: 'This Week',
                    isSelected: _selectedFilter == 1,
                    onTap: () => setState(() => _selectedFilter = 1),
                  ),
                  DSV3Chip(
                    label: 'This Month',
                    isSelected: _selectedFilter == 2,
                    onTap: () => setState(() => _selectedFilter = 2),
                  ),
                ],
              ),
            ),

            const SizedBox(height: DSV3Spacing.lg),

            // Net Profit Card
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.horizontalPadding,
              ),
              child: DSV3Card(
                tone: DSV3CardTone.elevated,
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
                                          ? DSV3Colors.neutral300
                                          : DSV3Colors.neutral500,
                                    ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Iconsax.info_circle,
                                size: 16,
                                color: isDark
                                    ? DSV3Colors.neutral500
                                    : DSV3Colors.neutral500,
                              ),
                            ],
                          ),
                          const SizedBox(height: DSV3Spacing.sm),
                          Text(
                            '\$8,240.50',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    const DSV3Badge(
                      label: '+12.5%',
                      variant: DSV3BadgeVariant.success,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: DSV3Spacing.md),

            // Revenue & Spend
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.horizontalPadding,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DSV3Card(
                      tone: DSV3CardTone.elevated,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.wallet_money,
                            size: 28,
                            color: DSV3Colors.teal500,
                          ),
                          const SizedBox(height: DSV3Spacing.sm),
                          Text(
                            'Revenue',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: isDark
                                      ? DSV3Colors.neutral300
                                      : DSV3Colors.neutral500,
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
                  const SizedBox(width: DSV3Spacing.md),
                  Expanded(
                    child: DSV3Card(
                      tone: DSV3CardTone.elevated,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Iconsax.card,
                            size: 28,
                            color: DSV3Colors.orange500,
                          ),
                          const SizedBox(height: DSV3Spacing.sm),
                          Text(
                            'Spend',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: isDark
                                      ? DSV3Colors.neutral300
                                      : DSV3Colors.neutral500,
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

            const SizedBox(height: DSV3Spacing.lg),

            // Quick Actions
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.horizontalPadding,
              ),
              child: Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            const SizedBox(height: DSV3Spacing.sm),

            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: DSV3Spacing.horizontalPadding,
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

            const SizedBox(height: DSV3Spacing.lg),

            // Top Projects
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.horizontalPadding,
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
                    ).textTheme.labelLarge?.copyWith(color: DSV3Colors.teal500),
                  ),
                ],
              ),
            ),

            const SizedBox(height: DSV3Spacing.sm),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.horizontalPadding,
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
                  const SizedBox(height: DSV3Spacing.sm),
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

            const SizedBox(height: DSV3Spacing.lg),

            // Worst Projects
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.horizontalPadding,
              ),
              child: Row(
                children: [
                  Text(
                    'Worst Projects',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(width: 8),
                  const DSV3Badge(
                    label: 'Low ROI',
                    variant: DSV3BadgeVariant.error,
                  ),
                ],
              ),
            ),

            const SizedBox(height: DSV3Spacing.sm),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.horizontalPadding,
              ),
              child: _buildProjectCard(
                Iconsax.box,
                'DropStore X',
                'E-commerce',
                '-\$420',
                false,
              ),
            ),

            const SizedBox(height: DSV3Spacing.xl),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(IconData icon, String label, bool isPrimary) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: DSV3Button(
        label: label,
        icon: icon,
        variant: isPrimary
            ? DSV3ButtonVariant.primary
            : DSV3ButtonVariant.secondary,
        onPressed: () {},
        size: DSV3ButtonSize.small,
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
    final accentColor = isPositive ? DSV3Colors.teal500 : DSV3Colors.premiumRed;

    return DSV3Card(
      child: Row(
        children: [
          DSV3IconContainer(
            icon: icon,
            color: accentColor,
          ),
          const SizedBox(width: DSV3Spacing.md),
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
                            ? DSV3Colors.neutral300
                            : DSV3Colors.neutral500,
                      ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: isPositive
                      ? DSV3Colors.premiumGreen
                      : DSV3Colors.premiumRed,
                ),
          ),
        ],
      ),
    );
  }
}
