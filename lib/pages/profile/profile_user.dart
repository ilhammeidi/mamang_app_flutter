import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_banner.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_header.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_options.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> with TickerProviderStateMixin {
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
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 600),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 600),
                        child: Center(
                          child: Text("TITLE1"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 600),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Center(
                          child: Text("TITLE2"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 600),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Center(
                          child: Text("TITLE3"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 600),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Center(
                          child: Text("TITLE3"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: 600),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 600),
                        child: Center(
                          child: Text("TITLE3"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
