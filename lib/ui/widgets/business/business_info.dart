import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';

class BusinessInfo extends StatelessWidget {
  const BusinessInfo({
    super.key,
    required this.icon,
    required this.color,
    required this.name,
    required this.desc
  });

  final Widget icon;
  final String color;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      /// ICON
      icon,
      Text('Total: 1/99999', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: colorType(color))),
      const VSpaceShort(),

      /// TITLE
      Text(name, style: ThemeText.title),
      const VSpaceShort(),

      /// SLIDER GUIDE
      SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: ImgApi.guideList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Padding(padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
              child: SizedBox(
                width: 250,
                child: ClipRRect(
                  borderRadius: ThemeRadius.small,
                  child: index == 0 ?
                  Stack(alignment: Alignment.center, children: [
                     Image.network(
                      ImgApi.guideList[index],
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.5),
                      colorBlendMode: BlendMode.multiply,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow, size: 40, color: ThemePalette.primaryMain)
                    )
                  ])
                  : Image.network(ImgApi.guideList[index], fit: BoxFit.cover),
                ),
              ),
            );
          }),
        ),
      ),
      const VSpaceShort(),

      /// DESCRIPTION
      Text(desc, textAlign: TextAlign.start),

      /// ACTION BUTTONS
      Row(children: [
        Expanded(
          flex: 1,
          child: OutlinedButton(
            onPressed: () {
              Get.back();
            },
            style: ThemeButton.btnBig,
            child: const Text('Choose Later'),
          ),
        ),
        SizedBox(width: spacingUnit(1)),
        Expanded(
          flex: 1,
          child: FilledButton(
            onPressed: () {
              Get.toNamed('/business-new/payment');
            },
            style: ThemeButton.btnBig.merge(ThemeButton.primary),
            child: const Text('Continue'),
          ),
        )
      ]),
      const VSpaceShort(),
      
    ]);
  }
}