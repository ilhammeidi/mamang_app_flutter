import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_info.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/pricing_card.dart';

class BusinessCreateNew extends StatelessWidget {
  const BusinessCreateNew({super.key});

  final String descVip = 'This makes it easy to spread offers quickly and efficiently.';
  final String descPro = 'For business people, they can place their advertisements';
  final String descBasic = 'Makes it easy for users to customize the appearance';
  final String descFree = 'Easily access special offers directly through their gadgets.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/business');
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        centerTitle: false,
        title: const Text('Choose Your Package')
      ),
      body: Container(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: Column(children: [

          /// YOUTUBE TUTORIAL
          Container(
            padding: EdgeInsets.all(spacingUnit(1)),
            decoration: BoxDecoration(
              borderRadius: ThemeRadius.small,
              gradient: LinearGradient(
                colors: <Color>[Colors.red.shade50, Colors.red.shade200],
                stops: const [0.5, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            ),
            child: Row(children: [
              Transform.rotate(
                angle: -15 * math.pi/180,
                child: const FaIcon(FontAwesomeIcons.youtube, color: Colors.red, size: 56)
              ),
              SizedBox(width: spacingUnit(2)),
              Expanded(
                child: RichText(text: TextSpan(
                  text: 'Want to learn more how to use the business features? ',
                  style: ThemeText.paragraph.copyWith(color: Theme.of(context).colorScheme.onSurface),
                  children: const [
                    TextSpan(
                      text: 'Tap to watch the tutorial on YouTube',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    )
                  ]
                )),
              )
            ]),
          ),
          const VSpace(),

          /// PACKAGE PRICING AND PLAN LIST
          InkWell(
            onTap: () {
              showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Wrap(children: [
                    BusinessInfo(
                      icon: const VipIcon(),
                      color: 'purple',
                      name: 'Diamond',
                      desc: descVip,
                    )
                  ]);
                }
              );
            },
            child: PricingCard(
              mainIcon: const VipIcon(),
              color: colorType('purple'),
              title: 'Diamond',
              price: 20,
              desc: descVip
            ),
          ),
          const VSpace(),

          InkWell(
            onTap: () {
              showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Wrap(children: [
                    BusinessInfo(
                      icon: const ProIcon(),
                      color: 'blue',
                      name: 'Gold',
                      desc: descPro,
                    )
                  ]);
                }
              );
            },
            child: PricingCard(
              isRecomended: true,
              mainIcon: const ProIcon(),
              color: colorType('blue'),
              title: 'Gold',
              price: 10,
              desc: descPro
            ),
          ),
          const VSpace(),

          InkWell(
            onTap: () {
              showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Wrap(children: [
                    BusinessInfo(
                      icon: const BasicIcon(),
                      color: 'green',
                      name: 'Basic',
                      desc: descBasic,
                    )
                  ]);
                }
              );
            },
            child: PricingCard(
              mainIcon: const BasicIcon(),
              color: colorType('green'),
              title: 'Basic',
              price: 5,
              desc: descBasic,
            ),
          ),
          const VSpace(),

          InkWell(
            onTap: () {
              showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Wrap(children: [
                    BusinessInfo(
                      icon: const FreeIcon(),
                      color: 'grey',
                      name: 'FREE',
                      desc: descFree,
                    )
                  ]);
                }
              );
            },
            child: PricingCard(
              mainIcon: const FreeIcon(),
              color: colorType('grey'),
              title: 'FREE',
              price: 0,
              desc: descFree
            ),
          ),
          const VSpace(),
        ]),
      )
    );
  }
}