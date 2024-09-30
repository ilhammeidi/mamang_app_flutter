import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.bigText,
    required this.title,
    required this.color,
    required this.infoGraphic
  });

  final String bigText;
  final String title;
  final Color color;
  final Widget infoGraphic;

  @override
  Widget build(BuildContext context) {
    TextStyle whiteText = const TextStyle(color: Colors.white);

    return Container(
      decoration: BoxDecoration(
        color: color,
        boxShadow: [ThemeShade.shadeMedium(context)],
        borderRadius: ThemeRadius.small,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.end, children: [
        infoGraphic,
        SizedBox(width: spacingUnit(1)),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(bigText, style: whiteText.copyWith(fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title, style: ThemeText.subtitle.merge(whiteText)),
          ])
        )
      ]),
    );
  }
}