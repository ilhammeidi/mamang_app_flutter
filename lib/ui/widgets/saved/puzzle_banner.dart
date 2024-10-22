import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/widgets/action_header/like_btn.dart';

class PuzzleBanner extends StatelessWidget {
  const PuzzleBanner({super.key, required this.imageBanner});

  final String imageBanner;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.bottomCenter,
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageBanner),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.hardLight),
          )
        ),
        child: Container(
          height: 24,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )
          ),
        )
      ),
      Positioned(
        top: 8,
        left: 8,
        child: IconButton(
          onPressed: () {
            Get.back();
          }, 
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)
        ),
      ),
      const Positioned(
        top: 8,
        right: 8,
        child: LikeBtn(hasBg: true, isLiked: true,)
      )
    ]);
  }
}