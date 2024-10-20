import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/image_viewer.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';

class ProfileBannerHeader extends SliverPersistentHeaderDelegate {
  const ProfileBannerHeader({
    required this.maxExtent,
    required this.minExtent
  });

  @override
  final double maxExtent;
  
  @override
  final double minExtent;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    const TextStyle smallText = TextStyle(
      fontSize: 12,
    );
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final showItem = shrinkOffset < 50;

    return Stack(
      fit: StackFit.expand,
      children: [
        /// BACKGROUND
        Image.asset(
          'assets/images/profile_banner.jpg',
          fit: BoxFit.cover
        ),

        /// CURVE DECORATION
        Positioned(
          bottom: 0,
          left: 0,
          child: ClipPath(
            clipper: RoundedClipPathTop(),
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                boxShadow: [BoxShadow(
                  color: colorScheme.surfaceContainerLowest,
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 2),
                )],
              ),
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
            width: MediaQuery.of(context).size.width,
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
          
              /// COINS AND POINTS
              const VSpaceShort(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                padding: EdgeInsets.all(spacingUnit(1)),
                decoration: BoxDecoration(
                  borderRadius: ThemeRadius.small,
                  color: colorScheme.surface,
                  boxShadow: [ThemeShade.shadeSoft(context)],
                ),
                child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  /// USER COINS
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: colorScheme.surface,
                      child: Icon(Icons.stars, size: 40, color: ThemePalette.primaryMain)
                    ),
                  ),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Your Point', style: smallText),
                      const SizedBox(width: 2),
                      Text('200', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
                    ]),
                  ),
                  
                  SizedBox(
                    height: 40,
                    child: VerticalDivider(color: colorScheme.outline, width: 20, thickness: 2)
                  ),
              
                  /// USER POINT
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: colorScheme.surface,
                      child: const Icon(Icons.motion_photos_on, size: 40, color: Colors.amber)
                    ),
                  ),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Coins', style: smallText),
                      const SizedBox(width: 2),
                      Text('10000', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ]),
              ),
              Container(
                width: double.infinity,
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
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => OverScrollHeaderStretchConfiguration();
}