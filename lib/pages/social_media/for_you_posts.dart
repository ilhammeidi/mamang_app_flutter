import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/sponsored_promo.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/grid_post.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/group_list_slider.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/list_post.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/list_post_slider.dart';

class ForYouPosts extends StatelessWidget {
  const ForYouPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate([
      const SizedBox(height: 8),
      /// Group List
      const GroupListSlider(),
      const VSpaceShort(),

      /// Grid Post
      GridPost(postDatas: postList.sublist(30, 34)),
      const VSpaceShort(),

      /// List Post
      ListPost(postDatas: postList.sublist(6, 10)),
      const VSpaceShort(),

      /// List Post Slider
      ListPostSlider(postDatas: postList.sublist(36, 42)),
      const VSpaceShort(),

      /// List Post
      ListPost(postDatas: postList.sublist(15, 18)),
      const VSpaceShort(),

      /// Ads
      SponsoredPromo(image: ImgApi.photo[80]),
      const VSpaceShort(),
      
      ListPost(postDatas: postList.sublist(20, 25)),
      const SizedBox(height: 100),
    ]));
  }
}