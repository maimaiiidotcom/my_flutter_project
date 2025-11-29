import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// App color palettes
const Color _primary = Color(0xFF0D47A1); // deep blue
const Color _secondary = Color(0xFF00ACC1); // cyan
const Color _background = Color(0xFFF6F9FB); // very light blue/gray
const Color _surface = Color(0xFFFFFFFF);
const Color _onBackground = Color(0xFF0B2545);
const Color _error = Color(0xFFB00020);

// Light color scheme
final ColorScheme appLightScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: _primary,
  onPrimary: Colors.white,
  secondary: _secondary,
  onSecondary: Colors.white,
  error: _error,
  onError: Colors.white,
  background: _background,
  onBackground: _onBackground,
  surface: _surface,
  onSurface: _onBackground,
);

// Dark color scheme (complimentary, tuned for contrast)
final ColorScheme appDarkScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF90CAF9),
  onPrimary: Color(0xFF0B2545),
  secondary: Color(0xFF80DEEA),
  onSecondary: Color(0xFF0B2545),
  error: Color(0xFFCF6679),
  onError: Colors.black,
  background: Color(0xFF0B1A2B),
  onBackground: Color(0xFFEAF4FF),
  surface: Color(0xFF071427),
  onSurface: Color(0xFFEAF4FF),
);

// Text theme: Merriweather for headings, Inter for body
TextTheme _buildTextTheme(Color onBackground) {
  return TextTheme(
    displayLarge: GoogleFonts.merriweather(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      height: 1.05,
      color: onBackground,
    ),
    displayMedium: GoogleFonts.merriweather(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      height: 1.08,
      color: onBackground,
    ),
    headlineLarge: GoogleFonts.merriweather(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.1,
      color: onBackground,
    ),
    titleLarge: GoogleFonts.merriweather(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.12,
      color: onBackground,
    ),
    titleMedium: GoogleFonts.merriweather(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: onBackground,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: onBackground,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: onBackground,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: onBackground,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: onBackground,
    ),
  );
}

// Light ThemeData
final ThemeData appThemeLight = ThemeData(
  useMaterial3: true,
  colorScheme: appLightScheme,
  scaffoldBackgroundColor: appLightScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: appLightScheme.primary,
    foregroundColor: appLightScheme.onPrimary,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: _buildTextTheme(appLightScheme.onBackground).titleLarge?.copyWith(color: appLightScheme.onPrimary),
  ),
  textTheme: _buildTextTheme(appLightScheme.onBackground),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: appLightScheme.primary,
      foregroundColor: appLightScheme.onPrimary,
      textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: appLightScheme.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
  ),
);

// Dark ThemeData
final ThemeData appThemeDark = ThemeData(
  useMaterial3: true,
  colorScheme: appDarkScheme,
  scaffoldBackgroundColor: appDarkScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: appDarkScheme.surface,
    foregroundColor: appDarkScheme.onSurface,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: _buildTextTheme(appDarkScheme.onBackground).titleLarge?.copyWith(color: appDarkScheme.onSurface),
  ),
  textTheme: _buildTextTheme(appDarkScheme.onBackground),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: appDarkScheme.primary,
      foregroundColor: appDarkScheme.onPrimary,
      textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: appDarkScheme.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
  ),
);