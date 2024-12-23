import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/options.dart';
import 'package:mamang_app_flutter/ui/widgets/stepper/step_progress.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/review.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        centerTitle: false,
        title: const Text('Payment'),
      ),
      body: const SingleChildScrollView(
        child: Column(children: [
          StepProgress(activeIndex: 1, items: ['Choose', 'Detail', 'Done'],),
          PaymentReview(),
          SizedBox(height: 16),
          PaymentOptions(),
          SizedBox(height: 1000)
        ]),
      ),
    );
  }
}