import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';

class IconsSection extends StatelessWidget {
  const IconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Icons',
          subtitle: 'Iconsax icon library - Linear (outline) and Bold variants.',
        ),

        ComponentShowcase(
          title: 'Icon Sizes',
          description: 'Common icon sizes - 24dp is default',
          children: [
            Wrap(
              spacing: AppSpacing.inlineMd,
              runSpacing: AppSpacing.stackMd,
              children: [
                _buildIconSize(context, 16, '16dp', Iconsax.home),
                _buildIconSize(context, 20, '20dp', Iconsax.home),
                _buildIconSize(context, 24, '24dp (Default)', Iconsax.home),
                _buildIconSize(context, 32, '32dp', Iconsax.home),
                _buildIconSize(context, 40, '40dp', Iconsax.home),
              ],
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Icon Colors',
          description: 'Semantic colors for different states',
          children: [
            Wrap(
              spacing: AppSpacing.inlineMd,
              runSpacing: AppSpacing.stackMd,
              children: [
                _buildColoredIcon('Primary', AppColors.iconPrimaryColor(Theme.of(context).brightness)),
                _buildColoredIcon('Active', AppColors.teal500),  // Sage green
                _buildColoredIcon('Success', AppColors.success500),
                _buildColoredIcon('Error', AppColors.error500),
                _buildColoredIcon('Warning', AppColors.warning500),
              ],
            ),
          ],
        ),

        ComponentShowcase(
          title: 'Common Icons',
          description: '20+ frequently used Iconsax icons',
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: AppSpacing.stackMd,
              crossAxisSpacing: AppSpacing.inlineMd,
              children: [
                _buildIconItem(context, Iconsax.home_2, 'Home'),
                _buildIconItem(context, Iconsax.folder_2, 'Folder'),
                _buildIconItem(context, Iconsax.teacher, 'Teacher'),
                _buildIconItem(context, Iconsax.document_text, 'Document'),
                _buildIconItem(context, Iconsax.chart_square, 'Chart'),
                _buildIconItem(context, Iconsax.add_circle, 'Add'),
                _buildIconItem(context, Iconsax.edit_2, 'Edit'),
                _buildIconItem(context, Iconsax.trash, 'Delete'),
                _buildIconItem(context, Iconsax.save_2, 'Save'),
                _buildIconItem(context, Iconsax.share, 'Share'),
                _buildIconItem(context, Iconsax.search_normal, 'Search'),
                _buildIconItem(context, Iconsax.filter, 'Filter'),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }

  Widget _buildIconSize(BuildContext context, double size, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: size, color: AppColors.teal500, weight: 600),  // Sage green with thicker weight
        SizedBox(height: AppSpacing.stack2xs),
        Text('${size.toInt()}dp', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildColoredIcon(String label, Color color) {
    return Column(
      children: [
        Icon(Iconsax.home_2, size: 32, color: color, weight: 600),  // Thicker icons
        SizedBox(height: AppSpacing.stack2xs),
        Text(label),
      ],
    );
  }

  Widget _buildIconItem(BuildContext context, IconData icon, String name) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 24),
        SizedBox(height: AppSpacing.stack2xs),
        Text(
          name,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
