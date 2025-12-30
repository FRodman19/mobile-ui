import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2Modal {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
            side: BorderSide.none,
          ),
          elevation: 0, // No shadow
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 16),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!,
                  child: content,
                ),
                if (actions != null) ...[
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions,
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
