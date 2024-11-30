import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/point_card.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/rank_card.dart';

class PanelRankStats extends StatelessWidget {
  const PanelRankStats({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: spacingUnit(2),
        left: spacingUnit(1),
        right: spacingUnit(1),
        bottom: spacingUnit(1),
      ),
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.medium,
        color: color.withOpacity(0.15)
      ),
      child: Row(children: [
        Expanded(
          child: RankCard(
            point: 200,
            title: '#2 Gold',
            avatar: ImgApi.avatar[6],
            color: color,
            badge: Icon(
              Icons.emoji_events_rounded,
              color: Colors.amber,
              size: 65,
              shadows: [ThemeShade.shadeMedium(context)]
            )
          ),
        ),
        SizedBox(width: spacingUnit(2)),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            children: [
              PointCard(
                icon: CircleAvatar(
                  backgroundColor: ThemePalette.primaryMain.withOpacity(0.15),
                  radius: 12,
                  child: Icon(Icons.bookmark, color: ThemePalette.primaryMain),
                ),
                label: 'Saved',
                point: 124
              ),
              PointCard(
                icon: CircleAvatar(
                  backgroundColor: ThemePalette.secondaryMain.withOpacity(0.15),
                  radius: 12,
                  child: Icon(Icons.share, color: ThemePalette.secondaryMain),
                ),
                label: 'Shared',
                point: 200
              ),
              PointCard(
                icon: CircleAvatar(
                  backgroundColor: ThemePalette.tertiaryMain.withOpacity(0.15),
                  radius: 12,
                  child: Icon(Icons.favorite, color: ThemePalette.tertiaryMain),
                ),
                label: 'Liked',
                point: 432
              ),
              PointCard(
                icon: CircleAvatar(
                  backgroundColor: Colors.amber.withOpacity(0.15),
                  radius: 421,
                  child: const Icon(Icons.star, color: Colors.amber),
                ),
                label: 'Rating',
                point: 432
              )
            ],
          ),
        )
      ]),
    );
  }
}