import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';

class DetailQr extends StatelessWidget {
  const DetailQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const GrabberIcon(),
        const VSpace(),
      
        /// TITLE
        const Text('Exchange Content', style: ThemeText.subtitle2),
        const VSpaceShort(),
      
        /// QR CODE
        SizedBox(
          width: 250,
          height: 250,
          child: Image.asset('assets/images/qrcode.webp', fit: BoxFit.contain)
        ),
      
        /// GUIDE
        const VSpaceShort(),
        const Text('1. Please make sure the promo will exchange is has a correct position.', textAlign: TextAlign.start,),
        const SizedBox(height: 2),
        const Text('2. Scan your friend QR Code who want to exchange by tap Scan QR button.', textAlign: TextAlign.start),
        const SizedBox(height: 2),
        const Text('3. Wait for your friend confirmation to accept this exchange.', textAlign: TextAlign.start),
        const VSpace(),
        FilledButton(
          onPressed: () {},
          style: ThemeButton.btnBig.merge(ThemeButton.primary),
          child: const Text('Scan QR')
        ),
        const VSpace(),
      
        /// WARNING
        Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          decoration: BoxDecoration(
            color: Colors.amber.shade200,
            borderRadius: ThemeRadius.small,
          ),
          child: const Text('Please do not force people to exchange the promotion content'),
        )
      ]),
    );
  }
}