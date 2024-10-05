import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/promo_card.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class PromoListDouble extends StatelessWidget {
  const PromoListDouble({super.key});
  @override
  Widget build(BuildContext context) {
    const int grid = 2;
    const double cardHeight = 250;

    final List<Promotion> latestPromo = [
      promoList[1],
      promoList[2],
      promoList[3],
      promoList[4],
      promoList[11],
      promoList[12],
      promoList[13],
      promoList[14],
      promoList[18],
      promoList[21],
      promoList[22],
      promoList[23],
      promoList[67],
      promoList[70],
    ];
  
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'Latest Promo',
          textAction: 'See All',
          onTap: () {
            Get.toNamed('/promos', arguments: 'food');
          }
        ),
      ),
      const VSpaceShort(),
      SizedBox(
        height: cardHeight * 2,
        child: ListView.builder(
          itemCount: latestPromo.length ~/ grid,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            Promotion itemOdd = latestPromo[index * grid];
            Promotion itemEven = latestPromo[index * grid + 1];
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 8 : 0),
              child: Column(children: [
                SizedBox(width: 200, height: cardHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/promos/${itemOdd.id}');
                      },
                      child: PromoCard(
                        thumb: itemOdd.thumb,
                        id: itemOdd.id.toString(),
                        title: itemOdd.name,
                        distance: itemOdd.distance,
                        xp: itemOdd.xp,
                      ),
                    ),
                  )
                ),
                SizedBox(width: 200, height: cardHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/promos/${itemEven.id}');
                      },
                      child: PromoCard(
                        thumb: itemEven.thumb,
                        id: itemEven.id.toString(),
                        title: itemEven.name,
                        distance: itemEven.distance,
                        xp: itemEven.xp,
                      ),
                    ),
                  )
                )
              ]),
            );
          }),
        ),
      )
    ]);
  }
}