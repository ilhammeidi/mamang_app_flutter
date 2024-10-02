import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';

class DetailChained extends StatelessWidget {
  const DetailChained({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const GrabberIcon(),
      const VSpace(),
      const Text('Exchange Content', style: ThemeText.subtitle2),
      const VSpaceShort(),
      GridView.count(
        primary: false,
        padding: EdgeInsets.all(spacingUnit(2)),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.network('assets/images/gift.png', width: 100, height: 100),
            const SizedBox(height: 4),
            Text('#123456$index', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold))
          ]);
        })
      )
    ]);
  }
}