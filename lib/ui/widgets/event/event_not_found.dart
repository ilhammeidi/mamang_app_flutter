import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/utils/no_data.dart';

class EventNotFound extends StatelessWidget {
  const EventNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return NoData(
      image: 'assets/images/event.png',
      title: 'Sorry we couldn\'t find the event',
      desc: 'Please go to another event or back to the homepage',
      primaryTxtBtn: 'Check out another events',
      secondaryTxtBtn: 'Go to homepage',
      primaryAction: () {
        Get.toNamed('/events');
      },
      secondaryAction: () {
        Get.toNamed('/');
      },
    );
  }
}