import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'spacing_v3.dart';

class DSV3Colors {
  DSV3Colors._();

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color surfaceLight = Color(0xFFF6F6F4);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color darkBackground = Color(0xFF121212);

  static const Color neutral100 = Color(0xFFF2F2F2);
  static const Color neutral200 = Color(0xFFE2E2E2);
  static const Color neutral300 = Color(0xFFC8C8C8);
  static const Color neutral500 = Color(0xFF8C8C8C);

  static const Color orange50 = Color(0xFFFFF4E5);
  static const Color orange100 = Color(0xFFFFE6C7);
  static const Color orange200 = Color(0xFFFFD29A);
  static const Color orange300 = Color(0xFFFFBE6E);
  static const Color orange400 = Color(0xFFFFAA42);
  static const Color orange500 = Color(0xFFFF9A1F);
  static const Color orange600 = Color(0xFFE88700);

  static const Color teal50 = Color(0xFFE6FAF7);
  static const Color teal100 = Color(0xFFC9F2EC);
  static const Color teal200 = Color(0xFF9FE3D9);
  static const Color teal300 = Color(0xFF73D4C7);
  static const Color teal400 = Color(0xFF3EC4B3);
  static const Color teal500 = Color(0xFF18B4A7);
  static const Color teal600 = Color(0xFF109184);

  static const Color premiumGreen = Color(0xFF1F7A4C);
  static const Color premiumGreenSoft = Color(0xFFE6F4ED);
  static const Color premiumRed = Color(0xFFB23A2A);
  static const Color premiumRedSoft = Color(0xFFF8E8E6);
  static const Color premiumBlue = Color(0xFF2B7BBB);
  static const Color premiumBlueSoft = Color(0xFFE7F0FA);
  static const Color premiumAmber = Color(0xFFD87A2E);
  static const Color premiumAmberSoft = Color(0xFFFBEFDF);

  static const List<Color> orangePalette = [
    orange50,
    orange100,
    orange200,
    orange300,
    orange400,
    orange500,
    orange600,
  ];

  static const List<Color> tealPalette = [
    teal50,
    teal100,
    teal200,
    teal300,
    teal400,
    teal500,
    teal600,
  ];

  static const List<Color> neutralPalette = [
    white,
    surfaceLight,
    neutral100,
    neutral200,
    neutral300,
    neutral500,
    black,
  ];
}

