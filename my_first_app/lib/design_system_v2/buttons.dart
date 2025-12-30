// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'theme_v2.dart';

enum DSV2ButtonSize { small, medium, large }

class DSV2Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final DSV2ButtonType type;
  final DSV2ButtonSize size;
  final IconData? icon;

  const DSV2Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = DSV2ButtonType.primary,
    this.size = DSV2ButtonSize.medium,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getHeight(),
      child: ElevatedButton(
        onPressed: onPressed,
        style: _getStyle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: _getTextColor()),
              const SizedBox(width: 8),
            ],
            Text(label, style: _getTextStyle(context)),
          ],
        ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case DSV2ButtonSize.small:
        return 32;
      case DSV2ButtonSize.medium:
        return 48;
      case DSV2ButtonSize.large:
        return 56;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
      color: _getTextColor(),
      fontSize: size == DSV2ButtonSize.small ? 12 : 14,
    );
  }

  Color _getTextColor() {
    // All buttons have black text per requirements, except maybe disabled?
    // Prompt says: "primary buttons : black text", "secondary buttons : black text", "tertiary button : black text"
    return DSV2Theme.black;
  }

  ButtonStyle _getStyle() {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
          side: type == DSV2ButtonType.secondary
              ? const BorderSide(color: DSV2Theme.black)
              : BorderSide.none,
        ),
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered) ||
            states.contains(MaterialState.pressed)) {
          return _getHoverColor();
        }
        return _getBaseColor();
      }),
      overlayColor: MaterialStateProperty.all(Colors.black12), // Subtle splash
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: DSV2Theme.horizontalPadding),
      ),
    );
  }

  Color _getBaseColor() {
    switch (type) {
      case DSV2ButtonType.primary:
        return DSV2Theme.teal;
      case DSV2ButtonType.secondary:
        return Colors.transparent;
      case DSV2ButtonType.tertiary:
        return DSV2Theme.grey;
    }
  }

  Color _getHoverColor() {
    switch (type) {
      case DSV2ButtonType.primary:
        return DSV2Theme.tealDark;
      case DSV2ButtonType.secondary:
        return Colors.grey.withOpacity(0.1);
      case DSV2ButtonType.tertiary:
        return Colors.grey.shade400;
    }
  }
}

enum DSV2ButtonType { primary, secondary, tertiary }

class DSV2FAB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String? label;
  final bool mini;

  const DSV2FAB({
    super.key,
    required this.onPressed,
    required this.icon,
    this.label,
    this.mini = false,
  });

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: Icon(icon, color: DSV2Theme.white),
        label: Text(
          label!,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: DSV2Theme.white,
          ),
        ),
        backgroundColor: DSV2Theme.teal,
        elevation: 4,
      );
    }
    return FloatingActionButton(
      onPressed: onPressed,
      mini: mini,
      backgroundColor: DSV2Theme.teal,
      child: Icon(icon, color: DSV2Theme.white),
    );
  }
}
