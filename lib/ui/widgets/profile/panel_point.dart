import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class PanelPoint extends StatelessWidget {
  const PanelPoint({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    const TextStyle smallText = TextStyle(
      fontSize: 12,
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      padding: EdgeInsets.all(spacingUnit(1)),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.small,
        color: colorScheme.surface,
        boxShadow: [ThemeShade.shadeSoft(context)],
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        /// USER COINS
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: colorScheme.surface,
            child: Icon(Icons.stars, size: 40, color: ThemePalette.primaryMain)
          ),
        ),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Your Point', style: smallText),
            const SizedBox(width: 2),
            Text('200', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
          ]),
        ),
        
        SizedBox(
          height: 40,
          child: VerticalDivider(color: colorScheme.outline, width: 20, thickness: 2)
        ),
    
        /// USER POINT
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: colorScheme.surface,
            child: const Icon(Icons.motion_photos_on, size: 40, color: Colors.amber)
          ),
        ),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Coins', style: smallText),
            const SizedBox(width: 2),
            Text('10000', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
          ]),
        ),
      ]),
    );
  }
}