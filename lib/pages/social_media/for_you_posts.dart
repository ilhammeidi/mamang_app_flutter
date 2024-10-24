import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/grid_post.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/group_list_slider.dart';

class ForYouPosts extends StatelessWidget {
  const ForYouPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate([
      const VSpaceShort(),
      const GroupListSlider(),
      const VSpaceShort(),
      GridPost(postDatas: postList.sublist(30, 34)),
      Container(height: 600, color: Colors.purple)
    ]));
  }
}