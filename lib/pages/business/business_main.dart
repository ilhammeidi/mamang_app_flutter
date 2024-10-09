import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/business_controller.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/business/header.dart';
import 'package:mamang_app_flutter/ui/widgets/business/infographic_list.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/business_card.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';

class BusinessMain extends StatefulWidget {
  const BusinessMain({super.key});

  @override
  State<BusinessMain> createState() => _BusinessMainState();
}

class _BusinessMainState extends State<BusinessMain> {
  final ScrollController _scrollref = ScrollController();
  final businessController = Get.put(BusinessController());
  final double containerHeight = 150;
  
  bool _isFixed = false;

  @override
  void dispose() {
    _scrollref.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;

    _scrollref.addListener(() {
      setState(() {
        if(_scrollref.offset > 150) {
          _isFixed = true;
        } else {
          _isFixed = false;
        }
      });
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: BusinessHeader(isFixed: _isFixed),
      ),
      body: ListView(
        controller: _scrollref,
        children: [
          Container(
            height: containerHeight,
            decoration: BoxDecoration(
              gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: ClipPath(
                    clipper: RoundedClipPathTop(),
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    ),
                  )
                ),
                InfographicList(height: containerHeight,)
              ],
            ),
          ),
          const VSpace(),
          GetBuilder<BusinessController>(
            builder: (controller) {
              return GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(spacingUnit(1)),
                physics: const ClampingScrollPhysics(),
                itemCount: controller.myBusiness.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 270,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  Promotion item = controller.myBusiness[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/business/${item.id}');
                    },
                    child: BusinessCard(
                      id: item.id,
                      name: item.name,
                      thumb: item.thumb,
                      category: item.category,
                      verified: item.verified,
                      stared: item.stared,
                      type: item.type,
                      level: item.level
                    ),
                  );
                }
              );
            }
          ),
          const VSpaceBig()
        ],
      ),
    );
  }
}