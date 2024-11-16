import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/community.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/profile_card.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/profile_card_landscape.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/profile_card_portrait.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/about_user.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_banner.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_header.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_options.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/list_post.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> with TickerProviderStateMixin {
  final ScrollController _scrollref = ScrollController();
  late AnimationController _slideRef;
  final followCount = 13;
  
  TabController? _tabController;

  @override
  void initState() {
    _slideRef = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _slideRef.dispose();
    _scrollref.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollref.addListener(() {
      setState(() {
        if(_scrollref.offset >= 300) {
          _slideRef.forward();
        } else {
          _slideRef.reverse();
        }
      });
    });

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _scrollref,
          headerSliverBuilder: (context, value) {
            return [
              CoverBanner(
                name: 'James Doe',
                username: '@james_doe',
                image: 'assets/images/profile_banner.jpg',
                avatar: ImgApi.avatar[8],
                bio: ContentApi.sentences,
                followers: 34,
                followings: 125,
                groups: 3,
              ),
              CoverHeader(
                animationRef: _slideRef,
                coverOptions: const UserOptions(),
                avatar: ImgApi.avatar[8],
                name: 'James Doe',
              ),
              CoverTab(tabController: _tabController, menuList: const ['Posts', 'Followings', 'Followers', 'Groups', 'About'],)
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              /// POST
              SingleChildScrollView(
                child: ListPost(postDatas: postList.sublist(28, 48)),
              ),

              /// FOLLOWINGS
              SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.all(spacingUnit(2)),
                  itemBuilder: ((BuildContext context, int index) {
                    User item = userList[index];
                    return ProfileCardLandscape(
                      avatar: item.avatar,
                      name: item.name,
                      distance: item.distance,
                      textButton: 'Follow',
                      isLast: index + 1 == followCount,
                    );
                  })
                )
              ),

              /// FOLLOWERS
              SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 8,
                  padding: EdgeInsets.all(spacingUnit(2)),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 60
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    User item = userList[index];
                    return ProfileCard(
                      avatar: item.avatar,
                      name: item.name,
                      distance: item.distance
                    );
                  }
                )
              ),

              /// GROUPS
              SingleChildScrollView(
                child: GridView.builder(
                  primary: true,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.all(spacingUnit(2)),
                  itemCount: communityList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    Community item = communityList[index];
                    return ProfileCardPortrait(
                      avatar: item.avatar,
                      name: item.name,
                      desc: 'Members: ${item.totalMembers}',
                      btnText: 'JOIN'
                    );
                  },
                ),
              ),

              /// ABOUT
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(spacingUnit(2)),
                  child: const AboutUser(),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
