import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/pages/social_media/following_posts.dart';
import 'package:mamang_app_flutter/pages/social_media/for_you_posts.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/grabber_icon.dart';
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
                fixed: state.isPinned,
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

class PostOption extends StatelessWidget {
  const PostOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const GrabberIcon(),
        const VSpace(),

        /// TITLE
        Text('Create New Post', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: spacingUnit(1)),
        const Text('Choose your content post type. You can upload photo from gallery or take from camera', textAlign: TextAlign.center, style: ThemeText.subtitle),
        const VSpace(),

        /// ICON BUTTONS
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/create-post');
            },
            child: _iconButton(context, Icons.upload, ThemePalette.primaryMain, 'Upload Photo')
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/create-post');
            },
            child: _iconButton(context, Icons.camera_alt, ThemePalette.secondaryMain, 'Take Photo'),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/create-short-post');
            },
            child: _iconButton(context, Icons.access_time, ThemePalette.tertiaryMain, 'Short Post'),
          ),
        ]),
        const VSpaceBig(),
      ]),
    );
  }

  Widget _iconButton(BuildContext context, IconData icon, Color color, String text) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.medium,
            color: colorScheme.outline.withOpacity(0.5),
          ),
          child: Icon(icon, size: 48, color: color),
        ),
        SizedBox(height: spacingUnit(1)),
        Text(text)
      ],
    );
  }
}