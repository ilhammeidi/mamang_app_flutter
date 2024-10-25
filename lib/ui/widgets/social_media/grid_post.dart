import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/post_short_card.dart';

class GridPost extends StatelessWidget {
  const GridPost({super.key, required this.postDatas});

  final List<Post> postDatas;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.all(spacingUnit(1)),
        child: Text('Nearby Updates', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
      ),
      GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 9/16
        ),
        itemBuilder: (context, index) {
          Post item = postDatas[index];
          User user = userList.firstWhere((userItem) => userItem.id == item.userId);
          return PostShortCard(
            image: item.image,
            avatar: user.avatar,
            desc: item.caption,
            range: item.views,
            duration: item.duration,
            time: item.timeFrom
          );
        }
      )
    ]);
  }
}