import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/follow_stats.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/panel_activities.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/panel_point.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/panel_posts.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/panel_rank.dart';

class DashboardPersonal extends StatelessWidget {
  const DashboardPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      children: [
        const SizedBox(height: 4),
        const FollowStats(),
        const VSpace(),
        GestureDetector(
          onTap: () {
            Get.toNamed('/rewards');
          },
          child: const PanelPoint()
        ),
        const VSpace(),
        GestureDetector(
          onTap: () {
            Get.toNamed('/leaderboards');
          },
          child: const PanelRank()
        ),
        const VSpace(),
        PanelPosts(),
        const VSpaceBig(),
        const PanelActivities(),
        const SizedBox(height: 40),
      ],
    );
  }
}