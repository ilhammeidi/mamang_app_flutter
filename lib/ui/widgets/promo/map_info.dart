import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class MapInfo extends StatelessWidget {
  const MapInfo({
    super.key,
    required this.title,
    required this.category,
    required this.location,
    required this.thumb
  });

  final String title;
  final String category;
  final String location;
  final String thumb;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    var padding = MediaQuery.paddingOf(context);

    double screenHeight = height - padding.top - padding.bottom;

    return Column(children: [
      /// MAP BANNER
      Container(
        height: screenHeight / 4,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/map_landscape.png'),
            fit: BoxFit.cover
          )
        ),
      ),
      Container(
        padding: EdgeInsets.all(spacingUnit(2)),
        color: ThemePalette.secondaryLight,
        child: Text('Touch the map to open Google Map', style: TextStyle(color: ThemePalette.secondaryDark)),
      ),
      /// INFORMATION
      Container(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: Row(children: [
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
                Text(category, style: ThemeText.caption),
                const SizedBox(height: 4),
                FilledButton(
                  onPressed: () {},
                  style: ThemeButton.btnSmall.merge(ThemeButton.tonalPrimary(context)),
                  child: const Text('See Promo Detail'),
                )
              ],
            )
          )
        ]),
      ),
      /// ADDRESS
      Padding(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
          const SizedBox(width: 4),
          Text(location)
        ]),
      )
    ]);
  }
}