import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/image_viewer.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_deco_main.dart';
import 'package:mamang_app_flutter/ui/widgets/tab_menu/menu.dart';

class ProfileBannerHeader extends SliverPersistentHeaderDelegate {
  const ProfileBannerHeader({
    required this.current,
    required this.onSelect, 
    required this.maxExtent,
    required this.minExtent
  });

  final int current;
  final Function(int) onSelect;

  @override
  final double maxExtent;
  
  @override
  final double minExtent;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final showItem = shrinkOffset < 50;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraint) {
        double maxWidth = constraint.maxWidth;
        return SizedBox(
          width: maxWidth,
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// BACKGROUND
              Image.asset(
                'assets/images/profile_banner.jpg',
                fit: BoxFit.cover,
              ),
          
              /// CURVE DECORATION
              Positioned(
                bottom: 0,
                left: 0,
                child: RoundedDecoMain(
                  height: 80,
                  bgDecoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest,
                    boxShadow: [BoxShadow(
                      color: colorScheme.surfaceContainerLowest,
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 2),
                    )],
                  ),
                )
              ),
          
              /// TOP BAR
              Positioned(
                top: spacingUnit(1),
                left: spacingUnit(2),
                child: AnimatedOpacity(
                  opacity: showItem ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    CircleAvatar(
                      radius: 15.r,
                      backgroundImage: NetworkImage(userDummy.avatar),
                    ),
                    SizedBox(width: spacingUnit(1)),
                    Text(userDummy.name, style: ThemeText.title2.copyWith(color: Colors.white)),
                  ]),
                ),
              ),
              Positioned(
                top: spacingUnit(1),
                right: spacingUnit(1),
                child: Row(children: [
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
                ]),
              ),
          
              /// USER PROFILE
              Positioned(
                bottom: 0,
                child: SizedBox(
                  width: maxWidth,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    /// AVATAR
                    AnimatedOpacity(
                      opacity: showItem ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: AnimatedScale(
                        scale: showItem ? 1 : 0,
                        curve: Curves.easeOutBack,
                        duration: const Duration(milliseconds: 300),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: userDummy.avatar,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => ImageViewer(img: userDummy.avatar));
                                },
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(userDummy.avatar),
                                ),
                              ),
                            ),
                            Positioned(
                              child: CircleAvatar(
                                radius: 13,
                                backgroundColor: ThemePalette.secondaryMain,
                                child: const Icon(Icons.verified, size: 20, color: Colors.white),
                              )
                            )
                          ],
                        )
                      ),
                    ),
                    
                    /// NAME
                    AnimatedOpacity(
                      opacity: showItem ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Text(userDummy.name, style: ThemeText.title.copyWith(color: Colors.white)),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: showItem ? Text(
                        userDummy.title.toCapitalCase(),
                        key: const ValueKey<int>(1), 
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)
                      ) : const SizedBox()
                    ),
                
                    TabMenu(onSelect: onSelect, current: current, menus: const ['Profile', 'Business', 'Settings']),
          
                    Container(
                      width: maxWidth,
                      height: 10,
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: colorScheme.surfaceContainerLowest,
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                          offset: const Offset(0, 2),
                        )],
                      )
                    )
                  ]),
                ),
              ),
            ]
          ),
        );
      },
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();
}