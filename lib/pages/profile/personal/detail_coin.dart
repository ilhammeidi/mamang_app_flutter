import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/rewards_history.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/activity_card.dart';

class DetailCoin extends StatelessWidget {
  const DetailCoin({super.key});

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 55;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
        title: const Text('Your Coins', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: spacingUnit(7)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.amber, Colors.amber.shade900]
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.stars, color: Colors.white.withOpacity(0.5), size: 40),
            SizedBox(width: spacingUnit(1)),
            Text('800000', style: ThemeText.title.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          ]),
          const VSpaceShort(),
          FilledButton(
            onPressed: () {},
            style: ThemeButton.btnBig.merge(ThemeButton.white),
            child: Text('Withdraw', style: ThemeText.subtitle2.copyWith(color: Colors.amber, fontWeight: FontWeight.bold)),
          ),
          const VSpace(),
          /// HISTORY
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                  child: const Text('History', style: ThemeText.title2,)
                ),
                const VSpaceShort(),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 24,
                      child: Container(
                        width: 3,
                        height: itemHeight * coinHistory.length,
                        decoration: BoxDecoration(
                          color: colorScheme.outline,
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                    ),
                    ListView.builder(
                      itemCount: coinHistory.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      itemBuilder: ((context, index) {
                        Reward item = coinHistory[index];
                        return ActivityCard(
                          title: item.title,
                          time: item.date,
                          icon: item.icon,
                          color: item.color,
                          isHighlighted: item.isOut,
                        );
                      })
                    )
                  ],
                ),
              ]),
            )
          )
        ],),
      )
    );
  }
}