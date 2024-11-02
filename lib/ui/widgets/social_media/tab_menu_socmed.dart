import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_deco_main.dart';
import 'package:mamang_app_flutter/ui/widgets/tab_menu/menu.dart';

class TabMenuSocmed extends StatelessWidget {
  const TabMenuSocmed({
    super.key,
    required this.onSelect,
    required this.current,
    this.onAddPost
  });

  final Function(int) onSelect;
  final int current;
  final Function()? onAddPost;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      /// CURVE DECORATION
      color: colorScheme.surfaceContainerLowest,
      padding: EdgeInsets.only(bottom: spacingUnit(1)),
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
                ),
              ],
            )
          ),

          /// TAB MENUS
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TabMenu(
                  onSelect: onSelect,
                  current: current,
                  menus: const ['For You', 'Following']
                )
              ),
              const SizedBox(width: 4),
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: onAddPost,
                  icon: Icon(Icons.add, color: colorScheme.onSecondaryContainer, size: 24),
                  style: IconButton.styleFrom(
                    backgroundColor: colorScheme.secondaryContainer,
                    shadowColor: Colors.grey.withOpacity(0.3),
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
}