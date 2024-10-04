import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/pricing_card.dart';

class BusinessCreateNew extends StatelessWidget {
  const BusinessCreateNew({super.key});

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
                colors: <Color>[Colors.red.shade200, Colors.red],
                stops: const [0.25, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
            ),
            child: Row(children: [
              Transform.rotate(
                angle: 20 * math.pi,
                child: const FaIcon(FontAwesomeIcons.youtube, color: Colors.red, size: 56)
              ),
              SizedBox(width: spacingUnit(2)),
              RichText(text: const TextSpan(
                text: 'How to use the business feature?',
                children: [
                  TextSpan(
                    text: 'Tap here to Watch the tutorial on Youtube',
                    style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ]
              ))
            ]),
          ),

          /// PACKAGE PRICING AND PLAN LIST
          PricingCard(
            mainIcon: const VipIcon(),
            color: colorType('purple'),
            title: 'VIP Business',
            price: 20,
            desc: 'By simply sharing a QR code or promotional link, other users can immediately claim the available promo. This makes it easy to spread offers quickly and efficiently.'
          ),
          const VSpace(),

          PricingCard(
            mainIcon: const ProIcon(),
            color: colorType('blue'),
            title: 'Pro Business',
            price: 10,
            desc: 'For business people, they can place their advertisements (cubes) in communities and in locations that suit their business targets.'
          ),
          const VSpace(),

          PricingCard(
            mainIcon: const BasicIcon(),
            color: colorType('green'),
            title: 'Basic Business',
            price: 5,
            desc: 'Makes it easy for users to customize the appearance of the widget to match the style and theme of the community.'
          ),
          const VSpace(),

          PricingCard(
            mainIcon: const FreeIcon(),
            color: colorType('grey'),
            title: 'FREE Business',
            price: 0,
            desc: 'Users can easily access special offers directly through their gadgets.'
          ),
          const VSpace(),
        ]),
      )
    );
  }
}