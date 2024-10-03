import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/all_promo_controller.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/coloured_box_detail.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/parallax_cover.dart';

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
        centerTitle: false,
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
            flexibleSpace: ParallaxCover(thumb: controller.selectedPromo.value.thumb),
            /// ROUNDED BOTTOM DECORATION
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )
                ),
              ),
            )
          ),
          SliverStickyHeader.builder(
            builder: (context, state) {
              return const FadedBottomHeader();
            },
            sliver: SliverList(delegate: SliverChildListDelegate([
              GetBuilder<AllPromoController>(
                builder: (controller) {
                  Promotion item = controller.selectedPromo.value;
                  return ColouredBoxDetail(
                    type: item.type, 
                    title: item.name, 
                    userId: item.userId,
                    desc: item.desc,
                    thumb: item.thumb,
                    verified: item.verified,
                    published: item.published,
                    owned: false,
                    level: item.level,
                    xp: item.xp,
                    location: item.location,
                    distance: item.distance,
                  );
                }
              ),
              const VSpace(),
              
              Container(
                height: 1300,
                color: Colors.white,
                child: Obx(() => controller.isNotFound.value ? const Text('Not Found') : const Text('Found')),
              )
            ]))
          ),
        ],
      ),
    );
  }
}


class FadedBottomHeader extends StatelessWidget {
  const FadedBottomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[colorScheme.surface, colorScheme.surface.withOpacity(0.5), colorScheme.surface.withOpacity(0)],
          stops: const [0.25, 0.5, 1.3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
    );
  }
}
