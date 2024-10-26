import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/community.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class GroupListSlider extends StatelessWidget {
  const GroupListSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(spacingUnit(1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Popular Groups', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
              FilledButton(
                onPressed: () {
                  Get.toNamed('/groups');
                },
                style: ThemeButton.btnSmall.merge(ThemeButton.tonalSecondary(context)),
                child: const Text('See All Groups', style: ThemeText.caption)
              )
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: communityList.length,
            itemBuilder: (context, index) {
              Community item = communityList[index];
              return Padding(
                padding: EdgeInsets.only(
                  top: spacingUnit(1),
                  bottom: spacingUnit(1),
                  left: index == 0 ? spacingUnit(2) : spacingUnit(1),
                  right: index < communityList.length ? spacingUnit(1) : spacingUnit(2),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(item.avatar),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 60,
                    child: Text(item.name, style: ThemeText.caption, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1)
                  )
                ]),
              );
            },
          ),
        ),
      ],
    );
  }
}