import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({super.key, required this.onSelect, required this.current});

  final Function(int) onSelect;
  final int current;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Container(
      decoration: BoxDecoration(
        gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: RoundedClipPath(),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.surface,
              ),
            )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: spacingUnit(1), vertical: spacingUnit(1)),
            padding: const EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [ThemeShade.shadeSoft(context)],
              borderRadius: ThemeRadius.big
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(flex: 1, child: _buttonTab(current == 1, 'Promos', () => onSelect(1), context)),
              const SizedBox(width: 2),
              Expanded(flex: 1, child: _buttonTab(current == 2, 'Liked', () => onSelect(2), context)),
              const SizedBox(width: 2),
              Expanded(flex: 1, child: _buttonTab(current == 3, 'Puzzles', () => onSelect(3), context)),
            ]),
          )
        ],
      )
    );
  }

  Widget _buttonTab(bool isSelected, String text, Function() onSelect, context) {
    return FilledButton(
      onPressed: () {
        onSelect();
      },
      style: FilledButton.styleFrom(
        backgroundColor: isSelected ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
        foregroundColor: isSelected ? Theme.of(context).colorScheme.onPrimaryContainer : Theme.of(context).colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeRadius.big
        )
      ),
      child: Text(text, style: ThemeText.subtitle),
    );
  }
}