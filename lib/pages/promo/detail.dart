import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/all_promo_controller.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';

class PromoDetail extends StatefulWidget {
  const PromoDetail({super.key});

  @override
  State<PromoDetail> createState() => _PromoDetailState();
}

class _PromoDetailState extends State<PromoDetail> {
  final controller = Get.put(AllPromoController());

  String id = Get.parameters['id'] ?? '';

  @override
  void initState() {
    fetchDetail(id);
    super.initState();
  }

  Future<void> fetchDetail(val) async {
    int promoId = int.parse(id);
    controller.getPromo(promoId);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    // String category = controller.selectedPromo.value.category;
    // var getCategory = categoryList.firstWhere((item) => item.id == category);
    var type = controller.selectedPromo.value.type;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24,),
          onPressed: () {
            Get.back();
          }
        ),
        leadingWidth: 30,
        title: Text(
          '#123456${controller.selectedPromo.value.id.toString()}',
          style: const TextStyle(color: Colors.white)
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surface,
                shadowColor: Colors.grey.withOpacity(0.5),
                elevation: 3
              ),
              onPressed: () {}, 
              icon: Icon(controller.selectedPromo.value.liked == true ? Icons.favorite : Icons.favorite_border_outlined, color: ThemePalette.tertiaryMain)
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            floating: false,
            pinned: true,
            expandedHeight: 240,
            collapsedHeight: 0,
            toolbarHeight: 0,
            automaticallyImplyLeading: false,
            backgroundColor: colorType(type),
            /// IMAGE COVER
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.network(
            //     controller.selectedPromo.value.thumb,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  controller.selectedPromo.value.thumb,
                  fit: BoxFit.cover
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      ),
                    ),
                  ) 
                )
              ]
            ),
            /// ROUNDED BOTTOM DECORATION
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  color: colorType(type),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    )
                  ),
                ),
              ),
            )
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1300,
              color: Colors.purple,
              child: Obx(() => controller.isNotFound.value ? const Text('Not Found') : const Text('Found')),
            ),
          )
        ],
      ),
    );
  }
}