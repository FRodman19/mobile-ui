import 'package:flutter/material.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';

class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Cards',
          subtitle: 'Standard, elevated, and image cards with consistent styling.',
        ),

        ComponentShowcase(
          title: 'Standard Card',
          description: 'Default card with 2dp elevation',
          specs: {
            'Padding': '16dp',
            'Border Radius': '12px',
            'Elevation': '2dp',
          },
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.cardPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: AppSpacing.stackXs),
                    const Text(
                      'This is a standard card with some sample content. Cards are used to group related information.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Elevated Card',
          description: 'Higher elevation for emphasis',
          specs: {
            'Elevation': '8dp',
          },
          children: [
            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.cardPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Elevated Card',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: AppSpacing.stackXs),
                    const Text('Higher elevation for more prominent content.'),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }
}
