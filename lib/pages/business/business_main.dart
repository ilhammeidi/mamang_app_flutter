import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/business_controller.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/business/header.dart';
import 'package:mamang_app_flutter/ui/widgets/business/infographic_list.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/business_card.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/fadded_bottom_header.dart';
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: isDark ? ThemePalette.gradientMixedDark : ThemePalette.gradientMixedMain
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(0),
                    controller: _scrollref,
                    children: [
                      SizedBox(
                        height: containerHeight,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            /// CURVE DECORATION
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Column(
                                children: [
                                  ClipPath(
                                    clipper: RoundedClipPathTop(),
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: colorScheme.surfaceContainerLowest,
                                      )
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: colorScheme.surfaceContainerLowest,
                                      boxShadow: [BoxShadow(
                                        color: colorScheme.surfaceContainerLowest,
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                        offset: const Offset(0, -5),
                                      )],
                                    )
                                  )
                                ],
                              )
                            ),
                            /// INFOGRAPHIC STATS
                            InfographicList(height: containerHeight)
                          ],
                        ),
                      ),

                      /// BUSINESS ITEMS
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerLowest
                        ),
                        child: GetBuilder<BusinessController>(
                          builder: (controller) {
                            return GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(spacingUnit(1)),
                              physics: const ClampingScrollPhysics(),
                              itemCount: controller.myBusiness.length,
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisExtent: 280,
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
                      ),
                      const VSpaceBig()
                    ],
                  ),
                  Positioned(
                    top: 0,
                    child: Opacity(
                      opacity: _isFixed ? 1 : 0,
                      child: const FadedBottomHeader()
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}