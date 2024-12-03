import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class PointCard extends StatelessWidget {
  const PointCard({super.key, required this.icon, required this.label, required this.point});

  final Widget icon;
  final String label;
  final double point;

  @override
  Widget build(BuildContext context) {
    return PaperCard(content: Padding(
      padding: const EdgeInsets.all(4),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        icon,
        SizedBox(height: spacingUnit(1)),
        Text(label, style: ThemeText.caption),
        Text(point.toString(), style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold),)
      ]),
    ));
  }
}