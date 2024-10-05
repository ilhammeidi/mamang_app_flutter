import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.thumb, required this.title, required this.date});

  final String thumb;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return PaperCard(
      content: Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: ThemeRadius.small,
            child: Image.network(
              thumb,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover
            )
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
            child: Text(
              date,
              style: ThemeText.caption.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)
            ),
          ),
          SizedBox(
            height: 60,
            child: Text(
              title.toCapitalCase(),
              style: ThemeText.subtitle2,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ),
        ]),
      )
    );
  }
}