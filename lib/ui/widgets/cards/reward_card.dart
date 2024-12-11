import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
    required this.btnText,
    required this.progress,
    this.max = 100,
    this.onTap,
    this.label = ''
  });

  final Color color;
  final String title;
  final Icon icon;
  final String btnText;
  final double progress;
  final double max;
  final Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacingUnit(2)),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        boxShadow: [ThemeShade.shadeMedium(context)],
        color: color
      ),
      child: Column(
        children: [
          /// PROPERTIES
          Row(
            children: [
              /// TEXT
              Expanded(
                child: Column(children: [
                  Row(children: [
                    icon,
                    SizedBox(width: spacingUnit(1)),
                    Text(title, style: ThemeText.paragraph.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
                  ]),
                  SizedBox(height: spacingUnit(1)),
                  Row(children: [
                    Text('$progress$label', style: ThemeText.title.copyWith(color: Colors.white)),
                    Text(' / $max$label', style: ThemeText.subtitle2.copyWith(color: Colors.white)),
                  ])
                ]),
              ),
              /// BUTTON
              FilledButton(
                onPressed: onTap,
                style: ThemeButton.white,
                child: Text(btnText, style: ThemeText.subtitle2.copyWith(color: color, fontWeight: FontWeight.bold)),
              )
            ],
          ),
          SizedBox(height: spacingUnit(1),),
          ClipRRect(
            borderRadius: ThemeRadius.small,
            child: LinearProgressIndicator(
              value: progress / max,
              backgroundColor: Colors.white.withOpacity(0.5),
              color: Colors.white,
              semanticsLabel: 'Progress indicator',
            ),
          ),
        ],
      ),
    );
  }
}