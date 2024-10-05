import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/events.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_list_slider.dart';

class LatestEvent extends StatelessWidget {
  const LatestEvent({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Event> latestEvent = [
      eventList[1],
      eventList[2],
      eventList[3],
      eventList[4],
      eventList[5],
      eventList[6],
    ];
  
    return EventListSlider(
      items: latestEvent,
      title: 'Latest Event'
    );
  }
}