import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';

class DescriptionDetail extends StatelessWidget {
  const DescriptionDetail({
    super.key,
    required this.id,
    required this.desc,
    required this.type,
    required this.category,
    required this.rating
  });

  final int id;
  final String desc;
  final String type;
  final String category;
  final int rating;

  @override
  Widget build(BuildContext context) {
    const double iconSize = 56;
    Category categoryItem = categoryList.firstWhere((item) => item.id == category);
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: ListView(children: [
        /// DESCRIPTION
        Text('Description', textAlign: TextAlign.start, style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(desc, textAlign: TextAlign.start,),
        const VSpace(),

        /// GRID PROPERTIES INFO
        GridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          primary: false,
          padding: EdgeInsets.all(spacingUnit(2)),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            const Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.star_outline, size: iconSize, color: Colors.orangeAccent),
              SizedBox(height: 4),
              Text('RATING 4.5/5', style: ThemeText.subtitle)
            ]),
            const Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.favorite_border, size: iconSize, color: Colors.redAccent),
              SizedBox(height: 4),
              Text('LIKED: 22', style: ThemeText.subtitle)
            ]),
            const Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.bookmark_outline, size: iconSize, color: Colors.green),
              SizedBox(height: 4),
              Text('SAVED: 7', style: ThemeText.subtitle)
            ]),
            const Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.remove_red_eye, size: iconSize, color: Colors.grey),
              SizedBox(height: 4),
              Text('VIEWS: 700', style: ThemeText.subtitle)
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.all_inbox_outlined, size: iconSize, color: colorType(type)),
              const SizedBox(height: 4),
              Text('TYPE: $type', style: ThemeText.subtitle)
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(categoryItem.icon, size: iconSize, color: categoryItem.color),
              const SizedBox(height: 4),
              Text('CATEGORY: $category', style: ThemeText.subtitle)
            ]),
          ]
        ),
        const VSpace(),
      
        /// VERIFIED PROPERTIES
        Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.small,
            border: Border.all(
              width: 1,
              color: colorScheme.outline
            )
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Business Owner'),
                subtitle: const Text('Verified business owner by the trusted validator', style: ThemeText.caption),
                trailing: Icon(Icons.verified, color: ThemePalette.primaryMain),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location'),
                subtitle: const Text('Verified business location by the trusted validator', style: ThemeText.caption),
                trailing: Icon(Icons.verified, color: ThemePalette.primaryMain),
              ),
              ListTile(
                leading: const Icon(Icons.list_alt),
                title: const Text('Content'),
                subtitle: const Text('Verified this promo content by the trusted validator', style: ThemeText.caption),
                trailing: Icon(Icons.verified, color: ThemePalette.primaryMain),
              ),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Availability'),
                subtitle: const Text('Verified merchant availability by the trusted validator', style: ThemeText.caption),
                trailing: Icon(Icons.verified, color: ThemePalette.primaryMain),
              )
            ],
          )
        )
      ])
    );
  }
}