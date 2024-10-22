import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/rating.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/rating_card.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';

class ReviewListSlider extends StatelessWidget {
  const ReviewListSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'Reviews',
          textAction: 'See All Reviews',
          onTap: () {
            Get.toNamed('/ratings-reviews');
          }
        ),
      ),
      const VSpaceShort(),
      SizedBox(
        height: 140,
        child: ListView.builder(
          itemCount: ratingList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            Rating item = ratingList[index];
            return Container(
              width: 300,
              padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
                left: index > 0 ? 4 : spacingUnit(2),
                right: index < ratingList.length - 1 ? 4 : spacingUnit(2),
              ),
              child: RatingCard(
                avatar: item.avatar,
                name: item.name,
                date: item.date,
                description: item.description,
                rating: item.rating,
              ),
            );
          })
        ),
      )
    ]);
  }
}