import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_deco_main.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class SearchExplore extends StatelessWidget {
  const SearchExplore({super.key, required this.gradientOpacity});

  final double gradientOpacity;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
  
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// DECORATION
          Positioned(
            bottom: 0,
            left: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest.withOpacity(gradientOpacity),
              ),
              child: Column(
                children: [
                  RoundedDecoMain(
                    height: 80,
                    bgDecoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLowest,
                    ),
                  ),
                ],
              ),
            )
          ),

          /// SEARCH BOX
          InkWell(
            onTap: () {
              Get.toNamed('/search-list');
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: spacingUnit(3), vertical: spacingUnit(2)),
              padding: EdgeInsets.all(spacingUnit(1)),
              decoration: BoxDecoration(
                boxShadow: gradientOpacity > 0 ? null : [ThemeShade.shadeSoft(context)],
                color: gradientOpacity > 0 ? colorScheme.outline : colorScheme.surface,
                borderRadius: ThemeRadius.small
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Icon(Icons.search),
                SizedBox(width: spacingUnit(1)),
                const Text('Search Promos or Events')
              ])
            ),
          ),
        ]
      )
    );
  }
}