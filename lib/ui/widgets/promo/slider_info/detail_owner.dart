import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';

class DetailOwner extends StatelessWidget {
  const DetailOwner({super.key, required this.avatar, required this.name});

  final String avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const GrabberIcon(),
      const VSpace(),
      
      /// AVATAR
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(avatar)
          )
        ],
      ),

      /// PROFILE INFORMATION
      Container(
        color: colorScheme.surface,
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(3)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(name, style: ThemeText.title.copyWith(color: colorScheme.onPrimaryContainer)),
          const SizedBox(height: 4),
          Text('Business Owner', style: TextStyle(color: colorScheme.outline)),
          const VSpace(),
        ]),
      ),
      const VSpace(),

      /// QR CODE
      const Text('QR Code Promo', style: ThemeText.subtitle2),
      const VSpaceShort(),
      SizedBox(
        width: 250,
        height: 250,
        child: Image.asset('assets/images/qrcode.webp', fit: BoxFit.contain)
      ),
    ]);
  }
}