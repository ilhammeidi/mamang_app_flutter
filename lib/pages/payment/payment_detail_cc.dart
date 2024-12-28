import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/credit_card_info.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/identity_form.dart';
import 'package:mamang_app_flutter/ui/widgets/stepper/step_progress.dart';

class PaymentDetailCC extends StatelessWidget {
  const PaymentDetailCC({super.key});

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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Get.toNamed('/faq');
            },
          )
        ],
        centerTitle: false,
        title: const Text('Payment'),
      ),
      body: Column(children: [
        const StepProgress(activeIndex: 1, items: ['Choose', 'Detail', 'Done'],),
        Padding(
          padding: EdgeInsets.all(spacingUnit(2)),
          child: const CreditCardInfo(),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(spacingUnit(2)),
            child: const IdentityForm()
          ),
        ),
        Container(
          color: colorScheme.surface,
          padding: EdgeInsets.all(spacingUnit(2)),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Total Including tax 12%: ', style: ThemeText.paragraph.copyWith(color: colorScheme.onSurfaceVariant)),
                Text('\$24.00', style: ThemeText.title2.copyWith(color: ThemePalette.primaryMain, fontWeight: FontWeight.bold),),
              ]),
              SizedBox(height: spacingUnit(1)),
              Row(
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
                        Get.toNamed('/payment/status');
                      },
                      style: ThemeButton.btnBig.merge(ThemeButton.tonalPrimary(context)),
                      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(Icons.lock_outline),
                        SizedBox(width: 4),
                        Text('Secure Pay')
                      ])
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ])
    );
  }
}