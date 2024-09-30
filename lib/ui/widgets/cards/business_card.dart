import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

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
    required this.level
  });

  final int id;
  final String name;
  final String thumb;
  final String category;
  final bool verified;
  final int stared;
  final String type;
  final double level;
  
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    Color colorType(type) {
      switch(type) {
        case 'purple':
          return Colors.purple;
        case 'blue':
          return Colors.lightBlue;
        case 'green':
          return Colors.teal;
        default:
          return colorScheme.surface;
      }
    }

    return Container(
      padding: EdgeInsets.all(spacingUnit(1)),
      decoration: BoxDecoration(
        boxShadow: [ThemeShade.shadeSoft(context)],
        color: colorType(type).withOpacity(0.5),
        borderRadius: ThemeRadius.medium
      ),
      child: Column(children: [
        Stack(children: [
          /// IMAGE THUMBNAIL
          ClipRRect(
            borderRadius: ThemeRadius.medium,
            child: Image.network(thumb, width: double.infinity, height: 200, fit: BoxFit.cover),
          ),
          Positioned(
            top: spacingUnit(1),
            right: spacingUnit(1),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: ThemeRadius.medium
              ),
              child: Row(children: [
                Icon(Icons.star, color: Colors.yellow.shade700),
                const SizedBox(width: 2),
                Text(stared.toString())
              ]),
            )
          )
        ]),
        /// PROPERTIES
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
          child: Row(children: [
            Expanded(
              child: Text(id.toString(), style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold))
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: ThemePalette.primaryMain),
                borderRadius: ThemeRadius.medium
              ),
              child: verified ? Row(children: [
                Icon(Icons.check, color: ThemePalette.primaryMain),
                const SizedBox(width: 2),
                Text('Verified', style: TextStyle(color: ThemePalette.primaryMain))
              ]) : Container(),
            )
          ]),
        ),
        Row(children: [
          _iconCategory(context, category),
          const SizedBox(width: 4),
          Expanded(child: Text(name, style: ThemeText.subtitle))
        ]),
        /// PROGRESS LEVEL
        Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            LinearProgressIndicator(
              value: level/100,
              color: colorType(type),
              backgroundColor: colorScheme.outline.withOpacity(0.5),
              semanticsLabel: 'Level progress indicator',
            ),
            const SizedBox(height: 2),
            Text('Exp $level', style: ThemeText.caption.copyWith(color: colorScheme.outline),)
          ]),
        )
      ]),
    );
  }

  Widget _iconCategory(BuildContext context, String category) {
    Category getCategory = categoryList.firstWhere((item) => item.name == category);

    return CircleAvatar(
      radius: 15,
      backgroundColor: lighten(getCategory.color, 0.5),
      child: Icon(getCategory.icon, size: 20, color: getCategory.color),
    );
  }
}