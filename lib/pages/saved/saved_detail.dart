import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/saved_promo_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/map_banner.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/scan_qr_step.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/summary_info.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/working_time.dart';
import 'package:mamang_app_flutter/ui/widgets/review/review_button.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/saved_not_found.dart';

class SavedDetail extends StatefulWidget {
  const SavedDetail({super.key});

  @override
  State<SavedDetail> createState() => _SavedDetailState();
}

class _SavedDetailState extends State<SavedDetail> {
  final controller = Get.put(SavedPromoController());

  String id = Get.parameters['id'] ?? '';

  @override
  void initState() {
    fetchDetail();
    super.initState();
  }

  Future<void> fetchDetail() async {
    int promoId = int.parse(id);
    controller.getPromo(promoId);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle iconBtn = IconButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 3
    );
  
    return controller.isNotFound.value ? const SavedNotFound() : Scaffold(
      body: CustomScrollView(
        slivers: [
          /// MAP BANNER
          SliverToBoxAdapter(child: Stack(
            children: [
              const MapBanner(),
              Positioned(
                top: spacingUnit(1),
                left: spacingUnit(1),
                child: IconButton(
                  onPressed: () {
                    Get.offAndToNamed('/saved');
                  },
                  style: iconBtn,
                  icon: const Icon(Icons.arrow_back_ios_new, size: 22),
                )
              )
            ],
          )),
          SliverStickyHeader.builder(
            builder: (context, state) {
              /// STICKY HEADER SCROLL
              return Container(
                padding: EdgeInsets.all(spacingUnit(1)),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: state.isPinned ? Row(children: [
                  IconButton(
                    onPressed: () {
                      Get.offAndToNamed('/saved');
                    },
                    icon: const Icon(Icons.arrow_back_ios, size: 22),
                  ),
                  SizedBox(width: spacingUnit(1)),
                  Expanded(
                    child: Obx(() => Text(
                      controller.selectedPromo.value.name.toCapitalCase(),
                      style: ThemeText.subtitle,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start)
                    ),
                  ),
                ]) : Container(),
              );
            },

            /// THE REST INFORMATIONS AND DETAILS
            sliver: SliverList(delegate: SliverChildListDelegate([
              GetBuilder<SavedPromoController>(
                builder: (controller) {
                  var item = controller.selectedPromo.value;
                  /// SUMMARY INFO
                  return SummaryInfo(
                    id: item.id,
                    title: item.name,
                    category: item.category,
                    location: item.location,
                    thumb: item.thumb
                  );
                }
              ),
              const VSpaceShort(),
              const WorkingTime(),
              const VSpaceShort(),
              const ReviewButton(),
              const VSpaceShort(),
              const ScanQrStep(),
              const VSpace(),
            ])),
          )
        ],
      )
    );
  }
}