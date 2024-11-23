import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class BusinessStatsCard extends StatelessWidget {
  const BusinessStatsCard({
    super.key,
    required this.type,
    required this.thumb,
    required this.id,
    required this.name,
    required this.category,
    required this.stared,
    required this.share,
    required this.like,
    required this.saved,
    required this.views,
  });

  final String type;
  final String thumb;
  final String id;
  final String name;
  final String category;
  final int stared;
  final double share;
  final double like;
  final int saved;
  final double views;
  
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    const double iconSize = 18;
    var getCategory = categoryList.firstWhere((item) => item.id == category);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: ThemeRadius.medium
      ),
      child: Container(
        padding: EdgeInsets.all(spacingUnit(1)),
        decoration: BoxDecoration(
          border: Border.all(
            color: colorType(type),
            width: 1,
          ),
          borderRadius: ThemeRadius.medium
        ),
        child: Column(
          children: [
            /// PROMO PROPERTIES
            Row(children: [
              ClipRRect(
                borderRadius: ThemeRadius.small,
                child: Image.network(
                  thumb,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      width: 40,
                      height: 40,
                      child: ShimmerPreloader()
                    );
                  },
                ),
              ),
            
              SizedBox(width: spacingUnit(1)),
            
              Expanded(
                child: Column(children: [
                  /// ID AND RATINGS
                  Row(children: [
                    Expanded(
                      child: Text('#123456${id.toString()}', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold))
                    ),
                    Container(
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
                  ]),
                            
                  /// TITLE AND CATEGORY
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: lighten(colorType(type), 0.5),
                      child: Icon(getCategory.icon, size: 12, color: colorType(type)),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        name.toCapitalCase(),
                        style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      )
                    )
                  ]),
                ]),
              ),
            ]),
            SizedBox(height: spacingUnit(2)),
            
            /// PROMO STATS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Row(children: [
                    Icon(Icons.remove_red_eye, size: iconSize, color: Colors.grey),
                    Text(' Views'),
                  ]),
                  const SizedBox(height: 8),
                  Text(views.toString(), style: ThemeText.title2)
                ]),
                const SizedBox(width: 8),
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Row(children: [
                    Icon(Icons.bookmark, size: iconSize, color: ThemePalette.primaryMain),
                    const Text(' Saved'),
                  ]),
                  const SizedBox(height: 8),
                  Text(saved.toString(), style: ThemeText.title2)
                ]),
                const SizedBox(width: 8),
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Row(children: [
                    Icon(Icons.favorite, size: iconSize, color: ThemePalette.tertiaryMain),
                    const Text(' Liked'),
                  ]),
                  const SizedBox(height: 8),
                  Text(like.toString(), style: ThemeText.title2)
                ]),
                const SizedBox(width: 8),
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Row(children: [
                    Icon(Icons.share, size: iconSize, color: ThemePalette.secondaryMain),
                    const Text(' Share'),
                  ]),
                  const SizedBox(height: 8),
                  Text(share.toString(), style: ThemeText.title2)
                ]),
              ]
            ),
          ],
        ),
      ),
    );
  }
}