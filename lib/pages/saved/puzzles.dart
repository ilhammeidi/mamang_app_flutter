import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/puzzles.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/puzzle_card.dart';

class Puzzles extends StatelessWidget {
  const Puzzles({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      padding: EdgeInsets.symmetric(vertical: spacingUnit(2), horizontal: spacingUnit(1)),
      color: colorScheme.surfaceContainerLowest,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
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
                liked: item.liked,
                onTap: () {
                  if(item.progress.length < 9) {
                    Get.toNamed('/puzzle/${index+1}');
                  } else {
                    Get.toNamed('/voucher');
                  }
                }
              ),
            ],
          );
        }
      ),
    );
  }
}