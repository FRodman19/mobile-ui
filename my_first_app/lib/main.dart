import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/main_navigation.dart';
import 'design_system/design_system_gallery.dart';
import 'theme/app_theme.dart';
import 'screens/design_system_v2_gallery_screen.dart';
import 'screens/design_system_v3_gallery_screen.dart';

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
          '/design-system': (context) => const DesignSystemGallery(),
        '/design-system-v2': (context) => const DesignSystemV2GalleryScreen(),
        if (kDebugMode)
          '/design-system-v3': (context) => const DesignSystemV3GalleryScreen(),
      },
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
