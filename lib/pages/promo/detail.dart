import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/all_promo_controller.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/models/promos.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/box_color.dart';
import 'package:mamang_app_flutter/ui/widgets/action_header/like_btn.dart';
import 'package:mamang_app_flutter/ui/widgets/action_header/other_btn.dart';
import 'package:mamang_app_flutter/ui/widgets/action_header/share_btn.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/fadded_bottom_header.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/bottom_action_save_promo.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/coloured_box_detail.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/description_detail.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/parallax_cover.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list_single.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_not_found.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/sponsored_promo.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/working_time.dart';

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
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var type = controller.selectedPromo.value.type;

    final List<Promotion> relatedPromo = [
      promoList[1],
      promoList[22],
      promoList[44],
      promoList[66],
      promoList[77],
      promoList[88],
      promoList[99],
      promoList[3],
      promoList[33],
      promoList[59],
    ];
    
    return controller.isNotFound.value ? const PromoNotFound() : Scaffold(
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
          const ShareBtn(invert: true),
          LikeBtn(isLiked: controller.selectedPromo.value.liked == true, invert: true,),
          const OtherBtn(invert: true,),
        ],
      ),
      bottomNavigationBar: const BottomActionSavePromo(),
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
              /// BOX COLOURED
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
                    category: item.category,
                  );
                }
              ),
              const VSpaceShort(),

              /// WORKING TIME
              const WorkingTime(),
              const VSpace(),

              /// DESCRIPTION
              GetBuilder<AllPromoController>(
                builder: (controller) {
                  Promotion item = controller.selectedPromo.value;
                  return DescriptionDetail(
                    id: item.id,
                    desc: item.desc,
                    type: item.type,
                    category: item.category,
                    rating: item.stared
                  );
                }
              ),
              const VSpace(),

              /// SPONSORED PROMO
              SponsoredPromo(image: ImgApi.photo[72]),
              const VSpaceBig(),

              /// RELATED PROMO
              PromoListSingle(items: relatedPromo, title: "Related Promo"),
              const VSpace()
            ]))
          ),
        ],
      ),
    );
  }
}
