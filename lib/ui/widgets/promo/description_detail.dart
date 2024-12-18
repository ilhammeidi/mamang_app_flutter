import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/review/review_button.dart';
import 'package:mamang_app_flutter/ui/widgets/review/review_list_slider.dart';
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
    const double iconSize = 18;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        /// DESCRIPTION
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TitleBasic(title: 'Promo Description'),
            const VSpaceShort(),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('ID: #123456$id', textAlign: TextAlign.start),
              const SizedBox(height: 4),
              const Text('Periode: 12 Jan - 20 Jan 2025', textAlign: TextAlign.start),
              const SizedBox(height: 4),
              Text('Event: ${category.toUpperCase()}', textAlign: TextAlign.start),
            ]),
            SizedBox(height: spacingUnit(2)),
            Text(desc, textAlign: TextAlign.start,),
          ])
        ),
        const LineSpace(),
    
        /// PROPERTIES INFO
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Row(children: [
                  Icon(Icons.star, size: iconSize, color: Colors.orangeAccent),
                  Text(' Rating'),
                ]),
                const SizedBox(height: 8),
                RichText(
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(text: '', style: TextStyle(color: colorScheme.onSurface, fontSize: 16), children: [
                    TextSpan(text: '4.5', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
                    const TextSpan(text: '/5'),
                  ])
                ),
              ]),
              const SizedBox(width: 8),
              const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Row(children: [
                  Icon(Icons.favorite, size: iconSize, color: Colors.redAccent),
                  Text(' Liked'),
                ]),
                SizedBox(height: 8),
                Text('22', style: ThemeText.title2)
              ]),
              const SizedBox(width: 8),
              Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Row(children: [
                  Icon(Icons.bookmark, size: iconSize, color: ThemePalette.primaryMain),
                  const Text(' Saved'),
                ]),
                const SizedBox(height: 8),
                const Text('8', style: ThemeText.title2)
              ]),
              const SizedBox(width: 8),
              const Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Row(children: [
                  Icon(Icons.remove_red_eye, size: iconSize, color: Colors.grey),
                  Text(' Views'),
                ]),
                SizedBox(height: 8),
                Text('1299', style: ThemeText.title2)
              ]),
            ]
          ),
        ),
        const LineSpace(),
    
        /// RATING
        const ReviewListSlider(),
        const VSpaceShort(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
          child: const ReviewButton(reviewed: true,),
        ),
        const LineSpace(),
      
        /// VERIFIED PROPERTIES
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: const TitleBasic(title: 'Verified Info', desc: "The information to help you trust this promo."),
        ),
        const VSpaceShort(),
        Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          margin: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
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
    );
  }
}