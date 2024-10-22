import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/grabber_icon.dart';

class DetailSponsor extends StatelessWidget {
  const DetailSponsor({
    super.key,
    required this.thumb,
    required this.distance,
    required this.location,
    required this.title,
    required this.desc,
  });

  final String thumb;
  final double distance;
  final String location; 
  final String title; 
  final String desc; 

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const GrabberIcon(),
        const VSpace(),
        /// THUMBNAIL
        Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.medium,
            border: Border.all(
              width: 2,
              color: ThemePalette.primaryMain,
            )
          ),
          child: ClipRRect(
            borderRadius: ThemeRadius.medium,
            child: Image.network(thumb, width: double.infinity, fit: BoxFit.contain)
          ),
        ),
        const VSpace(),
      
        /// TEXT TITLE DESCRIPTION
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: ThemeRadius.medium
          ),
          child: Text('Sponsored', style: ThemeText.caption.copyWith(color: colorScheme.onPrimaryContainer)),
        ),
        const SizedBox(height: 4),
        Text(title.toCapitalCase(), textAlign: TextAlign.start, style: ThemeText.title.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: spacingUnit(1)),
        Text(desc, textAlign: TextAlign.start, style: ThemeText.subtitle),
        const VSpace(),
      
        /// LOCATION INFO
        Row(mainAxisAlignment: MainAxisAlignment.start, children:[
          Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
          const SizedBox(width: 4),
          Text('Promo Location', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold))
        ]),
        const SizedBox(height: 4),
        Text('Distance: $distance - $location', textAlign: TextAlign.start),
        const VSpace(),
      ]),
    );
  }
}