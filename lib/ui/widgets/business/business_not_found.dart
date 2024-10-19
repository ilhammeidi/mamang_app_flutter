import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/utils/no_data.dart';

class BusinessNotFound extends StatelessWidget {
  const BusinessNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return NoData(
      image: 'assets/images/business.png',
      bgColor: Colors.orange,
      title: 'Business Not Found',
      desc: 'Your Business may has been deleted',
      primaryTxtBtn: 'Go to Business Page',
      secondaryTxtBtn: 'Go to homepage',
      primaryAction: () {
        Get.toNamed('/business');
      },
      secondaryAction: () {
        Get.toNamed('/');
      },
    );
  }
}