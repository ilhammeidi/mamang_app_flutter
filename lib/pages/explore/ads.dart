import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class AdsFood extends StatelessWidget {
  const AdsFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.small,
        image: DecorationImage(
          image: NetworkImage(ImgApi.photo[7]),
          fit: BoxFit.cover
        )
      ),
    );
  }
}

class AdsHoliday extends StatelessWidget {
  const AdsHoliday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.small,
        image: DecorationImage(
          image: NetworkImage(ImgApi.photo[88]),
          fit: BoxFit.cover
        )
      ),
    );
  }
}