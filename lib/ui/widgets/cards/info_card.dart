import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.illustration,
    required this.title,
    this.actionText,
    this.color
  });
  
  final Widget illustration;
  final String title;
  final String? actionText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: ThemeRadius.small
      ),
      child: Column(
        children: [
          PaperCard(
            content: Padding(
              padding: EdgeInsets.all(spacingUnit(1)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                illustration,
                SizedBox(height: spacingUnit(1)),
                Text(title, style: ThemeText.caption,)
              ]),
            )
          ),
          actionText != null ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(children: [
              Text(actionText!, style: ThemeText.caption.copyWith(color: Colors.white)),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 16)
            ]),
          ) : Container()
        ],
      ),
    );
  }
}