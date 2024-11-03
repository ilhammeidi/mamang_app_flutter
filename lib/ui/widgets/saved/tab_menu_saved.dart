import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_deco_main.dart';
import 'package:mamang_app_flutter/ui/widgets/tab_menu/menu.dart';

class TabMenuSaved extends StatelessWidget {
  const TabMenuSaved({super.key, required this.onSelect, required this.current});

  final Function(int) onSelect;
  final int current;

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
                RoundedDecoMain(
                  height: 40,
                  toBottom: true,
                  bgDecoration: BoxDecoration(
                    gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
                  ),
                )
              ],
            )
          ),
          
          /// TAB MENUS
          TabMenu(
            onSelect: onSelect,
            current: current,
            menus: const ['Saved', 'Voucher', 'Liked']
          )
        ],
      ),
    );
  }
}