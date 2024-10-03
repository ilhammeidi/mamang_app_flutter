import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';

class PremiumSlider extends StatefulWidget {
  const PremiumSlider({super.key});

  @override
  State<PremiumSlider> createState() => _PremiumSliderState();
}

class _PremiumSliderState extends State<PremiumSlider> {
  final List<String> imgList = [
    ImgApi.photo[4],
    ImgApi.photo[13],
    ImgApi.photo[24],
    ImgApi.photo[99],
    ImgApi.photo[83],
  ];

  int _current = 0;
  final CarouselSliderController _sliderRef = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = imgList.asMap().entries.map((entry) {
      String item = entry.value;
      int index = entry.key + 1;

      return GestureDetector(
        onTap: () {
          Get.toNamed('/promos/$index');
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000),
            ],
          )
        ),
      );
    }).toList();
  
    return Column(children: [
      /// TITLE
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: 'Recomended for you',
          textAction: 'See All',
          onTap: () {
            Get.toNamed('/promos', arguments: 'education');
          }
        ),
      ),
      const VSpaceShort(),
      
      /// CAROUSEL SLIDER IMAGES
      SizedBox(
        height: 160,
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _sliderRef,
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            initialPage: 0,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            pauseAutoPlayOnTouch: true,
            height: 160,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }
          )
        )
      ),

      /// SLIDER PAGINATION
      const VSpaceShort(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          int curSlide = entry.key;
          return GestureDetector(
            onTap: () => _sliderRef.animateToPage(curSlide),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: _current == curSlide ? 30 : 12,
              height: 12.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.big,
                color: ThemePalette.secondaryMain.withOpacity(_current == curSlide ? 0.9 : 0.2)),
            )
          );
        }).toList(),
      )
    ]);
  }
}