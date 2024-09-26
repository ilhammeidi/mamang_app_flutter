import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/events.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/event_card.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_action.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class EventList extends StatelessWidget {
  const EventList({super.key, required this.items, required this.title, this.desc});

  final List items;
  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 280;
    
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
        child: TitleAction(
          title: title,
          desc: desc,
          textAction: 'See All',
          onTap: () {
            Get.toNamed('/explore');
          }
        ),
      ),
      const VSpaceShort(),
      SizedBox(
        height: cardHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: ((context, index) {
            Event item = items[index];
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 4 : 0),
              child: Column(children: [
                SizedBox(width: 300, height: cardHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: EventCard(
                      thumb: item.thumb,
                      title: item.title,
                      liked: item.liked,
                      point: item.point,
                      time: item.date,
                    ),
                  )
                ),
              ]),
            );
          }),
        ),
      )
    ]);
  }
}