import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/info_card.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/reward_card.dart';
import 'package:mamang_app_flutter/ui/widgets/notifications/notif_block.dart';

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    final ButtonStyle iconBtn = IconButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 3
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          style: iconBtn,
          icon: const Icon(Icons.arrow_back_ios_new, size: 22),
        ),
        title: const Text('Your Rewards', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: spacingUnit(7)),
        decoration: BoxDecoration(
          gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
        ),
        child: Column(children: [
          const VSpaceShort(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/detail-point');
              },
              child: RewardCard(
                color: Colors.blueAccent,
                title: 'Points'.toUpperCase(),
                icon: Icon(Icons.stars, color: Colors.blueAccent.shade100, size: 22),
                progress: 30,
                btnText: '2X Redeem',
                onTap: () {
                  Get.toNamed('/detail-point');
                },
              ),
            )
          ),
          const VSpaceShort(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/detail-coin');
              },
              child: RewardCard(
                color: Colors.amber.shade700,
                title: 'Coins'.toUpperCase(),
                icon: Icon(Icons.motion_photos_on, color: Colors.amber[100], size: 22),
                progress: 52,
                btnText: 'Withdraw',
                max: 100,
                label: 'K',
                onTap: () {
                  Get.toNamed('/detail-coin');
                },
              ),
            )
          ),
          const VSpaceShort(),
          /// INFORMATION
          Expanded(child: 
            Container(
              padding: EdgeInsets.all(spacingUnit(1)),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              child: ListView(padding: const EdgeInsets.all(4), children: [
                const Text('Many ways to get more rewards. 🎯LET\'S HUNT NOW!', style: ThemeText.title2,),
                const VSpaceShort(),
                const NotifBlock(type: 'info', title: 'Information', subtitle: 'You can claim voucher fragment from point.'),
                const VSpaceShort(),
                Row(children: [
                  Expanded(
                    child: InfoCard(
                      illustration: SizedBox(
                        height: 100,
                        child: Image.asset('assets/images/explore.png'),
                      ),
                      title: 'Make more transaction to get more rewards',
                      actionText: 'Explore hot promotions',
                      color: ThemePalette.primaryMain
                    ),
                  ),
                  SizedBox(width: spacingUnit(1),),
                  Expanded(
                    child: InfoCard(
                      illustration: SizedBox(
                        height: 100,
                        child: Center(child: Image.asset('assets/images/saved.png')),
                      ),
                      title: 'Get rewards by sharing to social medial',
                      actionText: 'Check out updates',
                      color: ThemePalette.primaryMain
                    ),
                  ),
                ],),
                SizedBox(height: spacingUnit(1),),
                Row(children: [
                  Expanded(
                    child: InfoCard(
                      illustration: Icon(Icons.group, size: 50, color: ThemePalette.primaryMain),
                      title: 'Invite your friend and get free 1000 coins',
                      color: ThemePalette.secondaryMain,
                      actionText: 'Copy link to share',
                    ),
                  ),
                  SizedBox(width: spacingUnit(1),),
                  Expanded(
                    child: InfoCard(
                      illustration: Icon(Icons.qr_code, size: 50, color: ThemePalette.secondaryMain),
                      title: 'Scan QR Code for transaction here!',
                      color: ThemePalette.secondaryMain,
                      actionText: 'Scan QR',
                    ),
                  ),
                ]),
                const VSpace(),
              ]),
            )
          )
        ],),
      )
    );
  }
}