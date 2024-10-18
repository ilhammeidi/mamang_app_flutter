import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/image_viewer.dart';

class DetailOwner extends StatelessWidget {
  const DetailOwner({super.key, required this.avatar, required this.name});

  final String avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    const String qrImg = 'assets/images/qrcode.jpg';

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      /// AVATAR
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
          ),
          Hero(
            tag: avatar,
            child: GestureDetector(
              onTap: () {
                Get.to(() => ImageViewer(img: avatar));
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(avatar)
              ),
            ),
          )
        ],
      ),

      /// PROFILE INFORMATION
      Container(
        color: colorScheme.surface,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(3)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          /// NAME
          Text(name, style: ThemeText.title.copyWith(color: colorScheme.onPrimaryContainer)),
          const SizedBox(height: 4),
          Text('Business Owner', style: TextStyle(color: colorScheme.onSurfaceVariant)),
          const VSpaceShort(),

          /// WA BUTTON
          SizedBox(
            width: 160,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.lightGreen,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: ThemeRadius.big,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.lightGreen),
                  const SizedBox(width: 4),
                  Text('Whatsapp', style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.onSurface))
                ]),
              )
            ),
          ),
          const VSpace(),

          /// QR CODE
          Text('QR Code Promo', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(
            width: 250,
            height: 250,
            child: Hero(
              tag:qrImg ,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ImageViewer(img: qrImg, isLocal: true,));
                },
                child: Image.asset(qrImg, fit: BoxFit.contain)
              )
            )
          ),
          const VSpaceBig(),
        ]),
      ),
    ]);
  }
}