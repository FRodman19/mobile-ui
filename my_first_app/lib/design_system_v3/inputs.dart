import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'spacing_v3.dart';

class DSV3TextField extends StatelessWidget {
  const DSV3TextField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.enabled = true,
  });

  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        errorText: errorText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
    );
  }
}

class DSV3SearchField extends StatelessWidget {
  const DSV3SearchField({
    super.key,
    this.hintText = 'Search',
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DSV3TextField(
      hintText: hintText,
      prefixIcon: Iconsax.search_normal,
      suffixIcon: Iconsax.close_circle,
    );
  }
}

class DSV3Dropdown<T> extends StatelessWidget {
  const DSV3Dropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.label,
  });

  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
      ),
      borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      icon: const Icon(Iconsax.arrow_down_1),
    );
  }
}

class DSV3CheckboxTile extends StatelessWidget {
  const DSV3CheckboxTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        const SizedBox(width: DSV3Spacing.sm),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class DSV3RadioTile<T> extends StatelessWidget {
  const DSV3RadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  });

  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<T>(value: value, groupValue: groupValue, onChanged: onChanged),
        const SizedBox(width: DSV3Spacing.sm),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class DSV3SwitchTile extends StatelessWidget {
  const DSV3SwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(value: value, onChanged: onChanged),
        const SizedBox(width: DSV3Spacing.sm),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class DSV3InputLabel extends StatelessWidget {
  const DSV3InputLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
    );
  }
}

class DSV3FieldGroup extends StatelessWidget {
  const DSV3FieldGroup({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .expand((child) => [child, const SizedBox(height: DSV3Spacing.sm)])
          .toList()
        ..removeLast(),
    );
  }
}
