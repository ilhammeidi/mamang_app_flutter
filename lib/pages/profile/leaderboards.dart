import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/panel_rank_stats.dart';
import 'package:mamang_app_flutter/ui/widgets/profile/table_rank.dart';

class Leaderboards extends StatelessWidget {
  const Leaderboards({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle iconBtn = IconButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 3
    );

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: IconButton(
            onPressed: () {
              Get.back();
            },
            style: iconBtn,
            icon: const Icon(Icons.arrow_back_ios_new, size: 22),
          )
        ),
        centerTitle: true,
        /// TITLE AND SEARCH
        title: const Text('Leaderboards'),
      ),
      body: Column(children: [
        const PanelRankStats(color: Colors.purple),
        Container(
          padding: EdgeInsets.only(top: spacingUnit(2)),
          decoration: BoxDecoration(
            color: Colors.purple.withOpacity(0.15),
          ),
          child: const TableRank(),
        )
      ])
    );
  }
}