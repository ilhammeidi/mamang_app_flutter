import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class PuzzleBlock extends StatelessWidget {
  const PuzzleBlock({
    super.key,
    required this.title,
    required this.time,
    required this.image,
    required this.progress
  });

  final String title;
  final String time;
  final String image;
  final String progress;

  @override
  Widget build(BuildContext context) {
    Alignment getAlign(val) {
      var progressNumber = val.toString();
      switch(progressNumber) {
        case '1':
          return Alignment.topLeft;
        case '2':
          return Alignment.topCenter;
        case '3':
          return Alignment.topRight;
        case '4':
          return Alignment.centerLeft;
        case '5':
          return Alignment.center;
        case '6':
          return Alignment.centerRight;
        case '7':
          return Alignment.bottomLeft;
        case '8':
          return Alignment.bottomCenter;
        case '9':
          return Alignment.bottomRight;
        default:
          return Alignment.center;
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      /// TITLE AND TIMER
      Padding(padding: EdgeInsets.all(spacingUnit(2)),
        child: Row(children: [
          Expanded(child: Text(title, style: ThemeText.title2)),
          SizedBox(width: spacingUnit(2)),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Text('Time left:', style: ThemeText.caption),
            SizedBox(height: spacingUnit(1)),
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
          ])
        ]),
      ),
      const VSpace(),
      SizedBox(
        width: 320,
        height: 320,
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: List.generate(9, (index) {
            int item = index + 1;
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outline
              ),
              child: progress.contains(item.toString()) ?
                Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: ClipRect(
                        child: Align(
                          widthFactor: 0.33,
                          heightFactor: 0.33,
                          alignment: getAlign(item),
                          child: Image.network(
                            image,
                            width: 320,
                            height: 320,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const SizedBox(
                                width: 320,
                                height: 320,
                                child: ShimmerPreloader()
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ) : Text('?', style: TextStyle(fontSize: 60, color: ThemePalette.primaryMain))
            );
          }),
        ),
      )
    ]);
  }
}