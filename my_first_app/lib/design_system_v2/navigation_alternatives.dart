// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'theme_v2.dart';

class DSV2FloatingBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;

  const DSV2FloatingBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            items: items,
            selectedItemColor: DSV2Theme.teal,
            unselectedItemColor: DSV2Theme.grey,
            backgroundColor: Colors.transparent, // Uses container color
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}

class DSV2PillTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;

  const DSV2PillTabBar({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? DSV2Theme.greyDark
            : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TabBar(
        controller: controller,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: DSV2Theme.teal,
        ),
        labelColor: DSV2Theme.white,
        unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
        labelStyle: Theme.of(context).textTheme.labelMedium,
        tabs: tabs.map((t) => Tab(text: t, height: 36)).toList(),
        dividerColor: Colors.transparent,
        padding: const EdgeInsets.all(2),
        labelPadding: EdgeInsets.zero,
      ),
    );
  }
}
