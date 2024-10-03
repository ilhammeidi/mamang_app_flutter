import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/slider_info_list.dart';

class ColouredBoxDetail extends StatelessWidget {
  const ColouredBoxDetail({
    super.key, 
    required this.type,
    required this.title,
    required this.thumb,
    required this.desc,
    required this.verified,
    required this.published,
    this.owned = false,
    required this.level,
    required this.xp,
    required this.location,
    required this.distance,
    required this.userId
  });

  final String type;
  final String thumb;
  final String title;
  final String desc;
  final bool verified;
  final bool published;
  final bool owned;
  final int level;
  final double xp;
  final String location;
  final double distance;
  final int userId;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[colorType(type), colorScheme.surface.withOpacity(0.35)],
          stops: const [0.25, 1],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Container(
        color: colorScheme.surface.withOpacity(0.7),
        child: Stack(children: [
          /// CURVE BOTTOM DECORATION
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: RoundedClipPathTop(),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).colorScheme.surface,
              ),
            )
          ),
          Column(children: [
              /// TITLE AND SHOR DESCRIPTION
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text(title.toCapitalCase(), textAlign: TextAlign.center, style: ThemeText.title2),
                  SizedBox(height: spacingUnit(1)),
                  Text(desc, textAlign: TextAlign.center),
                ]),
              ),

              /// STATUS INFO
              Padding(
                padding: EdgeInsets.all(spacingUnit(2)),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(children: [
                    const Text('Expired in:', style: ThemeText.caption),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: colorScheme.onSurface,
                        borderRadius: ThemeRadius.medium,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(Icons.access_time_outlined, color: colorScheme.surface, size: 16),
                        SizedBox(width: spacingUnit(1)),
                        Text('09:14:02', style: ThemeText.caption.copyWith(color: colorScheme.surface))
                      ])
                    )
                  ]),
                  Column(children: [
                    Text('Status: ${published ? 'Active' : 'Non-Active'}', style: ThemeText.caption),
                    SizedBox(
                      width: 50,
                      height: 30,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          value: published,
                          activeColor: ThemePalette.primaryMain,
                          onChanged: (_) {},
                        )
                      ),
                    )
                  ])
                ]),
              ),
            
            /// STATS INFO
            owned ? Padding(
              padding: EdgeInsets.all(spacingUnit(3)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Text('Level', style: ThemeText.caption),
                  const SizedBox(height: 4),
                  Text('4', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold, color: ThemePalette.primaryMain))
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Text('Exp.Poin', style: ThemeText.caption),
                  const SizedBox(height: 4),
                  Text(xp.toString(), style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold, color: ThemePalette.secondaryMain))
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Text('Save Total', style: ThemeText.caption),
                  const SizedBox(height: 4),
                  Text('4', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold))
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Text('Validate Tofal', style: ThemeText.caption),
                  const SizedBox(height: 4),
                  Text('10', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold))
                ])
              ]),
            ) : Container(),
            SliderInfoList(
              thumb: thumb,
              name: title,
              desc: desc,
              distance: distance,
              location: location,
              userId: userId
            )
          ]),
        ],),
      )
    );
  }
}