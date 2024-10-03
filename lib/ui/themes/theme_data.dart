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
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
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
    surfaceContainerLowest: ThemePalette.defaultLight,
    onSurfaceVariant: Colors.grey[600],
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
    outline: Colors.grey[300],
    outlineVariant: Colors.grey[400],
  ),
);

ThemeData darkColorScheme = ThemeData(
  fontFamily: appFont,
  primaryColor: ThemePalette.primaryMain,
  primaryColorDark: ThemePalette.primaryDark,
  primaryColorLight: ThemePalette.primaryLight,
  brightness: Brightness.dark,
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
    surfaceContainerLowest: ThemePalette.defaultDark,
    onSurfaceVariant: Colors.grey.shade300,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.dark,
    outline: Colors.grey[400],
    outlineVariant: Colors.grey[500],
  )
);