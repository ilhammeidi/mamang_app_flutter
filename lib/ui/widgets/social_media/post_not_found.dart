import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/utils/no_data.dart';

class PostNotFound extends StatelessWidget {
  const PostNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return NoData(
      image: 'assets/images/grab.png',
      title: 'Sorry we couldn\'t find the updates',
      desc: 'Please go to updates page or back to the homepage',
      primaryTxtBtn: 'Go to Updates page',
      secondaryTxtBtn: 'Go to homepage',
      bgColor: Colors.lightGreen,
      primaryAction: () {
        Get.toNamed('/updates');
      },
      secondaryAction: () {
        Get.toNamed('/');
      },
    );
  }
}