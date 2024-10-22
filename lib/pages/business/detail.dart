import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/all_promo_controller.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/action_header/like_btn.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_not_found.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/fadded_bottom_header.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/coloured_box_detail.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/parallax_cover.dart';
import 'package:mamang_app_flutter/ui/widgets/business/settings/promo_settings_main.dart';

class BusinessDetail extends StatefulWidget {
  const BusinessDetail({super.key});

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {
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
    var type = controller.selectedPromo.value.type;

    return controller.isNotFound.value ? const BusinessNotFound() : Scaffold(
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
        titleSpacing: 0,
        title: Text(
          '#123456${controller.selectedPromo.value.id.toString()}',
          style: const TextStyle(color: Colors.white)
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
            child: LikeBtn(hasBg: true, isLiked: controller.selectedPromo.value.liked == true)
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
                  color: colorScheme.surfaceContainerLowest,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [BoxShadow(
                    color: colorScheme.surfaceContainerLowest,
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0, 2),
                  )],
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
                    owned: true,
                    level: item.level,
                    xp: item.xp,
                    location: item.location,
                    distance: item.distance,
                    category: item.category,
                  );
                }
              ),
              const VSpaceShort(),
              const PromoSettings(),
              const VSpace(),
            ]))
          ),
        ],
      ),
    );
  }
}
