import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/main_navigation.dart';
import 'screens/design_system_gallery_screen.dart';
import 'screens/grow_out_loud_gallery_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grow Out Loud',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MainNavigation(),
        if (kDebugMode)
          '/design-system': (context) => const DesignSystemGalleryScreen(),
        if (kDebugMode)
          '/design-system-v3': (context) => const GrowOutLoudGalleryScreen(),
      },
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
