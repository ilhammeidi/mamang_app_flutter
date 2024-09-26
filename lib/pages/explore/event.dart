import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/events.dart';
import 'package:mamang_app_flutter/ui/widgets/event/event_list.dart';

class RecommendedEvent extends StatelessWidget {
  const RecommendedEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Event> events = [
      eventList[7],
      eventList[8],
      eventList[9],
      eventList[10],
      eventList[11],
      eventList[12],
    ];
  
    return EventList(
      items: events,
      title: 'Recomended Event',
      desc: 'Unlock Exclusive Content with Promotion!'
    );
  }
}

class TopEvent extends StatelessWidget {
  const TopEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Event> events = [
      eventList[13],
      eventList[14],
      eventList[15],
      eventList[16],
      eventList[17],
      eventList[18],
    ];
  
    return EventList(
      items: events,
      title: 'Top Event',
      desc: 'Claim Your Offer Before It\'s Gone!'
    );
  }
}