import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/post_card.dart';

class ListPost extends StatelessWidget {
  const ListPost({super.key, required this.postDatas});

  final List<Post> postDatas; 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: postDatas.length,
      itemBuilder: (BuildContext context, int index) {
        Post item = postDatas[index];
        User user = userList.firstWhere((userItem) => userItem.id == item.userId);
        return PostCard(
          name: user.name,
          avatar: user.avatar,
          caption: item.caption, 
          image: item.image,
          likes: item.likes,
          comments: item.comments,
          views: item.views,
          location: item.location,
          promoId: item.id,
        );
      }
    );
  }
}