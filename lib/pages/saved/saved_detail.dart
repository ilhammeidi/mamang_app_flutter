import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/saved_promo_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/map_info.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/scan_qr_step.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/working_time.dart';

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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle iconBtn = IconButton.styleFrom(
      padding: const EdgeInsets.all(0),
      backgroundColor: Theme.of(context).colorScheme.surface,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 3
    );
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: GetBuilder<SavedPromoController>(
              builder: (controller) {
                var item = controller.selectedPromo.value;
                return MapInfo(
                  title: item.name,
                  category: item.category,
                  location: item.location,
                  thumb: item.thumb
                );
              }
            ),
          ),
          SliverStickyHeader.builder(
            builder: (context, state) {
              /// STICKY SCROLL
              return Container(
                padding: EdgeInsets.all(spacingUnit(1)),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Row(children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: iconBtn,
                    icon: const Icon(Icons.arrow_back_ios, size: 22),
                  ),
                  SizedBox(width: spacingUnit(1)),
                  Obx(() => Text(controller.selectedPromo.value.name.toCapitalCase(), textAlign: TextAlign.start)),
                ],),
              );
            },
            sliver: SliverList(delegate: SliverChildListDelegate([
              // const VSpace(),
              // const WorkingTime(),
              // const VSpace(),
              // const ScanQrStep(),
              // const VSpace(),
              Container(
                height: 1300,
                color: Colors.blue,
              )
            ])),
          )
        ],
      )
    );
  }
}