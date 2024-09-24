import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/promo_landscape_card.dart';

class PromoList extends StatelessWidget {
  const PromoList({super.key, required this.items});

  final List<Promotion> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: spacingUnit(1), right: spacingUnit(1), bottom: 100),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        Promotion promo = items[index];
        return Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(2)),
          child: PromoLandscapeCard(
            thumb: promo.thumb,
            title: promo.name,
            date: promo.date,
            desc: promo.desc,
            id: promo.id.toString(),
            distance: promo.distance,
          ),
        );
      }
    );
  }
}