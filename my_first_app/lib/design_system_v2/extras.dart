// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2Dropdown<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final IconData? prefixIcon;

  const DSV2Dropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.label,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodyMedium,
      dropdownColor: Theme.of(context).cardColor,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Theme.of(context).iconTheme.color)
            : null,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
      icon: const Icon(Icons.arrow_drop_down, color: DSV2Theme.grey),
    );
  }
}

class DSV2TabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;

  const DSV2TabBar({super.key, required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: DSV2Theme.grey, width: 1)),
      ),
      child: TabBar(
        controller: controller,
        tabs: tabs.map((t) => Tab(text: t)).toList(),
        labelColor: DSV2Theme.teal,
        unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
        labelStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
        indicatorColor: DSV2Theme.teal,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
    );
  }
}

class DSV2BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;

  const DSV2BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      selectedItemColor: DSV2Theme.teal,
      unselectedItemColor: Theme.of(context).disabledColor,
      selectedLabelStyle: Theme.of(
        context,
      ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).cardColor,
      elevation: 8,
    );
  }
}
