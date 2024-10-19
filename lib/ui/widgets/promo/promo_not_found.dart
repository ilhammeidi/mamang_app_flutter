import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/utils/no_data.dart';

class PromoNotFound extends StatelessWidget {
  const PromoNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return NoData(
      image: 'assets/images/promo.png',
      bgColor: ThemePalette.secondaryMain,
      title: 'Sorry we couldn\'t the promo',
      desc: 'Please go to another promo or back to the homepage',
      primaryTxtBtn: 'Check out another promos',
      secondaryTxtBtn: 'Go to homepage',
      primaryAction: () {
        Get.toNamed('/promos');
      },
      secondaryAction: () {
        Get.toNamed('/');
      },
    );
  }
}