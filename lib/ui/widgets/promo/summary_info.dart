import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SummaryInfo extends StatelessWidget {
  const SummaryInfo({
    super.key,
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.thumb
  });

  final int id;
  final String title;
  final String category;
  final String location;
  final String thumb;

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: Row(children: [
          /// Thumbnail
          ClipRRect(
            borderRadius: ThemeRadius.small,
            child: Image.network(
              thumb,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
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
                Text('Category: ${category.toCapitalCase()}', style: ThemeText.caption),
                SizedBox(height: spacingUnit(2)),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
                  const SizedBox(width: 4),
                  Text(location, overflow: TextOverflow.ellipsis,)
                ]),
                SizedBox(height: spacingUnit(1)),
                FilledButton(
                  onPressed: () {
                    Get.toNamed('/promos/$id');
                  },
                  style: ThemeButton.btnSmall.merge(ThemeButton.tonalPrimary(context)),
                  child: const Wrap(
                    children: [
                      Text('See Promo Detail', style: ThemeText.caption,),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios_sharp, size: 16)
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