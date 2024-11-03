import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/all_promo_controller.dart';
import 'package:mamang_app_flutter/controllers/event_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_desc.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_not_found.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/promo_list.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({
    super.key,
  });

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  final controller = Get.put(EventController());
  final ScrollController _scrollref = ScrollController();

  String id = Get.parameters['id'] ?? '';

  bool _isFixed = false;

  @override
  void initState() {
    if (id != '') {
      fetchDetail(id);
    }
    super.initState();
  }

  Future<void> fetchDetail(val) async {
    controller.getEvent(id);
  }

  @override
  void dispose() {
    _scrollref.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scrollref.addListener(() {
      setState(() {
        if(_scrollref.offset > 100) {
          _isFixed = true;
        } else {
          _isFixed = false;
        }
      });
    });
  
    return controller.isNotFound.value ? const EventNotFound() : Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        forceMaterialTransparency: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        centerTitle: false,
        titleSpacing: 0,
        /// TITLE
        title: Obx(() => AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(_isFixed ? 1 : 0)),
          child: Text(
            controller.selectedEvent.value.title,
            overflow: TextOverflow.ellipsis,
            style: ThemeText.subtitle2,
          ),
        )),
        actions: [
          // POINT
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: ThemeRadius.medium
            ),
            child: Obx(() => Text('${controller.selectedEvent.value.point} POINT', style: ThemeText.caption.copyWith(fontWeight: FontWeight.w700)))
          ),
          SizedBox(width: spacingUnit(1)),
          /// LIKED
          Padding(
            padding: EdgeInsets.only(right: spacingUnit(1)),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [ThemeShade.shadeMedium(context)],
                shape: BoxShape.circle,
              ),
              child: Obx(() => Icon(
                controller.selectedEvent.value.liked ? Icons.favorite : Icons.favorite_border_outlined,
                size: 16,
                color: ThemePalette.tertiaryMain
              )),
            ),
          ),
        ],
      ),
      body: GetBuilder<EventController>(
        builder: (controller) {
          return ListView(
            controller: _scrollref,
            children: [
              /// EVENT BANNER HERO AND DESCRIPTON
              EventDesc(
                title: controller.selectedEvent.value.title,
                desc: controller.selectedEvent.value.desc,
                thumb: controller.selectedEvent.value.thumb,
                clue1: controller.selectedEvent.value.clue1,
                clue2: controller.selectedEvent.value.clue2,
                clue3: controller.selectedEvent.value.clue3,
                date: controller.selectedEvent.value.date,
                point: controller.selectedEvent.value.point,
                liked: controller.selectedEvent.value.liked
              ),
              /// PROMO LIST OF THIS EVENT
              const LineSpace(),
              PromoWithEvent(filter: controller.selectedEvent.value.category)
            ]
          );
        }
      ),
    );
  }
}

class PromoWithEvent extends StatefulWidget {
  const PromoWithEvent({super.key, required this.filter});

  final String filter;

  @override
  State<PromoWithEvent> createState() => _PromoWithEventState();
}

class _PromoWithEventState extends State<PromoWithEvent> {
  final controller = Get.put(AllPromoController());

  @override
  void initState() {
    if (widget.filter != '')  {
      fetchPromoByFilter(widget.filter);
    }
    super.initState();
  }

  Future<void> fetchPromoByFilter(val) async {
    controller.filterByCategory(val);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
          child: Text(
            'Explore the best ${controller.filteredList.length} ${widget.filter} promo!',
            textAlign: TextAlign.start,
            style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.w700)
          ),
        ),
        const VSpace(),
        GetBuilder<AllPromoController>(
          builder: (controller) {
            return PromoList(items: controller.filteredList);
          },
        ),
      ],
    );
  }
}