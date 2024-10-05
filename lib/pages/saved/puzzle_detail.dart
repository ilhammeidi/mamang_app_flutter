import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/puzzles.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/puzzle_banner.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/puzzle_block.dart';

class PuzzleDetail extends StatelessWidget {
  PuzzleDetail({super.key});

  final String id = Get.parameters['id'] ?? '';

  @override
  Widget build(BuildContext context) {
    int puzzleId = int.parse(id);
    Puzzle item = puzzleList[puzzleId];

    return Scaffold(
      body: Column(children: [
        PuzzleBanner(imageBanner: item.thumb),
        PuzzleBlock(
          title: item.name,
          time: item.time,
          image: item.image,
          progress: item.progress
        ),
        const VSpace(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            style: ThemeButton.btnBig.merge(ThemeButton.primary),
            child: const Text('Redeem Point', style: ThemeText.subtitle,)
          ),
        )
      ]),
    );
  }
}