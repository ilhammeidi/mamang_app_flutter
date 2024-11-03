import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/image_viewer.dart';

class SummaryInfo extends StatelessWidget {
  const SummaryInfo({
    super.key,
    required this.id,
    required this.title,
    required this.location,
    required this.thumb
  });

  final int id;
  final String title;
  final String location;
  final String thumb;

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: Row(children: [
          /// Thumbnail
          Hero(
            tag: thumb,
            child: GestureDetector(
              onTap: () {
                Get.to(() => ImageViewer(img: thumb));
              },
              child: ClipRRect(
                borderRadius: ThemeRadius.small,
                child: Image.network(
                  thumb,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: spacingUnit(2)),

          /// PROPERTIES
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title.toCapitalCase(),
                  style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 4),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
                  const SizedBox(width: 4),
                  Text(location, overflow: TextOverflow.ellipsis,)
                ]),
                SizedBox(height: spacingUnit(2)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/promos/$id');
                  },
                  child: Row(
                    children: [
                      Text('PROMO DETAIL', style: ThemeText.caption.copyWith(color: ThemePalette.primaryMain)),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios_sharp, size: 14, color: ThemePalette.primaryMain)
                    ],
                  ),
                )
              ],
            )
          )
        ]),
      ),
    ]);
  }
}