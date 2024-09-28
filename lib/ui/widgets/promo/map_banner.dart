import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class MapBanner extends StatelessWidget {
  const MapBanner({ super.key });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    var padding = MediaQuery.paddingOf(context);

    double screenHeight = height - padding.top - padding.bottom;

    return Column(children: [
      /// MAP BANNER
      Container(
        height: screenHeight / 6,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/map_landscape.png'),
            fit: BoxFit.cover
          )
        ),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(spacingUnit(1)),
        color: ThemePalette.secondaryLight,
        child: Text('Touch the map to open Google Map', textAlign: TextAlign.center, style: TextStyle(color: ThemePalette.secondaryDark)),
      ),
    ]);
  }
}