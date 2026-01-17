import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../foundation/gol_colors.dart';
import '../foundation/gol_spacing.dart';
import 'gol_buttons.dart';

enum GOLToastType { success, error, info }

Future<void> showGOLDialog(BuildContext context) {
  final colors = Theme.of(context).extension<GOLSemanticColors>()!;
  return showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirm action'),
        content: Text(
          'This dialog uses Grow Out Loud modal tokens and button styles.',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: colors.textSecondary),
        ),
        actions: [
          GOLButton(
            label: 'Cancel',
            variant: GOLButtonVariant.secondary,
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: GOLSpacing.space2),
          GOLButton(
            label: 'Confirm',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}

Future<void> showGOLBottomSheet(BuildContext context) {
  final colors = Theme.of(context).extension<GOLSemanticColors>()!;
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: false,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: GOLSpacing.space4,
          vertical: GOLSpacing.space6,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.borderStrong,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: GOLSpacing.space6),
            Text('Bottom Sheet', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: GOLSpacing.space2),
            Text(
              'Surface-raised panel with the standard top radius.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: colors.textSecondary),
            ),
            const SizedBox(height: GOLSpacing.space6),
            GOLButton(
              label: 'Close',
              variant: GOLButtonVariant.secondary,
              onPressed: () => Navigator.of(context).pop(),
              fullWidth: true,
            ),
          ],
        ),
      );
    },
  );
}

void showGOLToast(
  BuildContext context,
  String message, {
  GOLToastType type = GOLToastType.info,
}) {
  final colors = Theme.of(context).extension<GOLSemanticColors>()!;
  final iconColor = switch (type) {
    GOLToastType.success => colors.stateSuccess,
    GOLToastType.error => colors.stateError,
    GOLToastType.info => colors.textSecondary,
  };
  final iconData = switch (type) {
    GOLToastType.success => Iconsax.tick_circle,
    GOLToastType.error => Iconsax.close_circle,
    GOLToastType.info => Iconsax.info_circle,
  };
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: colors.backgroundInverse,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: colors.borderStrong),
      ),
      content: Row(
        children: [
          Icon(iconData, color: iconColor, size: 20),
          const SizedBox(width: GOLSpacing.space3),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: colors.textInverse),
            ),
          ),
        ],
      ),
    ),
  );
}
