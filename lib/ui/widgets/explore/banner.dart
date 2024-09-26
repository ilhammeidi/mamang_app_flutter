import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';

class BannerExplore extends StatelessWidget {
  const BannerExplore({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedLight
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// TEXT TITLE
          Padding(
            padding: EdgeInsets.only(
              top: spacingUnit(2),
              left: spacingUnit(3),
              right: spacingUnit(3)
            ),
            child: const Column(children: [
              Text('Looking for Promo?', style: ThemeText.title, textAlign: TextAlign.center,),
              SizedBox(height: 8),
              Text(
                'This is the right place to find your favourite promotions, deals, and events!',
                style: ThemeText.subtitle2,
                textAlign: TextAlign.center,
              ),
            ])
          ),
          /// BANNER WITH ILLUSTRATION
          Stack(alignment: Alignment.topCenter,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: ClipPath(
                  clipper: RoundedClipPathTop(),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: ThemePalette.gradientMixedMain
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/explore.png',),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}