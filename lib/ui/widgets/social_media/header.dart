import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SocialMediaHeader extends StatelessWidget {
  const SocialMediaHeader({super.key, this.isFixed = false});

  final bool isFixed;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    return SliverAppBar(
      toolbarHeight: 60,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
        ),
      ),
      titleSpacing: spacingUnit(1),
      title: Row(children: [

        /// AVATAR AND USER PROFILE
        CircleAvatar(
          radius: 12.r,
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.bolt, color: Colors.white, size: 32,)
        ),
        SizedBox(width: spacingUnit(1)),
        Text('Latest Updates', style: ThemeText.title2.copyWith(color: Colors.white))
      ]),

      /// ACTION BUTTONS
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed('/inbox');
          },
          icon: Badge.count(
            backgroundColor: ThemePalette.tertiaryMain,
            count: 5,
            child: const Icon(Icons.message, size: 24, color: Colors.white),
          )
        ),
        const SizedBox(width: 2),
        IconButton(
          onPressed: () {
            Get.toNamed('/notifications');
          },
          icon: Badge.count(
            backgroundColor: ThemePalette.tertiaryMain,
            count: 10,
            child: const Icon(Icons.notifications, size: 24, color: Colors.white),
          )
        ),
        const SizedBox(width: 2),
        IconButton(
          onPressed: () {
            Get.toNamed('/faq');
          },
          icon: const Icon(Icons.help, size: 24, color: Colors.white)
        ),
      ],
    );
  }
}