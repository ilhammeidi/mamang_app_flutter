import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/options.dart';
import 'package:mamang_app_flutter/ui/widgets/stepper/step_progress.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/review.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String _paymentMethod = '';

  void setPaymentMethod(val) {
    setState(() {
      _paymentMethod = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

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
      body: Column(children: [
        const StepProgress(activeIndex: 0, items: ['Choose', 'Detail', 'Done'],),
        const PaymentReview(),

        /// PAYMENT OPTIONS
        Expanded(child: PaymentOptions(
          paymentMethod: _paymentMethod,
          setPaymentMethod: setPaymentMethod,
        )),

        /// BUTTON ACTION
        Container(
          color: colorScheme.surface,
          padding: EdgeInsets.all(spacingUnit(2)),
          child: Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ThemeButton.btnBig.merge(ThemeButton.outlinedPrimary(context)),
                  child: const Text('Back')
                ),
              ),
              SizedBox(width: spacingUnit(1)),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    Get.toNamed('/payment/$_paymentMethod');
                  },
                  style: ThemeButton.btnBig.merge(ThemeButton.tonalPrimary(context)),
                  child: const Text('Continue')
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}