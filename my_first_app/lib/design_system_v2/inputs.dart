import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2Input extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const DSV2Input({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: DSV2Theme.black)
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: DSV2Theme.black)
            : null,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
