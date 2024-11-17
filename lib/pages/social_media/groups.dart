import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/community.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/profile_card_portrait.dart';
import 'package:mamang_app_flutter/ui/widgets/search_filter/search_input.dart';

class Groups extends StatelessWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const SearchInput(hintText: 'Search Group',),
        titleSpacing: 0,
      ),
      body: GridView.builder(
        primary: true,
        padding: EdgeInsets.all(spacingUnit(2)),
        itemCount: communityList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          Community item = communityList[index];
          return GestureDetector(
            onTap: () {
              Get.to('/group-profile');
            },
            child: ProfileCardPortrait(
              avatar: item.avatar,
              name: item.name,
              desc: 'Members: ${item.totalMembers}',
              btnText: 'JOIN'
            ),
          );
        },
      ),
    );
  }
}