import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/home/banner.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
  
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
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
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.surface,
              ),
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// Home Banner
              const HomeBanner(),
              Padding(
                padding: EdgeInsets.all(spacingUnit(1)),
                child: Row(
                  children: [
                    /// QR CODE SCANNER
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(spacingUnit(1)),
                        decoration: BoxDecoration(
                          boxShadow: [ThemeShade.shadeSoft(context)],
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: ThemeRadius.small
                        ),
                        child: const Icon(Icons.qr_code_scanner, size: 32,)
                      ),
                    ),
                    SizedBox(width: spacingUnit(1)),
                    // SEARCH BUTTON LIKED TEXTFILED 
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/explore');
                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.all(spacingUnit(1)),
                          decoration: BoxDecoration(
                            boxShadow: [ThemeShade.shadeSoft(context)],
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: ThemeRadius.small
                          ),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                            const Icon(Icons.search),
                            SizedBox(width: spacingUnit(1)),
                            const Text('Search Promos and Events')
                          ])
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]
      )
    );
  }
}