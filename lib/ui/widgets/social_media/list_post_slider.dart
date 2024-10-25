import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/post_short_card.dart';

class ListPostSlider extends StatelessWidget {
  const ListPostSlider({super.key, required this.postDatas});

  final List<Post> postDatas;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: Text('Latest Updates', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
      ),
      SizedBox(
        height: 300,
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: postDatas.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            Post item = postDatas[index];
            User user = userList.firstWhere((userItem) => userItem.id == item.userId);
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? spacingUnit(1) : 4,
                right: index < postDatas.length - 1 ? 4 : spacingUnit(1),
              ),
              child: AspectRatio(
                aspectRatio: 9/16,
                child: PostShortCard(
                  image: item.image,
                  avatar: user.avatar,
                  desc: item.caption,
                  range: item.views,
                  duration: item.duration,
                  time: item.timeFrom
                ),
              ),
            );
          }),
        ),
      )
    ]);
  }
}