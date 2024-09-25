import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/puzzles.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/puzzle_card.dart';

class Puzzles extends StatelessWidget {
  const Puzzles({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(
        top: spacingUnit(2),
        left: spacingUnit(2),
        right: spacingUnit(2),
        bottom: 100
      ),
      itemCount: puzzleList.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 320,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        Puzzle item = puzzleList[index]; 
        return Column(
          children: [
            PuzzleCard(
              thumb: item.thumb,
              name: item.name,
              progress: item.progress,
              time: item.time,
              liked: item.liked
            ),
          ],
        );
      }
    );
  }
}