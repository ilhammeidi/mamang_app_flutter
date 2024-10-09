import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';

class DetailThumbLocation extends StatelessWidget {
  const DetailThumbLocation({
    super.key,
    required this.thumb,
    required this.distance,
    required this.location,
    required this.title,
    required this.desc,
  });

  final String thumb;
  final double distance;
  final String location; 
  final String title; 
  final String desc; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(children: [
        const GrabberIcon(),
        const VSpace(),
        
        Column(children: [
          /// THUMBNAIL
          ClipRRect(
            borderRadius: ThemeRadius.medium,
            child: Image.network(thumb, width: double.infinity, fit: BoxFit.contain)
          ),
          const VSpace(),

          /// DESCRIPTION
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// LOCATION INFO
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children:[
                      Icon(Icons.location_on, size: 22, color: ThemePalette.tertiaryMain),
                      const SizedBox(width: 4),
                      const Text('Promo Location', style: ThemeText.title2)
                    ]),
                    const SizedBox(height: 4),
                    Text('Distance: $distance m - $location', style: ThemeText.subtitle, textAlign: TextAlign.start),
                  ],
                )
              ),
              SizedBox(width: spacingUnit(2)),
              SizedBox(
                width: 80,
                height: 80,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ThemeButton.btnSmall.merge(ThemeButton.outlinedSecondary(context)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(Icons.directions, size: 48),
                    Text('ROUTES', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold),)
                  ],)
                ),
              ),
            ]),
            const VSpaceBig(),
          
            /// QR CODE
            Center(child: Text('QR Code Promo', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold))),
            Center(
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.asset('assets/images/qrcode.webp', fit: BoxFit.contain)
              ),
            ),
          ]),
        ])
      ]),
    );
  }
}