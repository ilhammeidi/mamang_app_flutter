import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_deco_main.dart';

class MiniMap extends StatelessWidget {
  const MiniMap({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// DECORATION
          Positioned(
            bottom: 0,
            left: 0,
            child: Column(
              children: [
                RoundedDecoMain(
                  height: 90, 
                  bgDecoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: spacingUnit(1),
              left: spacingUnit(3),
              right: spacingUnit(3),
              bottom: spacingUnit(1)
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed('/search-map');
              },
              child: PaperCard(
                content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    /// MAP
                    ClipRRect(
                      borderRadius: ThemeRadius.small,
                      child: Image.asset(
                        'assets/images/map_landscape.png',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover
                      )
                    ),
                    /// INFO
                    const SizedBox(height: 4),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
                      const SizedBox(width: 4),
                      const Expanded(
                        child: Text(
                          'Jl. Bengawan No.34, Cihapit, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40114',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(fontWeight: FontWeight.w500)
                        ),
                      )
                    ]),
                  ])
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}