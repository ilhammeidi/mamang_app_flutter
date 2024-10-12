import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key, required this.img, this.isLocal = false});

  final String img;
  final bool isLocal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.5)
          ),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Hero(
          tag: img,
          child: PhotoView(
            imageProvider: isLocal ? AssetImage(img) : NetworkImage(img),
          ),
        ),
      ),
    );
  }
}