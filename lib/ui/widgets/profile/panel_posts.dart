import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/post_controller.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/forms/post_option.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';

class PanelPosts extends StatelessWidget {
  PanelPosts({super.key});
  final postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.medium,
            color: isDark ? Colors.grey[800] : Colors.grey[100]
          ),
          child: GetBuilder<PostController>(
            builder: (controller) {
              List<Post> myPosts = controller.allPost.where((item) => item.userId == 1).toList();
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(spacingUnit(1)),
                    child: TitleAction(
                      title: 'Your Posts',
                      textAction: '+ Create New Post',
                      desc: 'You have ${myPosts.length} posts',
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return const Wrap(
                              children: [
                                PostOption()
                              ]
                            );
                          }
                        );
                      }
                    ),
                  ),
                  SizedBox(height: spacingUnit(1),),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      bottom: spacingUnit(2)
                    ),
                    physics: const ClampingScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      Post item = myPosts[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/updates/${item.id}');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            item.image,
                            width: 200,
                            height: 200,
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
                        )
                      );
                    }
                  ),
                ],
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(spacingUnit(1)),
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                colorScheme.surfaceContainerLowest.withOpacity(0),
                colorScheme.surfaceContainerLowest,
              ]
            )
          ),
          alignment: Alignment.bottomCenter,
          child: FilledButton(
            onPressed: () {
              Get.toNamed('/updates');
            },
            style: ThemeButton.invert(context),
            child: const Text('Show All Posts'),
          )
        )
      ],
    );
  }
}