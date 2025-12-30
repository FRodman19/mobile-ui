import 'package:flutter/material.dart';

import 'buttons.dart';
import 'spacing_v3.dart';
import 'theme_v3.dart';

class DSV3Modal {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(DSV3Spacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: DSV3Spacing.md),
                content,
                if (actions != null) ...[
                  const SizedBox(height: DSV3Spacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions
                        .expand((widget) => [widget, const SizedBox(width: 8)])
                        .toList()
                      ..removeLast(),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class DSV3BottomSheet {
  static Future<void> show({
    required BuildContext context,
    required Widget content,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      showDragHandle: true,
      builder: (context) {
        final background = Theme.of(context).cardColor;
        return Container(
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: background,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(DSV3Spacing.componentRadius),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DSV3Spacing.lg,
                vertical: DSV3Spacing.lg,
              ),
              child: content,
            ),
          ),
        );
      },
    );
  }
}

class DSV3Toast {
  static void show({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: DSV3Colors.teal500),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }
}

class DSV3InlineModal extends StatelessWidget {
  const DSV3InlineModal({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DSV3Spacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(body, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: DSV3Spacing.md),
          Row(
            children: [
              DSV3Button(
                label: 'Cancel',
                variant: DSV3ButtonVariant.tertiary,
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              DSV3Button(
                label: 'Confirm',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
