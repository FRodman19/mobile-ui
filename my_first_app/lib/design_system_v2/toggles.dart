// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class DSV2Checkbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String? label;

  const DSV2Checkbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    // Custom Checkbox Theme is applied via MaterialApp theme
    Widget checkbox = Checkbox(value: value, onChanged: onChanged);

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkbox,
          const SizedBox(width: 8),
          Text(label!, style: Theme.of(context).textTheme.bodyMedium),
        ],
      );
    }
    return checkbox;
  }
}

class DSV2Radio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;

  const DSV2Radio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    Widget radio = Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          radio,
          const SizedBox(width: 4),
          Text(label!, style: Theme.of(context).textTheme.bodyMedium),
        ],
      );
    }
    return radio;
  }
}

class DSV2Switch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;

  const DSV2Switch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    Widget switchWidget = Switch(value: value, onChanged: onChanged);

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          switchWidget,
          const SizedBox(width: 8),
          Text(label!, style: Theme.of(context).textTheme.bodyMedium),
        ],
      );
    }
    return switchWidget;
  }
}
