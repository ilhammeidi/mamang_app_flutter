import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/post_controller.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/chat/chat_input.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/post_comments.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/post_content.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/post_header.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final ScrollController _scrollref = ScrollController();
  final controller = Get.put(PostController());

  bool _isFixed = false;

  String id = Get.parameters['id'] ?? '';

  @override
  void initState() {
    fetchDetail(id);
    super.initState();
  }

  @override
  void dispose() {
    _scrollref.dispose();
    super.dispose();
  }

  Future<void> fetchDetail(val) async {
    controller.getPost(val);
  }

  @override
  Widget build(BuildContext context) {
    final User user = userList.firstWhere((item) => item.id == controller.selectedPost.value.userId);
    final Post post = controller.selectedPost.value;

    // Remove it later, because only id greated than 30 can use as short post
    final idInt = int.parse(id);

    _scrollref.addListener(() {
      setState(() {
        if(_scrollref.offset > 200) {
          _isFixed = true;
        } else {
          _isFixed = false;
        }
      });
    });

    return controller.isNotFound.value ? const Text('Post not found') : Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: idInt >= 30 ? const Size.fromHeight(100) : const Size.fromHeight(50),
        child: PostHeader(
          name: user.name,
          avatar: user.avatar,
          range: post.views,
          timeFrom: post.timeFrom,
          timeTo: post.timeTo,
          timeLeft: post.timeFrom,
          duration: idInt >= 30 ? post.duration : 0,
          isFixed: _isFixed,
        ),
      ),
      body: ListView(
        controller: _scrollref,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          PostContent(
            caption: post.caption,
            image: post.image,
            likes: post.likes,
            comments: post.comments,
            views: post.views,
            location: post.location,
            promoId: post.id
          ),
          const VSpace(),
          const PostComments(),
          const SizedBox(height: 100,)
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        shadowColor: Colors.black,
        height: 80,
        color: Theme.of(context).colorScheme.surface,
        padding: EdgeInsets.all(spacingUnit(1)),
        child: ChatInput(sendMsg: (_) {}, hasBorder: false, hintText: 'Write comment',),
      )
    );
  }
}