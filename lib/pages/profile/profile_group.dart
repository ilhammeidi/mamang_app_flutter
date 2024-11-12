import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_banner.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_header.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/cover_options.dart';

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
                image: 'assets/images/profile_banner.jpg',
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
