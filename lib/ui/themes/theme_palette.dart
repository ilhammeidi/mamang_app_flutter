import 'package:flutter/material.dart';


class ThemePalette {
  // Primary
  static Color primaryMain = Colors.tealAccent.shade700;
  static Color primaryLight = Colors.tealAccent.shade100;
  static Color primaryDark = Colors.teal.shade900;

  // Secondary
  static Color secondaryMain = Colors.lightBlueAccent;
  static Color secondaryLight = Colors.lightBlue.shade100;
  static Color secondaryDark = Colors.lightBlue.shade900;

  // Tertiary
  static Color tertiaryMain = Colors.redAccent;
  static Color tertiaryLight = Colors.red.shade100;
  static Color tertiaryDark = Colors.red.shade900;

  // Base
  static Color paperLight = Colors.white;
  static Color paperDark = Colors.grey.shade900;
  static Color defaultLight = Colors.grey.shade200;
  static Color defaultDark = Colors.grey.shade800;

  // Gradient
  static LinearGradient gradientMixedMain = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: <Color>[ThemePalette.secondaryMain, ThemePalette.primaryMain]
  );

  static LinearGradient gradientMixedDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: <Color>[ThemePalette.secondaryDark, ThemePalette.primaryDark]
  );
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount / 1.5).clamp(0.0, 1.0));

  return hslLight.toColor();
}