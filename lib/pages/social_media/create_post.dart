import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/utils/bottom_draggable_sheet.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/header_form.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/forms/post_form.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: HeaderForm(),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          double maxWidth = constraint.maxWidth;
          double height = MediaQuery.of(context).size.height * 0.8;

          return Stack(
            children: [
              /// TAKEN IMAAGE
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  color: Colors.black,
                  width: maxWidth,
                  height: height,
                  child: Center(
                    child: Image.network(
                      ImgApi.photo[150],
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          width: double.infinity,
                          height: 500,
                          child: ShimmerPreloader()
                        );
                      },
                    ),
                  ),
                ),
              ),
              
              /// BOTTOMSHEET FORM
              const BottomDraggableSheet(
                initPosition: 0.6,
                maxPosition: 0.6,
                content: Wrap(children: [
                  PostForm()
                ],)
              )
            ],
          );
        },
      )
    );
  }
}