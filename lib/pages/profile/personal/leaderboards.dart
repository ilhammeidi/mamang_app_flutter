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
      appBar: AppBar(
        backgroundColor: Colors.purple,
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
        title: const Text('Your Achievement', style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.purple,
            image: DecorationImage(image: AssetImage('assets/images/bg_blink.png'), fit: BoxFit.contain, alignment: Alignment.topCenter)
          ),
          child: Column(children: [
            const PanelRankStats(color: Colors.purple),
            Padding(
              padding: EdgeInsets.only(top: spacingUnit(2)),
              child: const TableRank(),
            ),
          ]),
        ),
      )
    );
  }
}