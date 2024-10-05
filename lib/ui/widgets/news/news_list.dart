import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/news.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/news_card.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});
  @override
  Widget build(BuildContext context) {
    const double cardHeight = 250;
  
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'You have to know',
          textAction: 'See All',
          onTap: () {
            Get.toNamed('/explore');
          }
        ),
      ),
      const VSpaceShort(),
      SizedBox(
        height: cardHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newsList.length,
          itemBuilder: ((context, index) {
            News item = newsList[index];
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 4 : 0),
              child: Column(children: [
                SizedBox(width: 200, height: cardHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: NewsCard(
                      thumb: item.thumb,
                      title: item.title,
                      date: item.date,
                    ),
                  )
                ),
              ]),
            );
          }),
        ),
      )
    ]);
  }
}