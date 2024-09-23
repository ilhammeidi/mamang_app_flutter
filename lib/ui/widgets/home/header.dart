import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_data.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.isFixed = false});

  final bool isFixed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 20,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(isFixed ? 1 : 0),
            borderRadius: BorderRadius.only(
              topLeft: isFixed ? const Radius.circular(20) : const Radius.circular(0),
              topRight: isFixed ? const Radius.circular(20) : const Radius.circular(0)
            )
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
        ),
      ),
      titleSpacing: spacingUnit(1),
      title: Row(children: [
        CircleAvatar(
          radius: 24.r,
          backgroundImage: NetworkImage(userDummy.avatar),
        ),
        SizedBox(width: spacingUnit(1)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(userDummy.name, style: ThemeText.title2.copyWith(color: Colors.white)),
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.small,
              color: Colors.amber.shade700,
            ),
            child: Text(
              '${userDummy.title.toUpperCase()} • ${userDummy.point} Points',
              style: TextStyle(color: Colors.white, fontSize: 11, fontFamily: appFont, fontWeight: FontWeight.bold)
            )
          )
        ])
      ]),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge.count(
            backgroundColor: ThemePalette.tertiaryMain,
            count: 5,
            child: const Icon(Icons.message, size: 24, color: Colors.white),
          )
        ),
        const SizedBox(width: 2),
        IconButton(
          onPressed: () {},
          icon: Badge.count(
            backgroundColor: ThemePalette.tertiaryMain,
            count: 10,
            child: const Icon(Icons.notifications, size: 24, color: Colors.white),
          )
        ),
        const SizedBox(width: 2),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.help, size: 24, color: Colors.white)
        ),
      ],
    );
  }
}