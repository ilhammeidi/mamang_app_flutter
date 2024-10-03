import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';

class DetailRewards extends StatelessWidget {
  const DetailRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const GrabberIcon(),
      const VSpace(),
      Text('REWARDS', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
      const VSpaceShort(),

      /// REWARD ITEMS
      SizedBox(
        height: 400,
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.all(spacingUnit(2)),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.network('assets/images/gift.png', height: 80),
              const SizedBox(height: 4),
              Text('#123456$index', style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.bold))
            ]);
          })
        ),
      ),
      const VSpaceShort(),
      FilledButton(
        onPressed: () {},
        style: ThemeButton.btnBig.merge(ThemeButton.primary),
        child: const Text('Claim Rewards')
      ),
      const VSpace()
    ]);
  }
}