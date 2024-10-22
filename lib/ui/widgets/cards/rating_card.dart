import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/review/rating_star.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    super.key,
    required this.name,
    required this.avatar,
    required this.date,
    required this.description,
    required this.rating,
    this.overflowDesc = true
  });

  final String name;
  final String avatar;
  final String date;
  final String description;
  final int rating;
  final bool overflowDesc;

  @override
  Widget build(BuildContext context) {

    return PaperCard(
      content: Padding(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          /// NAME
          Row(children: [
            CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(avatar),
            ),
            SizedBox(width: spacingUnit(1)),
            Text(name, style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
          ]),
          
          /// RATING
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RatingStar(initVal: rating, readOnly: true,),
              const SizedBox(width: 4),
              Text(date, style: ThemeText.caption)
            ]),
          ),

          /// DESCRIPTION
          Text(description, style: ThemeText.paragraph, maxLines: overflowDesc ? 2 : null, overflow: TextOverflow.ellipsis,)
        ]),
      )
    );
  }
}