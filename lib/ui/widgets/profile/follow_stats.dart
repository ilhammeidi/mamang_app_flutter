import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class FollowStats extends StatelessWidget {
  const FollowStats({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () {
            Get.toNamed('/user-profile/1');
          },
          child: _itemFollow(context, 'Followers', Icons.group_rounded, 102)
        ),
        SizedBox(
          height: 30,
          child: VerticalDivider(color: colorScheme.outline, width: 20, thickness: 1)
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/user-profile/2');
          },
          child: _itemFollow(context, 'Following', Icons.group_outlined, 67)
        ),
        SizedBox(
          height: 30,
          child: VerticalDivider(color: colorScheme.outline, width: 20, thickness: 1)
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/user-profile/3');
          },
          child: _itemFollow(context, 'Groups', Icons.group_work_outlined, 5),
        ),
      ]),
    );
  }

  Widget _itemFollow(BuildContext context, String text, IconData icon, double count) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(count.toString(), style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold),),
      const SizedBox(height: 4),
      Row(
        children: [
          Opacity(opacity: 0.5, child: Icon(icon, size: 14,)),
          const SizedBox(width: 4),
          Text(text),
        ],
      )
    ]);
  }
}