import 'package:flutter/material.dart';
import 'package:change_case/change_case.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.thumb,
    this.liked = false,
    required this.point,
    required this.time,
    required this.title,
    this.onTap,
  });

  final String thumb;
  final bool liked;
  final int point;
  final String time;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(alignment: Alignment.topRight, children: [
          /// HERO THUMB
          Hero(
            tag: thumb,
            child: ClipRRect(
              borderRadius: ThemeRadius.small,
              child: Image.network(
                thumb,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ShimmerPreloader()
                  );
                },
              ),
            )
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
        ]),

        /// EVENT PROPERTIES
        Padding(padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: ThemeRadius.medium
              ),
              child: Text('$point POINT', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold))
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: ThemeRadius.medium
              ),
              child: Row(children: [
                const Icon(Icons.access_time_outlined, size: 12),
                const SizedBox(width: 2),
                Text(time, style: ThemeText.caption),
              ],)
            ),
          ]),
        ),
        /// EVENT TITLE
        SizedBox(
          height: 60,
          child: Text(
            title.toCapitalCase(),
            style: ThemeText.subtitle2,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ),
      ]),
    );
  }
}