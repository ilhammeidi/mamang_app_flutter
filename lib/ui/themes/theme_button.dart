import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';

class ThemeButton {
  static BorderRadius buttonRadius = ThemeRadius.medium;

  // Filled Button
  static ButtonStyle primary = FilledButton.styleFrom(
    backgroundColor: ThemePalette.primaryMain,
    foregroundColor: Colors.white,
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
  static ButtonStyle outlinedPrimary(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: ThemePalette.primaryMain,
      ),
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedSecondary(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: ThemePalette.secondaryMain,
      ),
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle outlinedTertiary(BuildContext context) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: ThemePalette.tertiaryMain
      ),
      foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Tonal Button
  static ButtonStyle tonalPrimary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle tonalSecondary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle tonalTertiary(BuildContext context) {
    return FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Text Button
  static ButtonStyle textPrimary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle textSecondary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  static ButtonStyle textTertiary(BuildContext context) {
    return TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadius,
      ),
    );
  }

  // Button Size
  static ButtonStyle btnBig = TextButton.styleFrom(
    minimumSize: const Size(200, 40),
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(150),
    ),
  );
  static ButtonStyle btnSmall = TextButton.styleFrom(
    minimumSize: const Size(75, 20),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
  );
}
