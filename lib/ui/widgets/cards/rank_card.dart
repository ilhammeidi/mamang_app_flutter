import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class RankCard extends StatelessWidget {
  const RankCard({
    super.key,
    required this.point,
    required this.title,
    required this.avatar,
    required this.color,
    required this.badge
  });

  final double point;
  final String title;
  final String avatar;
  final Color color;
  final Widget badge;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.medium,
                color: colorScheme.surfaceContainer,
                border: Border.all(
                  width: 1,
                  color: color,
                )
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// GRADIENT BOX
                      Container(
                        height: 100,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: ThemeRadius.medium,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[lighten(color, 0.2), darken(color, 0.1)]
                          ),
                        ),
                        child: Text(title, style: ThemeText.caption.copyWith(color: Colors.white))
                      ),
                      /// POINT
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(top: spacingUnit(2)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.stars, size: 22, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(point.toString(), style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )
                    ],
                  ),
                  /// AVATAR
                  Positioned(
                    top: 70,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(avatar),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
        /// BADGE
        badge,
      ],
    );
  }
}