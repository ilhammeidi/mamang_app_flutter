import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/promo_card.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class PromoListSingle extends StatelessWidget {
  const PromoListSingle({
    super.key,
    required this.items,
    required this.title,
    this.desc}
  );

  final List items;
  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 250;
  
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: title,
          textAction: 'See All',
          desc: desc,
          onTap: () {
            Get.toNamed('/promos', arguments: 'holiday');
          }
        ),
      ),
      const VSpaceShort(),
      SizedBox(
        height: cardHeight,
        child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            Promotion item = items[index];
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 8 : 0),
              child: SizedBox(width: 200, height: cardHeight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: PromoCard(
                    thumb: item.thumb,
                    id: item.id.toString(),
                    title: item.name,
                    distance: item.distance,
                    xp: item.xp,
                  ),
                )
              ),
            );
          }),
        ),
      )
    ]);
  }
}