import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';

class MiniMap extends StatelessWidget {
  const MiniMap({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        gradient: ThemePalette.gradientMixedMain
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// Decoration
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: RoundedClipPathTop(),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: spacingUnit(1),
              left: spacingUnit(3),
              right: spacingUnit(3),
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