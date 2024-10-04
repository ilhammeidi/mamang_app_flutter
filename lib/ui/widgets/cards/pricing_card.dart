import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({
    super.key,
    required this.mainIcon,
    required this.color,
    required this.title,
    required this.price,
    required this.desc,
    this.isRecomended = false
  });

  final Widget mainIcon;
  final Color color;
  final String title;
  final double price;
  final String desc;
  final bool isRecomended;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return PaperCard(
      content: Row(children: [
        /// ICON
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          mainIcon,
          const SizedBox(height: 4),
          Text('Total: 1/99999', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: color)),
        ]),
        SizedBox(width: spacingUnit(1)),

        /// DESCRIPTION
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(title, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
              isRecomended ?
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: ThemeRadius.medium,
                    color: colorScheme.secondaryContainer,
                  ),
                  child: Text('POPULAR', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onSecondaryContainer)),
                ) : Container()
            ],
          ),
          const SizedBox(height: 4),
          Text(desc),
        ]),
        SizedBox(width: spacingUnit(2)),

        /// PRICE
        Column(children: [
          Text(price > 0 ? '\$ $price' : 'FREE', style: ThemeText.title),
          const SizedBox(height: 4),
          const Text('Monthly', style: ThemeText.caption)
        ])
      ])
    );
  }
}