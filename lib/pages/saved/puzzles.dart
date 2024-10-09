import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/puzzles.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/puzzle_card.dart';

class Puzzles extends StatelessWidget {
  const Puzzles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(spacingUnit(1)),
      child: GridView.builder(
        shrinkWrap: true,
        primary: true,
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
                    Get.toNamed('/puzzle/$index');
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