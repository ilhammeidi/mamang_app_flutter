import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SavedHeader extends StatelessWidget {
  const SavedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    const TextStyle smallText = TextStyle(
      color: Colors.white,
      fontSize: 12,
    );

    return SliverAppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
        ),
      ),
      title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        /// USER POINTS
        CircleAvatar(
          radius: 12.r,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Icon(Icons.stars, size: 24, color: ThemePalette.primaryMain)
        ),
        SizedBox(width: spacingUnit(1)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Your Point', style: smallText),
          const SizedBox(width: 2),
          Text('200', style: ThemeText.subtitle.copyWith(color: Colors.white)),
        ]),
        SizedBox(width: spacingUnit(3)),

        /// USER COINS
        CircleAvatar(
          radius: 12.r,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: const Icon(Icons.motion_photos_on, size: 24, color: Colors.orange)
        ),
        SizedBox(width: spacingUnit(1)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Coins', style: smallText),
          const SizedBox(width: 2),
          Text('10000', style: ThemeText.subtitle.copyWith(color: Colors.white)),
        ]),
      ]),

      /// SCAN QR
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
          child: SizedBox(
            width: 110,
            height: 30,
            child: FilledButton(
              onPressed: () {},
              style: ThemeButton.btnSmall.merge(ThemeButton.invert2(context)),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.qr_code_scanner, size: 18),
                SizedBox(width: 8),
                Text('Scan QR', textAlign: TextAlign.center,)
              ])
            ),
          ),
        )
      ],
    );
  }
}