import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/shimmer_preloader.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/detail_owner.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/detail_qr.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/detail_rewards.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/detail_sponsor.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/detail_thumb_location.dart';

class SliderInfoList extends StatelessWidget {
  const SliderInfoList({
    super.key,
    required this.thumb,
    required this.name,
    required this.desc,
    required this.distance,
    required this.location,
    required this.userId,
  });

  final String thumb;
  final String name;
  final String desc;
  final double distance;
  final String location;
  final int userId;

  final double cardWidth = 300;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
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
      margin: EdgeInsets.all(spacingUnit(1)),
      width: cardWidth,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Wrap(
                children: [
                  DetailThumbLocation(
                    thumb: thumb,
                    distance: distance,
                    location: location,
                    title: name,
                    desc: desc
                  )
                ]
              );
            }
          );
        },
        child: PaperCard(
          content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              ClipRRect(
                borderRadius: ThemeRadius.small,
                child: Image.network(
                  thumb,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      width: 100,
                      height: 100,
                      child: ShimmerPreloader()
                    );
                  },
                )
              ),
              SizedBox(width: spacingUnit(1)),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children:[
                    Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
                    const SizedBox(width: 4),
                    Text('Location', overflow: TextOverflow.ellipsis, maxLines: 3, style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w700))
                  ]),
                  const SizedBox(height: 4),
                  Text('Distance: $distance m - $location', textAlign: TextAlign.start,)
                ])
              )
            ]),
          )
        ),
      ),
    );
  }

  /// INFO PROMOTOR USER
  Widget _infoPromotor(BuildContext context) {
    User promotor = userList.firstWhere((item) => item.id == userId);

    return Container(
      margin: EdgeInsets.all(spacingUnit(1)),
      width: cardWidth,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (context) {
              return Wrap(
                children: [
                  DetailOwner(avatar: promotor.avatar, name: promotor.name)
                ]
              );
            },
          );
        },
        child: PaperCard(
          content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(
                    promotor.avatar,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        width: 80,
                        height: 80,
                        child: ShimmerPreloader()
                      );
                    }
                  ),
                ),
              ),
              SizedBox(width: spacingUnit(2)),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(promotor.name, style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onPrimaryContainer)),
                  const SizedBox(height: 2),
                  Text('Business Owner', style: ThemeText.caption.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 4),
                  const Row(children: [
                    FaIcon(FontAwesomeIcons.whatsapp, color: Colors.lightGreen, size: 16),
                    SizedBox(width: 20),
                    Icon(Icons.qr_code, size: 16),
                    SizedBox(width: 20),
                    Icon(Icons.supervisor_account_sharp, size: 16),
                    SizedBox(width: 20),
                    Icon(Icons.copy, size: 16),
                  ])
                ])
              )
            ]),
          )
        ),
      ),
    );
  }

  /// INFO QR CODE 
  Widget _infoQrCode(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(spacingUnit(1)),
      width: cardWidth,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const Wrap(
                children: [
                  DetailQr()
                ]
              );
            }
          );
        },
        child: PaperCard(
          content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              ClipRRect(
                child: Image.asset('assets/images/qrcode.jpg', width: 80, fit: BoxFit.fill)
              ),
              SizedBox(width: spacingUnit(1)),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Exchange', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  const Text('Scan the QR Code to your friends who want trade the content.', style: ThemeText.caption, textAlign: TextAlign.start,),
                ])
              )
            ]),
          )
        ),
      ),
    );
  }

  /// INFO REWARD
  Widget _infoReward(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(spacingUnit(1)),
      width: cardWidth,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const Wrap(
                children: [
                  DetailRewards()
                ]
              );
            }
          );
        },
        child: PaperCard(
          content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset('assets/images/gift.png', height: 100, fit: BoxFit.fill),
              SizedBox(width: spacingUnit(1)),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Reward Info', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  const Text('Claim your rewards before it expired', style: ThemeText.caption, textAlign: TextAlign.start,),
                ])
              )
            ]),
          )
        ),
      ),
    );
  }

  /// INFO SPONSOR
  Widget _infoCoporateAds(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(spacingUnit(1)),
      width: cardWidth,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Wrap(
                children: [
                  DetailSponsor(
                    thumb: ImgApi.photo[72],
                    distance: distance,
                    location: location,
                    title: name,
                    desc: desc
                  )
                ]
              );
            }
          );
        },
        child: PaperCard(
          content: Padding(padding: EdgeInsets.all(spacingUnit(1)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.business_rounded, color: ThemePalette.primaryMain, size: 100),
              SizedBox(width: spacingUnit(1)),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Sponsor Ads', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  const Text('Sponsor ads will be attached in this promo', style: ThemeText.caption, textAlign: TextAlign.start,),
                ])
              )
            ]),
          )
        ),
      ),
    );
  }
}