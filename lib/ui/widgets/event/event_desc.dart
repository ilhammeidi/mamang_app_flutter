import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class EventDesc extends StatelessWidget {
  const EventDesc({
    super.key,
    required this.title,
    required this.desc,
    required this.thumb,
    required this.clue1,
    required this.clue2,
    required this.clue3,
    required this.date,
    required this.point,
    required this.liked
  });

  final String title;
  final String desc;
  final String thumb;
  final String clue1;
  final String clue2;
  final String clue3;
  final String date;
  final int point;
  final bool liked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            /// EVENT TITLE
            Expanded(child: Text(title, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold))),
            SizedBox(width: spacingUnit(1)),
            /// TIME REMAINING
            Container(
              width: 120,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: ThemeRadius.medium
              ),
              child: Row(children: [
                const Icon(Icons.access_time_outlined, size: 12),
                const SizedBox(width: 2),
                Text(date, style: ThemeText.caption),
              ],)
            ),
          ]),
        ),
        /// THUMBNAIL HERO
        Hero(
          tag: thumb,
          child: Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.medium,
              image: DecorationImage(
                image: NetworkImage(thumb),
                fit: BoxFit.cover
              )
            ),
          )
        ),
        /// DESCRIPTION AND CLUES
        Container(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(desc, style: ThemeText.subtitle2),
            SizedBox(height: spacingUnit(1)),
            Text('Clue', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: spacingUnit(1)),
            Text('- Location: $clue1', style: ThemeText.paragraph),
            SizedBox(height: spacingUnit(1)),
            Text('- Category: $clue2', style: ThemeText.paragraph),
            SizedBox(height: spacingUnit(1)),
            Text('- Other Info: $clue3', style: ThemeText.paragraph),
          ]),
        )
      ]),
    );
  }
}