import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../theme/spacing.dart';
import '../widgets/section_header.dart';
import '../widgets/component_showcase.dart';
import '../widgets/code_snippet.dart';
import '../widgets/custom_loader.dart';

class ButtonsSection extends StatefulWidget {
  const ButtonsSection({super.key});

  @override
  State<ButtonsSection> createState() => _ButtonsSectionState();
}

class _ButtonsSectionState extends State<ButtonsSection> {
  bool _isLoading = false;
  bool _isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Buttons',
          subtitle:
              'Primary, secondary, tertiary, FAB, icon, and destructive buttons with all states.',
        ),

        ComponentShowcase(
          title: 'Primary Button',
          description: 'Main conversion action - one per screen maximum',
          specs: {
            'Height': '48dp',
            'Padding': '12dp vertical, 24dp horizontal',
            'Border Radius': '12px',
            'Background': 'Teal 500 (vibrant teal)',
            'Text': 'White, Label Large (16sp)',
          },
          children: [
            ElevatedButton(
              onPressed: _isDisabled || _isLoading ? null : () {},
              child: _isLoading
                  ? const CustomLoader(size: 24, color: Colors.white)
                  : const Text('Create Project'),
            ),
            SizedBox(height: AppSpacing.stackSm),
            Row(
              children: [
                Checkbox(
                  value: _isDisabled,
                  onChanged: (value) =>
                      setState(() => _isDisabled = value ?? false),
                ),
                const Text('Disabled'),
                SizedBox(width: AppSpacing.inlineMd),
                Checkbox(
                  value: _isLoading,
                  onChanged: (value) =>
                      setState(() => _isLoading = value ?? false),
                ),
                const Text('Loading'),
              ],
            ),
          ],
        ),

        const CodeSnippet(
          code: '''ElevatedButton(
  onPressed: () {},
  child: Text('Create Project'),
)''',
        ),

        ComponentShowcase(
          title: 'Secondary Button',
          description: 'Supporting actions - multiple allowed per screen',
          specs: {
            'Background': 'Transparent',
            'Border': '2px solid Neutral 500 (grey)',
            'Text': 'Neutral 700 (light grey)',
          },
          children: [
            OutlinedButton(onPressed: () {}, child: const Text('Cancel')),
          ],
        ),

        const CodeSnippet(
          code: '''OutlinedButton(
  onPressed: () {},
  child: Text('Cancel'),
)''',
        ),

        ComponentShowcase(
          title: 'Tertiary / Text Button',
          description: 'Least important actions, inline links',
          specs: {
            'Background': 'Transparent',
            'Text': 'Neutral 700 (light grey), Label Medium (14sp)',
            'Padding': '8dp vertical, 16dp horizontal',
          },
          children: [
            TextButton(onPressed: () {}, child: const Text('Not now')),
          ],
        ),

        const CodeSnippet(
          code: '''TextButton(
  onPressed: () {},
  child: Text('Not now'),
)''',
        ),

        ComponentShowcase(
          title: 'Floating Action Button (FAB)',
          description: 'Primary screen action - always visible',
          specs: {
            'Size': '56x56dp (regular), 40x40dp (mini)',
            'Background': 'Teal 500 (vibrant teal)',
            'Icon': 'White, 24dp',
            'Elevation': '6dp',
          },
          children: [
            Row(
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  heroTag: 'fab-regular',
                  child: const Icon(Icons.add, size: 24),
                ),
                SizedBox(width: AppSpacing.inlineMd),
                FloatingActionButton.small(
                  onPressed: () {},
                  heroTag: 'fab-mini',
                  child: const Icon(Icons.add, size: 20),
                ),
              ],
            ),
          ],
        ),

        const CodeSnippet(
          code: '''FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)''',
        ),

        ComponentShowcase(
          title: 'Icon Button',
          description: 'Toolbar actions, header actions',
          specs: {
            'Size': '48x48dp (touch target)',
            'Icon Size': '24dp',
            'Color': 'Neutral 600 (dark) / Neutral 400 (light)',
          },
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                  tooltip: 'Close',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  tooltip: 'Edit',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  tooltip: 'Share',
                ),
              ],
            ),
          ],
        ),

        const CodeSnippet(
          code: '''IconButton(
  onPressed: () {},
  icon: Icon(Icons.close),
  tooltip: 'Close',
)''',
        ),

        ComponentShowcase(
          title: 'Destructive Button',
          description: 'Delete and dangerous actions',
          specs: {'Background': 'Error 500 (#EF4444)', 'Text': 'White'},
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error500,
                foregroundColor: Colors.white,
              ),
              child: const Text('Delete Project'),
            ),
          ],
        ),

        const CodeSnippet(
          code: '''ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.error500,
  ),
  child: Text('Delete Project'),
)''',
        ),

        SizedBox(height: AppSpacing.stackXl),
      ],
    );
  }
}
