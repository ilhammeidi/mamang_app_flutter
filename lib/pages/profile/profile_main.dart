import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/widgets/user/profile_banner_header.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: ProfileBannerHeader(
              minExtent: topPadding + 140,
              maxExtent: screenHeight / 3
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.white
            )
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1000,
              color: Colors.orange
            )
          )
        ],
      )
    );
  }
}