// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2ListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const DSV2ListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: DSV2Theme.horizontalPadding,
        vertical: 4,
      ),
      leading: leading,
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: subtitle != null
          ? Text(subtitle!, style: Theme.of(context).textTheme.bodySmall)
          : null,
      trailing: trailing,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSV2Theme.borderRadius),
      ),
      tileColor:
          Theme.of(context).scaffoldBackgroundColor == DSV2Theme.darkBackground
          ? DSV2Theme.darkSurface
          : DSV2Theme.white,
    );
  }
}
