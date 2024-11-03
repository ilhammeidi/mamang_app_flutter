import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/grabber_icon.dart';

class DetailRewards extends StatelessWidget {
  const DetailRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const GrabberIcon(),
      const VSpace(),
      Text('REWARDS', style: ThemeText.title2.copyWith(fontWeight: FontWeight.w700)),
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
              Image.asset('assets/images/gift.png', height: 80, width: 80, fit: BoxFit.contain,),
              const SizedBox(height: 4),
              Text('#123456$index', style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.w700))
            ]);
          })
        ),
      ),
      const VSpaceShort(),
      FilledButton(
        onPressed: () {},
        style: ThemeButton.btnBig.merge(ThemeButton.tonalPrimary(context)),
        child: const Text('Claim Rewards')
      ),
      const VSpaceBig()
    ]);
  }
}