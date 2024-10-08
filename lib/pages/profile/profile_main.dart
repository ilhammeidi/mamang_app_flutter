import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/settings/setting_list.dart';
import 'package:mamang_app_flutter/ui/widgets/user/profile_banner_header.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: ProfileBannerHeader(
              minExtent: topPadding + 140,
              maxExtent: screenHeight / 3
            ),
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: SettingList()
          ),
          SliverPadding(padding: EdgeInsets.only(bottom: spacingUnit(10)))
        ],
      )
    );
  }
}