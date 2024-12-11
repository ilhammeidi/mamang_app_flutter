import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/models/events.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/models/post.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/profile_card.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/profile_card_landscape.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_list.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/about_group.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_banner.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_header.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_options.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/list_post.dart';

class ProfileGroup extends StatefulWidget {
  const ProfileGroup({super.key});

  @override
  State<ProfileGroup> createState() => _ProfileGroupState();
}

class _ProfileGroupState extends State<ProfileGroup> with TickerProviderStateMixin {
  final ScrollController _scrollref = ScrollController();
  late AnimationController _slideRef;
  
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
                name: 'Ice Cream Lovers',
                username: '230 Members',
                image: 'assets/images/profile_banner2.jpg',
                avatar: ImgApi.photo[19],
                bio: ContentApi.sentences,
              ),
              CoverHeader(
                animationRef: _slideRef,
                coverOptions: const GroupOptions(),
                avatar: ImgApi.photo[19],
                name: 'Ice Cream Lovers',
                isJoin: true,
              ),
              CoverTab(tabController: _tabController, menuList: const ['Posts', 'Events', 'About', 'Members', 'Admins'],)
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              /// POST
              SingleChildScrollView(
                child: ListPost(postDatas: postList.sublist(18, 38)),
              ),

              /// EVENTS
              SingleChildScrollView(
                child: EventList(items: eventList.sublist(0, 4))
              ),

              /// ABOUT
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(spacingUnit(2)),
                  child: const AboutGroup(),
                )
              ),

              /// MEMBERS
              SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 10,
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
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/user-profile');
                      },
                      child: ProfileCard(
                        avatar: item.avatar,
                        name: item.name,
                        distance: item.distance
                      ),
                    );
                  }
                )
              ),

              // ADMINS
              SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.all(spacingUnit(1)),
                  itemBuilder: ((BuildContext context, int index) {
                    User item = userList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/user-profile');
                      },
                      child: ProfileCardLandscape(
                        avatar: item.avatar,
                        name: item.name,
                        distance: item.distance,
                        textButton: 'Follow',
                        isLast: true,
                      ),
                    );
                  })
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
