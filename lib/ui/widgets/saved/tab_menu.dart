import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';

class TabMenu extends StatelessWidget {
  const TabMenu({super.key, required this.onSelect, required this.current, required this.fixed});

  final Function(int) onSelect;
  final int current;
  final bool fixed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    Gradient? fixedBg() {
      if(fixed) {
        if(isDark) {
          return  ThemePalette.gradientMixedDark;
        }
        return ThemePalette.gradientMixedMain;
      }
      return null;
    }

    return Container(
      decoration: BoxDecoration(
        gradient: fixedBg()
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: RoundedClipPathTop(),
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLowest,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.surfaceContainerLowest,
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 2),
                    ),
                  ]
                ),
              ),
            )
          ),
          Container(
            margin: EdgeInsets.all(spacingUnit(1)),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [ThemeShade.shadeSoft(context)],
              borderRadius: ThemeRadius.big
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(flex: 1, child: _buttonTab(current == 0, 'Promos', () => onSelect(0), context)),
              const SizedBox(width: 2),
              Expanded(flex: 1, child: _buttonTab(current == 2, 'Vouchers', () => onSelect(2), context)),
              const SizedBox(width: 2),
              Expanded(flex: 1, child: _buttonTab(current == 1, 'Liked', () => onSelect(1), context)),
            ]),
          )
        ],
      ),
    );
  }

  Widget _buttonTab(bool isSelected, String text, Function() onSelect, context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: () {
        onSelect();
      },
      style: FilledButton.styleFrom(
        backgroundColor: isSelected ? colorScheme.primaryContainer : Colors.transparent,
        foregroundColor: isSelected ? colorScheme.onPrimaryContainer : colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: ThemeRadius.big
        )
      ),
      child: Text(text),
    );
  }
}