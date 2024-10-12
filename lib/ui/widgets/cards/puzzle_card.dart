import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class PuzzleCard extends StatelessWidget {
  const PuzzleCard({
    super.key,
    required this.thumb,
    required this.name,
    required this.progress,
    required this.time,
    required this.liked,
    this.onTap,
  });

  final String thumb;
  final String name;
  final String progress;
  final String time;
  final bool liked;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// THUMBNAIL
        Stack(alignment: Alignment.center, children: [
          ClipRRect(
            borderRadius: ThemeRadius.medium,
            child: Image.network(
              thumb,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 200,
                  height: 200,
                  child: ShimmerPreloader()
                );
              },
            ),
          ),

          /// PROGRESS PUZZLE
          progress.length < 9 ?
            _puzzle(progress)
            : Icon(Icons.check_box, color: ThemePalette.primaryLight, size: 64,),

          /// TOP PROPERTIES
          Positioned(
            top: 8,
            child: Container(
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: ThemeRadius.big,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text('${progress.length}/9'),
              ),
            )
          )
        ]),

        /// BOTTOM PROPERTIES
        Padding(
          padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: ThemePalette.secondaryMain,
                borderRadius: ThemeRadius.medium,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: spacingUnit(1)),
                child: Text(time, style: const TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [ThemeShade.shadeSoft(context)]
              ),
              child: Icon(Icons.favorite, size: 16, color: ThemePalette.tertiaryMain),
            ),
          ])
        ),
        /// Title
        Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(2)),
          child: Text(name, style: ThemeText.subtitle, overflow: TextOverflow.ellipsis, maxLines: 2,),
        )
      ]),
    );
  }

  Widget _puzzle(String progress) {
    return SizedBox(
      width: 50,
      height: 50,
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        children: List.generate(9, (index) {
          int item = index + 1;
          return Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: progress.contains(item.toString()) ? ThemePalette.primaryMain : Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 1
              )
            ),
          );
        }),
      ),
    );
  }
}
