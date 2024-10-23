import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_bottom.dart';

class TabMenuSocmed extends StatelessWidget {
  const TabMenuSocmed({
    super.key,
    required this.onSelect,
    required this.current,
    required this.fixed
  });

  final Function(int) onSelect;
  final int current;
  final bool fixed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      /// CURVE DECORATION
      color: colorScheme.surfaceContainerLowest,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Column(
              children: [
                ClipPath(
                  clipper: RoundedClipPathBottom(),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
                    ),
                  ),
                ),
              ],
            )
          ),

          /// TAB MENUS
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(spacingUnit(1)),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    boxShadow: [ThemeShade.shadeSoft(context)],
                    borderRadius: ThemeRadius.big
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(flex: 1, child: _buttonTab(current == 0, 'For You', () => onSelect(0), context)),
                    const SizedBox(width: 2),
                    Expanded(flex: 1, child: _buttonTab(current == 1, 'Following', () => onSelect(1), context)),
                  ]),
                ),
              ),
              const SizedBox(width: 4),
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: ThemePalette.secondaryMain, size: 24),
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.surface,
                    shadowColor: Colors.grey.withOpacity(0.9),
                    elevation: 6
                  ),
                ),
              ),
              SizedBox(width: spacingUnit(1)),
            ],
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