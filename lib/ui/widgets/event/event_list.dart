import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/events.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/event_card.dart';

class EventList extends StatelessWidget {
  const EventList({super.key, required this.items, this.isHome = false});

  final List<Event> items;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.only(top: spacingUnit(2), left: spacingUnit(2), right: spacingUnit(2), bottom: isHome ? 100 : spacingUnit(1)),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        Event item = items[index];
        return Padding(
          padding: EdgeInsets.only(bottom: spacingUnit(1)),
          child: EventCard(
            thumb: item.thumb,
            title: item.title,
            liked: item.liked,
            point: item.point,
            time: item.date,
            onTap: () {
              Get.toNamed('/events/${item.id}');
            },
          ),
        );
      },
    );
  }
}