import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class SliderInfoList extends StatelessWidget {
  const SliderInfoList({
    super.key,
    required this.thumb,
    required this.distance,
    required this.location,
    required this.userId}
  );

  final String thumb;
  final double distance;
  final String location;
  final int userId;

  final double cardWidth = 250;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _infoLocation(context),
          _infoPromotor(context),
          _infoQrCode(context),
          _infoReward(context),
          _infoCoporateAds(context),
        ]
      ),
    );
  }

  /// INFO LOCATION CARD
  Widget _infoLocation(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      width: cardWidth,
      child: PaperCard(
        content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: ThemeRadius.small,
              child: Image.network(thumb, width: 100, height: 100, fit: BoxFit.cover)
            ),
            SizedBox(width: spacingUnit(1)),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children:[
                  Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
                  const SizedBox(width: 4),
                  Text('Promo Location', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold))
                ]),
                const SizedBox(height: 4),
                Text('Distance: $distance - $location', textAlign: TextAlign.start,)
              ])
            )
          ]),
        )
      ),
    );
  }

  /// INFO PROMOTOR USER
  Widget _infoPromotor(BuildContext context) {
    User promotor = userList.firstWhere((item) => item.id == userId);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      width: cardWidth,
      child: PaperCard(
        content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(promotor.avatar),
            ),
            SizedBox(width: spacingUnit(1)),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(promotor.name, style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimaryContainer)),
                const SizedBox(height: 2),
                Text('Business Owner', style: ThemeText.caption.copyWith(color: Theme.of(context).colorScheme.outline)),
                const SizedBox(height: 4),
                const Row(children: [
                  Icon(Icons.message, color: Colors.green, size: 16),
                  Icon(Icons.qr_code, size: 16),
                  Icon(Icons.supervisor_account_sharp, size: 16),
                  Icon(Icons.copy, size: 16),
                ])
              ])
            )
          ]),
        )
      ),
    );
  }

  /// INFO QR CODE 
  Widget _infoQrCode(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      width: cardWidth,
      child: PaperCard(
        content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ClipRRect(
              child: Image.asset('assets/images/qrcode.webp', width: 100, height: 100, fit: BoxFit.fill)
            ),
            SizedBox(width: spacingUnit(1)),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Exchange Content', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimaryContainer)),
                const SizedBox(height: 4),
                const Text('Scan the QR Code to your friends who want trade the content.', textAlign: TextAlign.start,),
              ])
            )
          ]),
        )
      ),
    );
  }

  /// INFO REWARD
  Widget _infoReward(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      width: cardWidth,
      child: PaperCard(
        content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset('assets/images/gift.png', width: 100, height: 100, fit: BoxFit.fill),
            SizedBox(width: spacingUnit(1)),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Reward Info', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimaryContainer)),
                const SizedBox(height: 4),
                const Text('Claim your rewards in this promotion before it expired', textAlign: TextAlign.start,),
              ])
            )
          ]),
        )
      ),
    );
  }

  /// INFO SPONSOR
  Widget _infoCoporateAds(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
      width: cardWidth,
      child: PaperCard(
        content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(Icons.business_rounded, color: ThemePalette.primaryMain, size: 100),
            SizedBox(width: spacingUnit(1)),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Sponsor Ads', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimaryContainer)),
                const SizedBox(height: 4),
                const Text('Sponsor ads will be attached in this promo', textAlign: TextAlign.start,),
              ])
            )
          ]),
        )
      ),
    );
  }
}