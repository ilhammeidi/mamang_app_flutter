import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/promo_landscape_card.dart';

class PromoSaved extends StatelessWidget {
  const PromoSaved({super.key});

  static final List<Promotion> promoSavedList = [
    promoList[1],
    promoList[2],
    promoList[3],
    promoList[4],
    promoList[5],
    promoList[6],
    promoList[7],
    promoList[8],
    promoList[9],
    promoList[10],
    promoList[11],
    promoList[12],
    promoList[13],
    promoList[14],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      itemCount: promoSavedList.length,
      itemBuilder: (BuildContext context, int index) {
        Promotion item = promoSavedList[index];
        return Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(2)),
          child: PromoLandscapeCard(
            thumb: item.thumb,
            title: item.name,
            date: item.date,
            desc: item.desc,
            id: item.id.toString(),
            distance: item.distance,
          ),
        );
      }
    );
  }
}