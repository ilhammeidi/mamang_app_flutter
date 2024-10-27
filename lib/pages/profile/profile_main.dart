import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/pages/profile/business_dashboard.dart';
import 'package:mamang_app_flutter/pages/profile/personal_dashboard.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/settings/setting_list.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/profile_banner_header.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  int _current = 0;
  void _handleSelect(int index) {
    setState(() {
      _current = index;
    });
  }

  final List<Widget> _content = [
    const PersonalDashboard(),
    const BusinessDashboard(),
    SettingList(),
  ];

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: ProfileBannerHeader(
              minExtent: topPadding + 140,
              maxExtent: 300,
              current: _current,
              onSelect: _handleSelect,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: _content[_current]
          ),
          SliverPadding(padding: EdgeInsets.only(bottom: spacingUnit(10)))
        ],
      )
    );
  }
}