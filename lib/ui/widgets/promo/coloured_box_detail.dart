import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_deco_main.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/slider_info_list.dart';

class ColouredBoxDetail extends StatefulWidget {
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
    required this.userId,
    required this.category
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
  final String category;

  @override
  State<ColouredBoxDetail> createState() => _ColouredBoxDetailState();
}

class _ColouredBoxDetailState extends State<ColouredBoxDetail> {
  bool? isActive;
  
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Category categoryItem = categoryList.firstWhere((item) => item.id == widget.category);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[colorType(widget.type), colorScheme.surfaceContainerLowest.withOpacity(0.25)],
          stops: const [0.25, 1],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Container(
        color: colorScheme.surfaceContainerLowest.withOpacity(0.5),
        child: Stack(children: [
          /// CURVE BOTTOM DECORATION
          Positioned(
            bottom: 0,
            left: 0,
            child: RoundedDecoMain(
              height: 80,
              bgDecoration: BoxDecoration(
                color: colorScheme.surfaceContainerLowest,
              ),
            ),
          ),
          Column(children: [
            /// TITLE AND SHORT DESCRIPTION
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text(widget.title.toCapitalCase(), textAlign: TextAlign.center, style: ThemeText.title2),
                SizedBox(height: spacingUnit(1)),
                Text(widget.desc, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w100)),
              ]),
            ),
            const VSpaceShort(),
            
            /// STATUS INFO
            Padding(
              padding: EdgeInsets.all(spacingUnit(2)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(children: [
                  const Text('Expired in:', style: ThemeText.caption),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
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
                  Text(widget.type.toUpperCase(), style: ThemeText.caption),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    decoration: BoxDecoration(
                      color: colorType(widget.type),
                      borderRadius: ThemeRadius.medium,
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(categoryItem.icon, color: Colors.white, size: 16),
                      SizedBox(width: spacingUnit(1)),
                      Text(categoryItem.name, style: ThemeText.caption.copyWith(color: Colors.white))
                    ])
                  )
                ]),
                Column(children: [
                  widget.owned ? Text('Status: ${isActive != null && isActive == true ? 'Active' : 'Non-Active'}', style: ThemeText.caption)
                  : Text('Status: ${widget.published ? 'Active' : 'Non-Active'}', style: ThemeText.caption),
                  Switch(
                    value: isActive ?? widget.published,
                    activeColor: ThemePalette.primaryMain,
                    inactiveThumbColor: ThemePalette.primaryMain,
                    onChanged: widget.owned ? (bool value) {
                      setState(() {
                        isActive = value;
                      });
                    } : null,
                  )
                ])
              ]),
            ),
            
            /// STATS INFO
            widget.owned ? Padding(
              padding: EdgeInsets.all(spacingUnit(3)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Text('Level', style: ThemeText.caption),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: ThemeRadius.small,
                      color: ThemePalette.primaryMain
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 30
                      ),
                      child: Text(
                        '4',
                        textAlign: TextAlign.center,
                        style: ThemeText.title2.copyWith(fontWeight: FontWeight.w700, color: Colors.white)
                      ),
                    )
                  )
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Text('Exp.Poin', style: ThemeText.caption),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: ThemeRadius.small,
                      color: ThemePalette.secondaryMain
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 30
                      ),
                      child: Text(
                        widget.xp.toString(),
                        textAlign: TextAlign.center,
                        style: ThemeText.title2.copyWith(fontWeight: FontWeight.w700, color: Colors.white)
                      ),
                    )
                  )
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Text('Save Total', style: ThemeText.caption),
                  const SizedBox(height: 4),
                  Text('4', style: ThemeText.title2.copyWith(fontWeight: FontWeight.w700))
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Text('Validate Tofal', style: ThemeText.caption),
                  const SizedBox(height: 4),
                  Text('10', style: ThemeText.title2.copyWith(fontWeight: FontWeight.w700))
                ])
              ]),
            ) : Container(),

            /// SLIDER INFO LIST
            SliderInfoList(
              thumb: widget.thumb,
              name: widget.title,
              desc: widget.desc,
              distance: widget.distance,
              location: widget.location,
              userId: widget.userId
            )
          ]),
        ],),
      )
    );
  }
}