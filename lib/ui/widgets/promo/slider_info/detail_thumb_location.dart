import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView(children: [
              /// TEXT TITLE DESCRIPTION
              Text(title.toCapitalCase(), textAlign: TextAlign.start, style: ThemeText.title.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: spacingUnit(1)),
              Text(desc, textAlign: TextAlign.start, style: ThemeText.subtitle),
              const VSpace(),

              /// LOCATION INFO
              Row(mainAxisAlignment: MainAxisAlignment.start, children:[
                Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
                const SizedBox(width: 4),
                Text('Promo Location', style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold))
              ]),
              const SizedBox(height: 4),
              Text('Distance: $distance m - $location', textAlign: TextAlign.start),
              const VSpace(),
            
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
          ),
        ])
      ]),
    );
  }
}