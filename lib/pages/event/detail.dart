import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/controllers/event_controller.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_desc.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({
    super.key,
  });

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  final controller = Get.put(EventController());
  String id = Get.parameters['id'] ?? '';

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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leadingWidth: 40,
        leading: Padding(
          padding: EdgeInsets.only(left: spacingUnit(1)),
          child: IconButton(
            onPressed: () {
              Get.offAndToNamed('/events');
            },
            icon: const Icon(Icons.arrow_back_ios)
          ),
        ),
        centerTitle: false,
        /// TITLE
        title: Obx(() => Text(controller.selectedEvent.value.title, overflow: TextOverflow.ellipsis,)),
        actions: [
          // POINT
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: ThemeRadius.medium
            ),
            child: Obx(() => Text('${controller.selectedEvent.value.point} POINT', style: ThemeText.caption.copyWith(fontWeight: FontWeight.bold)))
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
      body: ListView(children: [
        GetBuilder<EventController>(
          builder: (controller) {
            return EventDesc(
              title: controller.selectedEvent.value.title,
              desc: controller.selectedEvent.value.desc,
              thumb: controller.selectedEvent.value.thumb,
              clue1: controller.selectedEvent.value.clue1,
              clue2: controller.selectedEvent.value.clue2,
              clue3: controller.selectedEvent.value.clue3,
              date: controller.selectedEvent.value.date,
              point: controller.selectedEvent.value.point,
              liked: controller.selectedEvent.value.liked
            );
          }
        )
      ])
    );
  }
}