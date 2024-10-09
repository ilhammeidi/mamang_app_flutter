import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
    required this.thumb,
    required this.id,
    required this.title,
    required this.distance,
    required this.xp,
    this.liked = false,
  });

  final String thumb;
  final String id;
  final String title;
  final double distance;
  final double xp;
  final bool liked;

  @override
  Widget build(BuildContext context) {
    Color greyText = Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /// THUMBNAIL
      Stack(
        children: [
          ClipRRect(
            borderRadius: ThemeRadius.small,
            child: Image.network(
              thumb,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          liked ? Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: Icon(Icons.favorite, size: 16, color: ThemePalette.tertiaryMain),
            ),
          ) : Container(),
        ]
      ),
      
      /// ID
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          '#12345$id',
          style: ThemeText.caption.copyWith(color: greyText)
        ),
      ),

      /// TITLE NAME
      SizedBox(
        height: 60,
        child: Text(
          title.toCapitalCase(),
          style: ThemeText.subtitle2,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        )
      ),

      /// PROPERTIES
      Row(children: [
        Icon(Icons.location_on_outlined, size: 16, color: greyText),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text('$distance M', style: ThemeText.caption.copyWith(color: greyText)),
        ),
        const SizedBox(width: 16),
        Icon(Icons.check_circle_outline, size: 16, color: greyText),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(xp.toString(), style: ThemeText.caption.copyWith(color: greyText)),
        ),
      ]),
    ]);
  }
}