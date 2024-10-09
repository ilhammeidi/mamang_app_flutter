import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard({
    super.key,
    required this.date,
  });

  final String date;

  final double _radius = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Stack(alignment: Alignment.center, children: [
        Column(children: [
          /// BARCODE AND PROMO CODE
          Container(
            height: 350,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_radius),
                topRight: Radius.circular(_radius),
              ),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text('Promo Code:', style: ThemeText.subtitle.copyWith(color: Colors.black)),
              Container(
                padding: EdgeInsets.symmetric(vertical: spacingUnit(1), horizontal: spacingUnit(2)),
                decoration: BoxDecoration(
                  color: Colors.cyan[50],
                  borderRadius: ThemeRadius.medium,
                ),
                child: Text('012EASB7', style: ThemeText.title.copyWith(color: Colors.black, fontWeight: FontWeight.bold,))
              ),
              SizedBox(
                width: 230,
                height: 230,
                child: Image.asset('assets/images/qrcode.jpg', fit: BoxFit.contain)
              ),
            ])
          ),
      
          /// THUMBNAIL AND DESCRIPTIONS
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(_radius),
                bottomRight: Radius.circular(_radius),
              )
            ),
            child: Column(children: [
              /// PERIODE
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacingUnit(3), vertical: spacingUnit(2)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Periode: $date', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                ]),
              ),

              /// THUMBNAIL
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(ImgApi.photo[2]), fit: BoxFit.cover)
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 120),
                    padding: EdgeInsets.only(
                      top: spacingUnit(2),
                      left: spacingUnit(2),
                      right: spacingUnit(2),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(_radius))
                    ),

                    /// TEXT CONTENT
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Baby Sushi Special Discount 20%', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
                      const SizedBox(height: 4),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children:[
                        Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
                        const SizedBox(width: 4),
                        const Text('21 Arkansas Alley', style: TextStyle(color: Colors.black),)
                      ]),
                      const SizedBox(height: 16),
                      const Text(
                        'Suspendisse potenti. Cras in vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
                        style: TextStyle(color: Colors.black),
                        maxLines: 3,
                        overflow: TextOverflow.clip,
                      ),
                    ],)
                  ),
                ),
              ),
              const SizedBox(height: 30)
            ]),
          )
        ]),
        const CutDeco(),
      ]),
    );
  }
}

class CutDeco extends StatelessWidget {
  const CutDeco({super.key});

  @override
  Widget build(BuildContext context) {
    Color cutColor = ThemePalette.primaryDark;

    return SizedBox(
      width: double.infinity,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          width: 15,
          height: 30,
          decoration: BoxDecoration(
            color: cutColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )
          ),
            
        ),
        Expanded(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrains) {
            return Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                (constrains.constrainWidth()/15).floor(),
                (index) => SizedBox(
                  width: 5, height: 2,
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: cutColor,
                  ))
                )
              ),
            );
          },
        )),
        Container(
          width: 15,
          height: 30,
          decoration: BoxDecoration(
            color: cutColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            )
          ),
            
        ),
      ]),
    );
  }
}
