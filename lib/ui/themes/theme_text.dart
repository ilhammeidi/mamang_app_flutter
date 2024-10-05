import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';


class ThemeText {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: 'Nunito'
  );
  static const TextStyle title2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'Nunito'
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Nunito'
  );
  static const TextStyle subtitle2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito'
  );
  static const TextStyle paragraph = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito'
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito'
  );
}

class ThemeTextColor {
  static final bool _isDark = Get.isDarkMode;

  static TextStyle primary = TextStyle(
    color: ThemePalette.primaryMain
  );
  static TextStyle secondary = TextStyle(
    color: ThemePalette.secondaryMain
  );
  static TextStyle tertiary = TextStyle(
    color: ThemePalette.tertiaryMain
  );
  static TextStyle tonalPrimary(BuildContext context) {
    return TextStyle(
      color: _isDark ? ThemePalette.primaryLight : ThemePalette.primaryDark,
    );
  }
  static TextStyle tonalSecondary(BuildContext context) {
    return TextStyle(
      color: _isDark ? ThemePalette.secondaryLight : ThemePalette.secondaryDark,
    );
  }
  static TextStyle tonalTertiary(BuildContext context) {
    return TextStyle(
      color: _isDark ? ThemePalette.tertiaryLight : ThemePalette.tertiaryDark,
    );
  }
}
