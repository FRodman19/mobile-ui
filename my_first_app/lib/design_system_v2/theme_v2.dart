import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DSV2Theme {
  // Brand Colors
  static const Color teal = Color(0xFF009688);
  static const Color tealDark = Color(0xFF00796B); // Hover/Pressed
  static const Color tealAccent = Color(0xFF64FFDA); // Dark mode accent

  static const Color black = Color(0xFF000000);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkBackground = Color(0xFF121212);

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color greyDark = Color(0xFF424242);

  static const Color elegantGreen = Color(0xFF2E7D32);
  static const Color elegantRed = Color(0xFFC62828);
  static const Color elegantGreenDark = Color(0xFF66BB6A); // Dark mode
  static const Color elegantRedDark = Color(0xFFEF5350); // Dark mode

  static const double borderRadius = 16.0;
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 8.0;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: teal,
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      colorScheme: const ColorScheme.light(
        primary: teal,
        secondary: black,
        surface: white,
        error: elegantRed,
      ),
      textTheme: _buildTextTheme(Colors.black),
      inputDecorationTheme: _buildInputTheme(Colors.black, grey, white),
      checkboxTheme: _buildCheckboxTheme(teal, Colors.black),
      radioTheme: _buildRadioTheme(teal, Colors.black),
      switchTheme: _buildSwitchTheme(teal, grey),
      sliderTheme: _buildSliderTheme(teal),
      dividerTheme: const DividerThemeData(color: grey, thickness: 1),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: teal,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: teal,
        secondary: white,
        surface: darkSurface,
        error: elegantRedDark,
      ),
      textTheme: _buildTextTheme(white),
      inputDecorationTheme: _buildInputTheme(white, greyDark, darkSurface),
      checkboxTheme: _buildCheckboxTheme(teal, white),
      radioTheme: _buildRadioTheme(teal, white),
      switchTheme: _buildSwitchTheme(teal, greyDark),
      sliderTheme: _buildSliderTheme(teal),
      dividerTheme: const DividerThemeData(color: greyDark, thickness: 1),
      iconTheme: const IconThemeData(color: white),
    );
  }

  static TextTheme _buildTextTheme(Color color) {
    return TextTheme(
      displayLarge: GoogleFonts.sora(fontWeight: FontWeight.bold, color: color),
      displayMedium: GoogleFonts.sora(
        fontWeight: FontWeight.bold,
        color: color,
      ),
      displaySmall: GoogleFonts.sora(fontWeight: FontWeight.bold, color: color),
      headlineLarge: GoogleFonts.sora(
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineMedium: GoogleFonts.sora(
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineSmall: GoogleFonts.sora(
        fontWeight: FontWeight.bold,
        color: color,
      ),
      titleLarge: GoogleFonts.sora(fontWeight: FontWeight.bold, color: color),
      titleMedium: GoogleFonts.sora(fontWeight: FontWeight.bold, color: color),
      titleSmall: GoogleFonts.sora(fontWeight: FontWeight.bold, color: color),
      bodyLarge: GoogleFonts.openSans(color: color),
      bodyMedium: GoogleFonts.openSans(color: color),
      bodySmall: GoogleFonts.openSans(color: color),
      labelLarge: GoogleFonts.openSans(
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static InputDecorationTheme _buildInputTheme(
    Color textColor,
    Color borderColor,
    Color fillColor,
  ) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: GoogleFonts.openSans(color: textColor.withOpacity(0.5)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: teal, width: 2),
      ),
    );
  }

  static CheckboxThemeData _buildCheckboxTheme(
    Color activeColor,
    Color checkColor,
  ) {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return activeColor;
        return null; // Transparent/Default
      }),
      checkColor: MaterialStateProperty.all(
        Colors.white,
      ), // Always white check on teal
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: MaterialStateBorderSide.resolveWith(
        (states) => BorderSide(color: activeColor, width: 2),
      ),
    );
  }

  static RadioThemeData _buildRadioTheme(
    Color activeColor,
    Color unselectedColor,
  ) {
    return RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return activeColor;
        return unselectedColor.withOpacity(0.6);
      }),
    );
  }

  static SwitchThemeData _buildSwitchTheme(
    Color activeColor,
    Color trackColor,
  ) {
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) return activeColor;
        return Colors.grey.shade400;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected))
          return activeColor.withOpacity(0.5);
        return trackColor;
      }),
      trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  static SliderThemeData _buildSliderTheme(Color activeColor) {
    return SliderThemeData(
      activeTrackColor: activeColor,
      inactiveTrackColor: activeColor.withOpacity(0.3),
      thumbColor: activeColor,
      overlayColor: activeColor.withOpacity(0.1),
      valueIndicatorColor: activeColor,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
    );
  }
}
