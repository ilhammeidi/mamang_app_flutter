import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';

String appFont = 'Nunito';

ThemeData lightColorScheme = ThemeData(
  fontFamily: appFont,
  primaryColor: ThemePalette.primaryMain,
  primaryColorDark: ThemePalette.primaryDark,
  primaryColorLight: ThemePalette.primaryLight,
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey[400]!),
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: ThemePalette.primaryMain,
    onPrimary: Colors.white,
    primaryContainer: ThemePalette.primaryLight,
    onPrimaryContainer: ThemePalette.primaryDark,
    secondary: ThemePalette.secondaryMain,
    onSecondary: Colors.white,
    secondaryContainer: ThemePalette.secondaryLight,
    onSecondaryContainer: ThemePalette.secondaryDark,
    tertiary: ThemePalette.tertiaryMain,
    onTertiary: Colors.white,
    tertiaryContainer: ThemePalette.tertiaryLight,
    onTertiaryContainer: ThemePalette.tertiaryDark,
    surface: ThemePalette.paperLight,
    onSurface: Colors.black,
    surfaceContainerHighest: ThemePalette.defaultLight,
    surfaceContainerLowest: ThemePalette.paperLight,
    onSurfaceVariant: Colors.grey[600],
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
    outline: const Color.fromARGB(255, 226, 235, 235),
    outlineVariant: const Color.fromARGB(255, 198, 208, 208),
    shadow: Colors.black.withOpacity(0.09),
  ),
);

ThemeData darkColorScheme = ThemeData(
  fontFamily: appFont,
  primaryColor: ThemePalette.primaryMain,
  primaryColorDark: ThemePalette.primaryDark,
  primaryColorLight: ThemePalette.primaryLight,
  brightness: Brightness.dark,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey[700]!)
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[500]!),
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: ThemePalette.primaryMain,
    onPrimary: Colors.white,
    primaryContainer: ThemePalette.primaryDark,
    onPrimaryContainer: ThemePalette.primaryLight,
    secondary: ThemePalette.secondaryMain,
    onSecondary: Colors.white,
    secondaryContainer: ThemePalette.secondaryDark,
    onSecondaryContainer: ThemePalette.secondaryLight,
    tertiary: ThemePalette.tertiaryMain,
    onTertiary: Colors.white,
    tertiaryContainer: ThemePalette.tertiaryDark,
    onTertiaryContainer: ThemePalette.tertiaryLight,
    surface: ThemePalette.paperDark,
    onSurface: Colors.white,
    surfaceContainerHighest: ThemePalette.paperDark,
    surfaceContainerLowest: ThemePalette.defaultDark,
    onSurfaceVariant: Colors.grey.shade300,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.dark,
    outline: const Color.fromARGB(255, 53, 69, 69),
    outlineVariant: const Color.fromARGB(255, 107, 135, 135),
    shadow: Colors.black.withOpacity(0.2)
  )
);