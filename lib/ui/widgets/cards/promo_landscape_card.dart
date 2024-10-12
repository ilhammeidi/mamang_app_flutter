import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class PromoLandscapeCard extends StatelessWidget {
  const PromoLandscapeCard({
    super.key,
    required this.thumb,
    required this.id,
    required this.title,
    required this.distance,
    required this.date,
    required this.desc,
    this.liked = false,
    this.onTap
  });

  final String thumb;
  final String id;
  final String title;
  final double distance;
  final String date;
  final String desc;
  final bool liked;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Color greyText = Theme.of(context).colorScheme.onSurfaceVariant;

    return SizedBox(
      height: 150,
      child: InkWell(
        onTap: onTap,
        child: PaperCard(content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          /// THUMBNAIL
          Stack(
            children: [
              ClipRRect(
                borderRadius: ThemeRadius.small,
                child: Image.network(
                  thumb,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      width: 150,
                      height: 150,
                      child: ShimmerPreloader()
                    );
                  },
                ),
              ),
              liked ? Positioned(
                top: 8,
                left: 8,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: Icon(Icons.favorite, size: 16, color: ThemePalette.tertiaryMain),
                ),
              ) : Container(),
            ],
          ),
          /// CARD INFORMATION
          Expanded(
            child: Padding(padding: EdgeInsets.only(left: spacingUnit(2), right: 4),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                /// ID
                Text(
                  '#12345$id',
                  style: ThemeText.caption.copyWith(color: greyText)
                ),
                /// PROMO NAME
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    title.toCapitalCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                /// PROPERTIES
                Row(children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      child: Row(children: [
                        Icon(Icons.location_on_outlined, size: 13, color: ThemePalette.tertiaryMain),
                        const SizedBox(width: 2),
                        Text('$distance M', style: ThemeText.caption)
                      ],),
                    ),
                  ),
                  SizedBox(width: spacingUnit(1)),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      child: Row(children: [
                        Icon(Icons.calendar_today_outlined, size: 13, color: ThemePalette.secondaryMain),
                        const SizedBox(width: 2),
                        Text(date, style: ThemeText.caption),
                      ],),
                    ),
                  ),
                ]),
                SizedBox(height: spacingUnit(1)),
                /// DESCRIPTION
                SizedBox(
                  height: 40,
                  child: Text(
                    desc,
                    style: ThemeText.caption,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
                ),
              ])
            ),
          )
        ])),
      ),
    );
  }
}