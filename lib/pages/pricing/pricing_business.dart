import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/animated_slide_horizontal.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/pricing_card.dart';
import 'package:mamang_app_flutter/ui/widgets/tab_menu/menu.dart';

class PricingBusiness extends StatefulWidget {
  const PricingBusiness({super.key});

  @override
  State<PricingBusiness> createState() => _PricingBusinessState();
}

class _PricingBusinessState extends State<PricingBusiness> {
  final String descVip = 'This makes it easy to spread offers quickly and efficiently.';
  final String descPro = 'For business people, they can place their advertisements';
  final String descBasic = 'Makes it easy for users to customize the appearance';
  final String descFree = 'Easily access special offers directly through their gadgets.';
  final List<String> features = ['Create ads', 'Coupon Creation', 'QR Code', 'Nearby Location Access', 'Community Members', 'Help center access', 'Phone & email support'];

  bool _startMonthly = true;
  bool _startYearly = false;
  int _current = 0;

  void _handleSwitch(int index) {
    setState(() {
      _current = index;
    });
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (index == 0) {
        setState(() {
          _startMonthly = true;
          _startYearly = false;
        });
      } else {
        setState(() {
          _startYearly = true;
          _startMonthly = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
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
                  style: ThemeText.paragraph.copyWith(color: Colors.black),
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
          const VSpaceShort(),

          /// PACKAGE PRICING AND PLAN LIST
          TabMenu(onSelect: _handleSwitch, current: _current, menus: const['Monthly', 'Yearly']),
          Expanded(
            child: _current == 0 ? _monthlyPrice(context) : _yearlyPrice(context),
          )
        ]),
      )
    );
  }

  /// MONTHLY PRICE LISTS
  Widget _monthlyPrice(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.all(spacingUnit(1)),
      children: [
        AnimatedSlideHorizontal(
        order: 0,
        start: _startMonthly,
        child: PricingCard(
          mainIcon: const VipIcon(),
          color: colorType('vip'),
          title: 'Diamond',
          price: 20,
          desc: descVip,
          features: features,
          enableIcons: const [true, true, true, true, true, true, true],
        ),
      ),
      const VSpaceShort(),

      AnimatedSlideHorizontal(
        order: 1,
        start: _startMonthly,
        child: PricingCard(
          mainIcon: const ProIcon(),
          color: colorType('gold'),
          title: 'Gold',
          price: 10,
          desc: descPro,
          features: features,
          enableIcons: const [true, true, true, true, true, false, false],
        ),
      ),
      const VSpaceShort(),

      AnimatedSlideHorizontal(
        order: 2,
        start: _startMonthly,
        child: PricingCard(
          mainIcon: const BasicIcon(),
          color: colorType('pro'),
          title: 'Basic',
          price: 5,
          desc: descBasic,
          features: features,
          enableIcons: const [true, true, true, true, false, false, false],
        ),
      ),
      const VSpaceShort(),

      AnimatedSlideHorizontal(
        order: 3,
        start: _startMonthly,
        child: PricingCard(
          mainIcon: const FreeIcon(),
          color: colorType('free'),
          title: 'FREE',
          price: 0,
          desc: descFree,
          features: features,
          enableIcons: const [true, true, false, false, false, false, false],
        ),
      ),
      const VSpaceShort(),
    ]);
  }

  /// YEARLY PRICE LISTS
  Widget _yearlyPrice(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.all(spacingUnit(1)),
      children: [
        AnimatedSlideHorizontal(
        order: 0,
        start: _startYearly,
        child: PricingCard(
          mainIcon: const VipIcon(),
          color: colorType('vip'),
          title: 'Diamond',
          price: 200,
          desc: descVip,
          features: features,
          enableIcons: const [true, true, true, true, true, true, true],
        ),
      ),
      const VSpaceShort(),

      AnimatedSlideHorizontal(
        order: 1,
        start: _startYearly,
        child: PricingCard(
          mainIcon: const ProIcon(),
          color: colorType('gold'),
          title: 'Gold',
          price: 100,
          desc: descPro,
          features: features,
          enableIcons: const [true, true, true, true, true, false, false],
        ),
      ),
      const VSpaceShort(),

      AnimatedSlideHorizontal(
        order: 2,
        start: _startYearly,
        child: PricingCard(
          mainIcon: const BasicIcon(),
          color: colorType('pro'),
          title: 'Basic',
          price: 50,
          desc: descBasic,
          features: features,
          enableIcons: const [true, true, true, true, false, false, false],
        ),
      ),
      const VSpaceShort(),

      AnimatedSlideHorizontal(
        order: 3,
        start: _startYearly,
        child: PricingCard(
          mainIcon: const FreeIcon(),
          color: colorType('free'),
          title: 'FREE',
          price: 0,
          desc: descFree,
          features: features,
          enableIcons: const [true, true, false, false, false, false, false],
        ),
      ),
      const VSpace(),
    ]);
  }
}