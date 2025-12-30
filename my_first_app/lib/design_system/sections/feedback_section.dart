import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';
import '../widgets/custom_loader.dart';
import '../../widgets/app_chip.dart';
import '../../widgets/app_badge.dart';
import '../../widgets/app_progress.dart';

class FeedbackSection extends StatelessWidget {
  const FeedbackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Feedback',
          subtitle: 'Loading states, success states, errors, and empty states.',
        ),

        ComponentShowcase(
          title: 'Loading States',
          description: 'Custom animated loaders',
          children: [
            Row(
              children: [
                const CustomLoader(size: 30),
                SizedBox(width: AppSpacing.inlineLg),
                CustomLoader(size: 40, color: AppColors.teal500),  // Sage green
                SizedBox(width: AppSpacing.inlineLg),
                CustomLoader(size: 50, color: AppColors.teal600),  // Deep forest green
              ],
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Success State',
          description: 'Success checkmark icon',
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.success50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                size: 48,
                color: AppColors.success500,
              ),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Error State',
          description: 'Error icon with message',
          children: [
            Column(
              children: [
                Icon(
                  Icons.error,
                  size: 48,
                  color: AppColors.error500,
                ),
                SizedBox(height: AppSpacing.stackSm),
                Text(
                  'Something went wrong',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Please try again later',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Empty State',
          description: 'Empty state placeholder',
          children: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.inbox_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: AppSpacing.stackMd),
                  Text(
                    'No items yet',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: AppSpacing.stackXs),
                  Text(
                    'Create your first item to get started',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: AppSpacing.stackMd),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Create First Item'),
                  ),
                ],
              ),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Chips & Tags',
          description: 'Various chip styles with 16px radius, flat design',
          children: [
            Wrap(
              spacing: AppSpacing.inlineXs,
              runSpacing: AppSpacing.stackXs,
              children: const [
                AppChip(label: 'Primary', size: ChipSize.small),
                AppChip(label: 'Medium'),
                AppChip(label: 'Large', size: ChipSize.large),
                AppChipOutlined(label: 'Outlined'),
                AppChipNeutral(label: 'Neutral'),
                AppChipSuccess(label: 'Success'),
                AppChipError(label: 'Error'),
                AppChip(label: 'With Icon', icon: Icon(Icons.star, size: 16)),
              ],
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Badges',
          description: 'Premium colored badges for status indicators',
          children: [
            Wrap(
              spacing: AppSpacing.inlineMd,
              runSpacing: AppSpacing.stackSm,
              children: const [
                AppBadgeSuccess(label: 'Success', type: BadgeType.label),
                AppBadgeError(label: 'Error', type: BadgeType.label),
                AppBadgeWarning(label: 'Warning', type: BadgeType.label),
                AppBadgeInfo(label: 'Info', type: BadgeType.label),
                AppBadgePrimary(label: 'Primary', type: BadgeType.label),
                AppBadgeNeutral(label: 'Neutral', type: BadgeType.label),
                AppBadgeSuccess(label: '99+', type: BadgeType.count, size: BadgeSize.small),
                AppBadgeError(label: '5', type: BadgeType.count, size: BadgeSize.small),
                AppBadgeSuccess(type: BadgeType.dot, size: BadgeSize.medium),
                AppBadgeError(type: BadgeType.dot, size: BadgeSize.medium),
              ],
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Progress Bars',
          description: 'Linear and circular progress indicators',
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppProgressLinear(value: 0.3, showLabel: true),
                SizedBox(height: AppSpacing.stackMd),
                const AppProgressLinear(value: 0.7, showLabel: true, customLabel: 'Upload Progress'),
                SizedBox(height: AppSpacing.stackMd),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    AppProgressCircular(value: 0.25, showLabel: true, size: ProgressSize.small),
                    AppProgressCircular(value: 0.5, showLabel: true),
                    AppProgressCircular(value: 0.75, showLabel: true, size: ProgressSize.large),
                  ],
                ),
                SizedBox(height: AppSpacing.stackMd),
                AppProgressSteps(
                  totalSteps: 4,
                  currentStep: 2,
                  stepLabels: const ['Start', 'Setup', 'Review', 'Done'],
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }
}
