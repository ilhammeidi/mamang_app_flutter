import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/theme_palette.dart';
import 'package:mamang_app_flutter/ui/theme_radius.dart';
import 'package:flutter/scheduler.dart';

var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

class ThemeButton {
  static BorderRadius buttonRadius = ThemeRadius.medium;

  // Filled Button
  static ButtonStyle primary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.primaryMain,
    foregroundColor: ThemePalette.primaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle secondary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.secondaryMain,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle tertiary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.tertiaryMain,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  // Outlined Button
  static ButtonStyle outlinedPrimary = OutlinedButton.styleFrom(
    side: BorderSide(
      color: ThemePalette.primaryMain,
    ),
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.primaryLight : ThemePalette.primaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle outlinedSecondary = OutlinedButton.styleFrom(
    side: BorderSide(
      color: ThemePalette.secondaryMain,
    ),
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.secondaryLight : ThemePalette.secondaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle outlinedTertiary = OutlinedButton.styleFrom(
    side: BorderSide(
      color: ThemePalette.tertiaryMain,
    ),
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.tertiaryLight : ThemePalette.tertiaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  // Tonal Button
  static ButtonStyle tonalPrimary = FilledButton.styleFrom(
    backgroundColor: brightness == Brightness.dark
      ? ThemePalette.primaryDark : ThemePalette.primaryLight,
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.primaryLight : ThemePalette.primaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle tonalSecondary = FilledButton.styleFrom(
    backgroundColor: brightness == Brightness.dark
      ? ThemePalette.secondaryDark : ThemePalette.secondaryLight,
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.secondaryLight : ThemePalette.secondaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle tonalTertiary = FilledButton.styleFrom(
    backgroundColor: brightness == Brightness.dark
      ? ThemePalette.tertiaryDark : ThemePalette.tertiaryLight,
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.tertiaryLight : ThemePalette.tertiaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );

  // OutliTextned Button
  static ButtonStyle textPrimary = TextButton.styleFrom(
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.primaryLight : ThemePalette.primaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle textSecondary = TextButton.styleFrom(
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.secondaryLight : ThemePalette.secondaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle textTertiary = TextButton.styleFrom(
    foregroundColor: brightness == Brightness.dark
      ? ThemePalette.tertiaryLight : ThemePalette.tertiaryDark,
    shape: RoundedRectangleBorder(
      borderRadius: buttonRadius,
    ),
  );
  static ButtonStyle btnBig = TextButton.styleFrom(
    minimumSize: const Size(200, 40),
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(150),
    ),
  );
  static ButtonStyle btnSmall = TextButton.styleFrom(
    minimumSize: const Size(100, 20),
  );
}
