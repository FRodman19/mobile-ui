import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';
import '../../widgets/app_tooltip.dart';

class OverlaysSection extends StatelessWidget {
  const OverlaysSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Overlays',
          subtitle: 'Modals, bottom sheets, and snackbars.',
        ),

        ComponentShowcase(
          title: 'Snackbar/Toast',
          description: 'Success, error, and info notifications',
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Success message'),
                    backgroundColor: AppColors.success500,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 16,
                      right: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Show Success Toast'),
            ),
            SizedBox(height: AppSpacing.stackSm),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Error message'),
                    backgroundColor: AppColors.error500,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 16,
                      left: 16,
                      right: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              child: const Text('Show Error Toast'),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Tooltips',
          description: 'Informative tooltips with 16px radius, flat design',
          children: [
            Wrap(
              spacing: AppSpacing.inlineLg,
              runSpacing: AppSpacing.stackSm,
              children: const [
                AppTooltipSimple(
                  message: 'This is a tooltip',
                  child: Icon(Icons.info_outline),
                ),
                AppTooltipInfo(message: 'Information tooltip'),
                AppTooltipSimple(
                  message: 'Hover or long press to see tooltip',
                  child: Chip(label: Text('Hover me')),
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
