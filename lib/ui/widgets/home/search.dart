import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/home/banner.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input_btn.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final bool isTablet = MediaQuery.of(context).size.width >= 480;

    return Container(
      height: isTablet ? 350 : 300,
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
            child: ClipPath(
              clipper: RoundedClipPathTop(),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
              ),
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /// HOME BANNER
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

                    /// SEARCH BUTTON LIKED TEXTFILED 
                    const Expanded(
                      child: SearchInputBtn(
                        location: '/search-list',
                        title: 'Search Promo or Event',
                        shadow: true,
                      )
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