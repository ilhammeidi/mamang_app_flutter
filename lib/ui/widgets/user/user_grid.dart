import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/profile_card.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

class UserGrid extends StatelessWidget {
  const UserGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      const SliverToBoxAdapter(child: TitleBasic(title: 'Most active users')),
      const SliverToBoxAdapter(child: VSpace()),
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          mainAxisExtent: 60
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (BuildContext context, int index) {
            final item = userList[index];
            return ProfileCard(
              avatar: item.avatar,
              name: item.name,
              distance: item.distance
            );
          }
        ),
      )
    ]);
  }
}