class DSV3Theme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: DSV3Colors.orange500,
        secondary: DSV3Colors.teal500,
        surface: DSV3Colors.surfaceLight,
        background: DSV3Colors.white,
        error: DSV3Colors.premiumRed,
      ),
      scaffoldBackgroundColor: DSV3Colors.white,
      textTheme: _textTheme(DSV3Colors.black),
      iconTheme: const IconThemeData(color: DSV3Colors.black),
      cardTheme: CardThemeData(
        color: DSV3Colors.surfaceLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DSV3Spacing.cardRadius),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: DSV3Colors.neutral200,
        thickness: 1,
      ),
      inputDecorationTheme: _inputTheme(
        borderColor: DSV3Colors.neutral200,
        fillColor: DSV3Colors.surfaceLight,
        textColor: DSV3Colors.black,
      ),
      checkboxTheme: _checkboxTheme(
        activeColor: DSV3Colors.teal500,
        checkColor: DSV3Colors.black,
      ),
      radioTheme: _radioTheme(
        activeColor: DSV3Colors.teal500,
        inactiveColor: DSV3Colors.neutral500,
      ),
      switchTheme: _switchTheme(
        activeColor: DSV3Colors.teal500,
        inactiveColor: DSV3Colors.neutral200,
      ),
      tabBarTheme: _tabBarTheme(
        labelColor: DSV3Colors.black,
        indicatorColor: DSV3Colors.teal500,
      ),
      snackBarTheme: _snackBarTheme(
        background: DSV3Colors.black,
        textColor: DSV3Colors.white,
      ),
      dialogTheme: _dialogTheme(DSV3Colors.surfaceLight),
      bottomSheetTheme: _bottomSheetTheme(DSV3Colors.surfaceLight),
      tooltipTheme: _tooltipTheme(
        background: DSV3Colors.black,
        textColor: DSV3Colors.white,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: DSV3Colors.orange500,
        secondary: DSV3Colors.teal500,
        surface: DSV3Colors.surfaceDark,
        background: DSV3Colors.darkBackground,
        error: DSV3Colors.premiumRed,
      ),
      scaffoldBackgroundColor: DSV3Colors.darkBackground,
      textTheme: _textTheme(DSV3Colors.white),
      iconTheme: const IconThemeData(color: DSV3Colors.white),
      cardTheme: CardThemeData(
        color: DSV3Colors.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DSV3Spacing.cardRadius),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: DSV3Colors.neutral500,
        thickness: 1,
      ),
      inputDecorationTheme: _inputTheme(
        borderColor: DSV3Colors.neutral500,
        fillColor: DSV3Colors.surfaceDark,
        textColor: DSV3Colors.white,
      ),
      checkboxTheme: _checkboxTheme(
        activeColor: DSV3Colors.teal500,
        checkColor: DSV3Colors.black,
      ),
      radioTheme: _radioTheme(
        activeColor: DSV3Colors.teal500,
        inactiveColor: DSV3Colors.neutral300,
      ),
      switchTheme: _switchTheme(
        activeColor: DSV3Colors.teal500,
        inactiveColor: DSV3Colors.neutral500,
      ),
      tabBarTheme: _tabBarTheme(
        labelColor: DSV3Colors.white,
        indicatorColor: DSV3Colors.teal500,
      ),
      snackBarTheme: _snackBarTheme(
        background: DSV3Colors.white,
        textColor: DSV3Colors.black,
      ),
      dialogTheme: _dialogTheme(DSV3Colors.surfaceDark),
      bottomSheetTheme: _bottomSheetTheme(DSV3Colors.surfaceDark),
      tooltipTheme: _tooltipTheme(
        background: DSV3Colors.white,
        textColor: DSV3Colors.black,
      ),
    );
  }

  static TextTheme _textTheme(Color color) {
    return TextTheme(
      displayLarge: GoogleFonts.dmSans(
        fontSize: 40,
        height: 1.1,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      displayMedium: GoogleFonts.dmSans(
        fontSize: 32,
        height: 1.15,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      displaySmall: GoogleFonts.dmSans(
        fontSize: 28,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineLarge: GoogleFonts.dmSans(
        fontSize: 24,
        height: 1.25,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineMedium: GoogleFonts.dmSans(
        fontSize: 20,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineSmall: GoogleFonts.dmSans(
        fontSize: 18,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      bodyLarge: GoogleFonts.lato(
        fontSize: 16,
        height: 1.45,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodyMedium: GoogleFonts.lato(
        fontSize: 14,
        height: 1.4,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: GoogleFonts.lato(
        fontSize: 12,
        height: 1.35,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      labelLarge: GoogleFonts.lato(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      labelMedium: GoogleFonts.lato(
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      labelSmall: GoogleFonts.lato(
        fontSize: 11,
        height: 1.2,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static InputDecorationTheme _inputTheme({
    required Color borderColor,
    required Color fillColor,
    required Color textColor,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: DSV3Spacing.horizontalPadding,
        vertical: DSV3Spacing.verticalPadding,
      ),
      hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
        borderSide: const BorderSide(color: DSV3Colors.teal500, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
        borderSide: const BorderSide(color: DSV3Colors.premiumRed, width: 1.2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
        borderSide: const BorderSide(color: DSV3Colors.premiumRed, width: 1.5),
      ),
    );
  }

  static CheckboxThemeData _checkboxTheme({
    required Color activeColor,
    required Color checkColor,
  }) {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return activeColor;
        return null;
      }),
      checkColor: MaterialStateProperty.all(checkColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      side: const BorderSide(color: DSV3Colors.neutral300),
    );
  }

  static RadioThemeData _radioTheme({
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return activeColor;
        return inactiveColor;
      }),
    );
  }

  static SwitchThemeData _switchTheme({
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return activeColor.withOpacity(0.4);
        }
        return inactiveColor;
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return activeColor;
        return DSV3Colors.neutral300;
      }),
      trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  static TabBarThemeData _tabBarTheme({
    required Color labelColor,
    required Color indicatorColor,
  }) {
    return TabBarThemeData(
      labelColor: labelColor,
      unselectedLabelColor: labelColor.withOpacity(0.5),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: indicatorColor, width: 2),
      ),
    );
  }

  static SnackBarThemeData _snackBarTheme({
    required Color background,
    required Color textColor,
  }) {
    return SnackBarThemeData(
      backgroundColor: background,
      contentTextStyle: TextStyle(color: textColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );
  }

  static DialogThemeData _dialogTheme(Color background) {
    return DialogThemeData(
      backgroundColor: background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      ),
    );
  }

  static BottomSheetThemeData _bottomSheetTheme(Color background) {
    return BottomSheetThemeData(
      backgroundColor: background,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(DSV3Spacing.componentRadius),
        ),
      ),
    );
  }

  static TooltipThemeData _tooltipTheme({
    required Color background,
    required Color textColor,
  }) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(DSV3Spacing.componentRadius),
      ),
      textStyle: TextStyle(color: textColor),
      padding: const EdgeInsets.symmetric(
        horizontal: DSV3Spacing.horizontalPadding,
        vertical: DSV3Spacing.verticalPadding,
      ),
    );
  }
}
