import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/image_viewer.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

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
            Expanded(child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold))
            ),
            SizedBox(width: spacingUnit(1)),

            /// TIME REMAINING
            Container(
              width: 120,
              padding: EdgeInsets.all(spacingUnit(1)),
              margin: EdgeInsets.only(bottom: spacingUnit(1)),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: ThemeRadius.medium
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.access_time_outlined, size: 15, color: Colors.white),
                const SizedBox(width: 2),
                Text(date, style: ThemeText.caption.copyWith(color: Colors.white)),
              ],)
            ),
          ]),
        ),

        /// THUMBNAIL HERO
        Hero(
          tag: thumb,
          child: GestureDetector(
            onTap: () {
              Get.to(() => ImageViewer(img: thumb));
            },
            child: ClipRRect(
              borderRadius: ThemeRadius.medium,
              child: Image.network(
                thumb,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: ShimmerPreloader()
                  );
                },
              ),
            ),
          )
        ),

        /// DESCRIPTION AND CLUES
        Container(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(desc, style: ThemeText.paragraph),
            SizedBox(height: spacingUnit(1)),
            Text('Challenge Clue:', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: spacingUnit(1)),
            Text(clue1, style: ThemeText.paragraph),
            SizedBox(height: spacingUnit(1)),
            Text(clue2, style: ThemeText.paragraph),
            SizedBox(height: spacingUnit(1)),
            Text(clue3, style: ThemeText.paragraph),
          ]),
        )
      ]),
    );
  }
}