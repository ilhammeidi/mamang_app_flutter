import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class HeaderExplore extends StatelessWidget {
  const HeaderExplore({super.key});

  @override
  Widget build(BuildContext context) {

    final ButtonStyle iconBtn = IconButton.styleFrom(
      padding: const EdgeInsets.all(0),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 3
    );

    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.all(spacingUnit(1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// GIFT BUTTON
          Container(
            width: 150,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.amber.shade300,
              borderRadius: ThemeRadius.medium,
              boxShadow: [ThemeShade.shadeSoft(context)],
            ),
            child: Row(children: [
              Image.asset('assets/images/gift.png', height: 20),
              const SizedBox(width: 2,),
              const Text('Claim Your Gift Today', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 11),)
            ],),
          ),
          /// ACTIONS HEADER BUTTON
          Row(children: [
            SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                onPressed: () {},
                style: iconBtn,
                icon: Badge.count(
                  backgroundColor: ThemePalette.tertiaryMain,
                  count: 10,
                  child: Icon(Icons.notifications, size: 24, color: Theme.of(context).colorScheme.onSurface),
                )
              ),
            ),
            SizedBox(width: spacingUnit(2)),
            SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                onPressed: () {},
                style: iconBtn,
                icon: Icon(Icons.help, size: 24, color: Theme.of(context).colorScheme.onSurface)
              ),
            )
          ])
        ],
      ),
    );
  }
}