import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

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
    const double iconSize = 48;
    Category categoryItem = categoryList.firstWhere((item) => item.id == category);
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          /// DESCRIPTION
          const TitleBasic(title: 'Promo Description'),
          const VSpaceShort(),
          Text(desc, textAlign: TextAlign.start,),
          SizedBox(height: spacingUnit(2)),
          Text('ID: #123456$id', textAlign: TextAlign.start),
          const SizedBox(height: 4),
          Text('Type: ${type.toUpperCase()}', textAlign: TextAlign.start),
          const SizedBox(height: 4),
          Text('Category: ${category.toUpperCase()}', textAlign: TextAlign.start),
          const LineSpace(),

          /// GRID PROPERTIES INFO
          GridView.count(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            primary: false,
            padding: EdgeInsets.all(spacingUnit(1)),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Icon(Icons.star_outline, size: iconSize, color: Colors.orangeAccent),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(text: '', style: ThemeText.paragraph, children: [
                    TextSpan(text: '4.5', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                    TextSpan(text: '/5'),
                  ])
                ),
              ]),
              const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(Icons.favorite_outline, size: iconSize, color: Colors.redAccent),
                SizedBox(height: 8),
                Text('LIKED: 22', style: ThemeText.paragraph)
              ]),
              const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(Icons.bookmark_outline, size: iconSize, color: Colors.green),
                SizedBox(height: 8),
                Text('SAVED: 7', style: ThemeText.paragraph)
              ]),
              const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(Icons.remove_red_eye, size: iconSize, color: Colors.grey),
                SizedBox(height: 8),
                Text('VIEWS: 700', style: ThemeText.paragraph)
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(Icons.all_inbox_outlined, size: iconSize, color: colorType(type)),
                const SizedBox(height: 8),
                Text(type.toUpperCase(), style: ThemeText.paragraph)
              ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Icon(categoryItem.icon, size: iconSize, color: categoryItem.color),
                const SizedBox(height: 8),
                Text(category.toUpperCase(), style: ThemeText.paragraph, overflow: TextOverflow.ellipsis, maxLines: 1,)
              ]),
            ]
          ),
          const LineSpace(),
        
          /// VERIFIED PROPERTIES
          const TitleBasic(title: 'Verified Info', desc: "The information to help you trust this promo."),
          const VSpaceShort(),
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
              padding: const EdgeInsets.all(0),
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
        ]
      )
    );
  }
}