import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/image_viewer.dart';

class CoverBanner extends StatelessWidget {
  const CoverBanner({
    super.key,
    required this.name,
    required this.username,
    required this.image,
    required this.avatar,
    required this.bio,
    this.followings,
    this.followers,
    this.groups,
  });

  final String name;
  final String image;
  final String avatar;
  final String username;
  final String bio;
  final double? followings;
  final double? followers;
  final double? groups;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ButtonStyle iconBtn = IconButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 3
    );

    return SliverAppBar(
      expandedHeight: 400,
      centerTitle: false,
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: spacingUnit(1),
            left: spacingUnit(1),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              style: iconBtn,
              icon: const Icon(Icons.arrow_back_ios_new, size: 22),
            )
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top:  spacingUnit(2),
                left:  spacingUnit(2),
                right:  spacingUnit(2),
              ),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
                boxShadow: [BoxShadow(
                  color: colorScheme.surfaceContainerLowest,
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0, 2),
                )],
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(name, style: ThemeText.title.copyWith(fontWeight: FontWeight.bold)),
                Text(username, style: ThemeText.subtitle2,),
                SizedBox(height: spacingUnit(2)),
                Text(bio),
                SizedBox(height: spacingUnit(2)),
                const Row(children: [
                  Icon(Icons.location_on, size: 12,),
                  SizedBox(width: 4),
                  Text('Bandung'),
                  SizedBox(width: 16),
                  Icon(Icons.date_range, size: 14),
                  SizedBox(width: 4),
                  Text('Dec 2024'),
                ]),
                SizedBox(height: spacingUnit(2)),
                (followers != null && followings != null && groups != null) ? Padding(
                  padding: EdgeInsets.only(bottom: spacingUnit(2)),
                  child: Row(children: [
                    Text(followings.toString()),
                    const SizedBox(width: 4),
                    Text('Followings', style: TextStyle(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(width: 16),
                    Text(followers.toString()),
                    const SizedBox(width: 4),
                    Text('Followers', style: TextStyle(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(width: 16),
                    Text(groups.toString()),
                    const SizedBox(width: 4),
                    Text('Groups', style: TextStyle(color: colorScheme.onSurfaceVariant)),
                  ]),
                ) : Container()
              ]),
            ),
          ),
          Positioned(
            bottom: 160,
            right: spacingUnit(2),
            child: Hero(
              tag: avatar,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ImageViewer(img: avatar));
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(avatar),
                ),
              ),
            )
          ),
        ]
      ),
    );
  }
}