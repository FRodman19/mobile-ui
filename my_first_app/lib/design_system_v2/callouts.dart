// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'theme_v2.dart';

enum DSV2CalloutType { info, warning, success, error }

class DSV2Callout extends StatelessWidget {
  final String text;
  final DSV2CalloutType type;
  final IconData? icon;

  const DSV2Callout({
    super.key,
    required this.text,
    this.type = DSV2CalloutType.info,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color contentColor;
    IconData defaultIcon;

    switch (type) {
      case DSV2CalloutType.info:
        bgColor = Colors.blue.shade50;
        contentColor = Colors.blue.shade900;
        defaultIcon = Icons.info_outline;
        break;
      case DSV2CalloutType.warning:
        bgColor = Colors.amber.shade50;
        contentColor = Colors.amber.shade900;
        defaultIcon = Icons.warning_amber_rounded;
        break;
      case DSV2CalloutType.success:
        bgColor = DSV2Theme.elegantGreen.withOpacity(0.1);
        contentColor = DSV2Theme.elegantGreen;
        defaultIcon = Icons.check_circle_outline;
        break;
      case DSV2CalloutType.error:
        bgColor = DSV2Theme.elegantRed.withOpacity(0.1);
        contentColor = DSV2Theme.elegantRed;
        defaultIcon = Icons.error_outline;
        break;
    }

    if (Theme.of(context).brightness == Brightness.dark) {
      bgColor = contentColor.withOpacity(0.2);
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
        border: Border.all(color: contentColor.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon ?? defaultIcon, color: contentColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: contentColor,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
