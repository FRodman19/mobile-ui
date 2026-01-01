import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../grow_out_loud/foundation/gol_colors.dart';
import '../grow_out_loud/foundation/gol_spacing.dart';
import '../grow_out_loud/foundation/gol_radius.dart';
import '../grow_out_loud/components/gol_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<GOLSemanticColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GOLSpacing.space6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Grow Out Loud',
                style: textTheme.displayMedium?.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GOLSpacing.space4),
              Text(
                'Ready to build something real',
                style: textTheme.bodyLarge?.copyWith(
                  color: colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GOLSpacing.space8),
              if (kDebugMode) ...[
                GOLButton(
                  label: 'View Design Gallery',
                  onPressed: () => Navigator.pushNamed(context, '/design-system-v3'),
                  variant: GOLButtonVariant.primary,
                ),
                const SizedBox(height: GOLSpacing.space3),
                Text(
                  'Design gallery is only available in debug mode',
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
