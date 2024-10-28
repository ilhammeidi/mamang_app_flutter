import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/activity.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';

class PanelActivities extends StatelessWidget {
  const PanelActivities({super.key});
  
  @override
  Widget build(BuildContext context) {
    const double itemHeight = 50;

    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        TitleAction(title: 'Latest Activities', textAction: 'View All', onTap: () {}),
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
                return _itemActivity(context, item.title, item.date, item.icon, item.color);
              })
            )
          ],
        )
      ],
    );
  }

  Widget _itemActivity(BuildContext context, String title, String time, IconData icon, Color color) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: spacingUnit(2)
      ),
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            width: 4,
            color: colorScheme.surface
          )
        ),
      ),
      title: Text(time, style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(title, style: ThemeText.subtitle2.copyWith(color: colorScheme.onSurface)),
        ],
      ),
    );
  }
}