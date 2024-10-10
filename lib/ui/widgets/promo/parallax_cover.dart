import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';

class ParallaxCover extends StatelessWidget {
  const ParallaxCover({super.key, required this.thumb});

  final String thumb;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          thumb,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
              width: double.infinity,
              height: 120,
              child: ShimmerPreloader()
            );
          },
        ),
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
          ) 
        )
      ]
    );
  }
}