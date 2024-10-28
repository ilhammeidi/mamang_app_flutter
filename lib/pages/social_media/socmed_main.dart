import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:mamang_app_flutter/pages/social_media/following_posts.dart';
import 'package:mamang_app_flutter/pages/social_media/for_you_posts.dart';
import 'package:mamang_app_flutter/pages/social_media/post_option.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/header.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/tab_menu_socmed.dart';

class SocmedMain extends StatefulWidget {
  const SocmedMain({super.key});

  @override
  State<SocmedMain> createState() => _SocmedMainState();
}

class _SocmedMainState extends State<SocmedMain> {
  int _current = 0;

  void _handleSelect(int index) {
    setState(() {
      _current = index;
    });
  }

  final List<Widget> _content = [
    const ForYouPosts(),
    const FollowingPosts(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SocialMediaHeader(),
          SliverStickyHeader.builder(
            builder: (context, state) {
              return TabMenuSocmed(
                onSelect: _handleSelect,
                current: _current,
                onAddPost: () {
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
                },
              );
            },
            sliver: _content[_current]
          )
        ]
      ),
    );
  }
}
