import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/select_category_grid.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/grid_post.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/list_post.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/list_post_slider.dart';

class FollowingPosts extends StatelessWidget {
  const FollowingPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate([
      const VSpaceShort(),
      /// List Post Slider
      ListPostSlider(postDatas: postList.sublist(42, 48)),
      const VSpaceShort(),

      /// List Post
      ListPost(postDatas: postList.sublist(27, 30)),
      const VSpaceShort(),

      /// Grid Post
      GridPost(postDatas: postList.sublist(35, 39)),
      const VSpaceShort(),

      /// List Post
      ListPost(postDatas: postList.sublist(18, 21)),
      const VSpaceShort(),
      
      /// Promo Categories
      const SelectCategoryGrid(),
      const VSpaceShort(),
      
      ListPost(postDatas: postList.sublist(0, 4)),
      const SizedBox(height: 100),
    ]));
  }
}