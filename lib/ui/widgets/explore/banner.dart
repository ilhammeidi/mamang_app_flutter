import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
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
      height: 360,
      decoration: BoxDecoration(
        gradient: isDark ?
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: <Color>[ThemePalette.paperDark, ThemePalette.secondaryDark]
          ) : ThemePalette.gradientMixedLight
      ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_banner.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            /// TEXT TITLE
            Padding(
              padding: EdgeInsets.only(
                left: spacingUnit(2),
                right: spacingUnit(2),
                bottom: spacingUnit(5),
              ),
              child: Column(children: [
                const Text('Looking for Promo?', style: ThemeText.title, textAlign: TextAlign.center,),
                const SizedBox(height: 8),
                Text(
                  branding.desc,
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
                        gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
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
        ),
      )
    );
  }
}