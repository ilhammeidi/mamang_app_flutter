import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({
    super.key,
    required this.id,
    required this.name,
    required this.thumb,
    required this.category,
    required this.verified,
    required this.stared,
    required this.type,
    required this.level,
    this.mini = false
  });

  final int id;
  final String name;
  final String thumb;
  final String category;
  final bool verified;
  final int stared;
  final String type;
  final int level;
  final bool mini;
  
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var getCategory = categoryList.firstWhere((item) => item.id == category);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: ThemeRadius.medium
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: spacingUnit(1),
          left: spacingUnit(1),
          right: spacingUnit(1),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: colorType(type),
            width: 1,
          ),
          borderRadius: ThemeRadius.medium
        ),
        child: Column(children: [
          Expanded(
            child: Stack(children: [
              /// IMAGE THUMBNAIL
              ClipRRect(
                borderRadius: ThemeRadius.medium,
                child: Image.network(
                  thumb,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: ShimmerPreloader()
                    );
                  },
                ),
              ),
            
              /// STAR
              Positioned(
                top: spacingUnit(1),
                right: spacingUnit(1),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: ThemeRadius.medium
                  ),
                  child: Row(children: [
                    Icon(Icons.star, color: Colors.yellow.shade700, size: 11,),
                    const SizedBox(width: 2),
                    Text(stared.toString(), style: ThemeText.caption,)
                  ]),
                )
              ),
            ]),
          ),

          /// PROPERTIES
          mini ? Container() : Padding(
            padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
            child: Row(children: [
              Expanded(
                child: Text('#123456${id.toString()}', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold))
              ),
              verified ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: ThemePalette.primaryMain),
                  borderRadius: ThemeRadius.medium
                ),
                child: Row(children: [
                  Icon(Icons.check, color: ThemePalette.primaryMain, size: 14,),
                  const SizedBox(width: 2),
                  Text('VERIFIED', style: TextStyle(fontSize: 10, color: ThemePalette.primaryMain)),
                ]),
              ) : Container()
            ]),
          ),

          /// TITLE AND CATEGORY
          Padding(
            padding: EdgeInsets.symmetric(vertical: mini ? spacingUnit(1) : 0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              CircleAvatar(
                radius: mini ? 10 : 15,
                backgroundColor: lighten(colorType(type), 0.4),
                child: Icon(getCategory.icon, size: 20, color: colorType(type)),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  name.toCapitalCase(),
                  style: mini ? ThemeText.caption : ThemeText.paragraph.copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: mini ? 1 : 2,
                )
              )
            ]),
          ),

          /// PROGRESS LEVEL
          mini ? Container() : Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              ClipRRect(
                borderRadius: ThemeRadius.medium,
                child: LinearProgressIndicator(
                  value: level/100,
                  color: colorType(type),
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  semanticsLabel: 'Level progress indicator',
                ),
              ),
              const SizedBox(height: 2),
              Text('Exp $level', style: ThemeText.caption.copyWith(color: colorScheme.outlineVariant))
            ]),
          )
        ]),
      ),
    );
  }
}