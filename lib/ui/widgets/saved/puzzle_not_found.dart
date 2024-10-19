import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/utils/no_data.dart';

class PuzzleNotFound extends StatelessWidget {
  const PuzzleNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return NoData(
      image: 'assets/images/puzzle2.png',
      title: 'Sorry we couldn\'t find the item',
      desc: 'Please go to saved page or back to the homepage',
      primaryTxtBtn: 'Go to Saved page',
      secondaryTxtBtn: 'Go to homepage',
      primaryAction: () {
        Get.toNamed('/saved');
      },
      secondaryAction: () {
        Get.toNamed('/');
      },
    );
  }
}