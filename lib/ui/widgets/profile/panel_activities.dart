import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/activity.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/activity_card.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';

class PanelActivities extends StatelessWidget {
  const PanelActivities({super.key});
  
  @override
  Widget build(BuildContext context) {
    const double itemHeight = 52;

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        TitleAction(
          title: 'Latest Activities',
          textAction: 'View All',
          onTap: () {
            Get.toNamed('/activities');
          }
        ),
        const VSpaceShort(),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: 24,
              child: Container(
                width: 3,
                height: itemHeight * 5,
                decoration: BoxDecoration(
                  color: colorScheme.outline,
                  borderRadius: BorderRadius.circular(5)
                )
              ),
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              itemBuilder: ((context, index) {
                Activity item = activityList[index];
                return ActivityCard(
                  title: item.title,
                  time: item.date,
                  icon: item.icon,
                  color: item.color
                );
              })
            )
          ],
        )
      ],
    );
  }
}