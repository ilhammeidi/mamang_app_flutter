import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/stepper/step_progress.dart';

class PaymentDetailWallet extends StatelessWidget {
  const PaymentDetailWallet({super.key});

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
        const StepProgress(activeIndex: 1, items: ['Choose', 'Detail', 'Done'],),
        Column(children: [
          Padding(
            padding: EdgeInsets.all(spacingUnit(2)),
            child: PaperCard(
              flat: true,
              content: Padding(
                padding: EdgeInsets.all(spacingUnit(2)),
                child: Column(children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/logos/logo11.jpg'),
                  ),
                  SizedBox(height: spacingUnit(2),),
                  Text('Wallet ABC', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
                  const Text('Continue Payment with Wallet ABC', style: ThemeText.paragraph,)
                ]),
              )
            ),
          ),
        ]),
        Expanded(
          child: ListView(children: [
            const ListTile(
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text('Billing Ammount:'),
              trailing: Text('\$24.00', style: ThemeText.paragraph,),
            ),
            const LineList(),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Tax 12%:'),
              trailing: Text('\$2.88', style: ThemeText.paragraph,),
            ),
            const LineList(),
            ListTile(
              title: Text('Total:', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold),),
              trailing: Text('\$26.88', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold, color: ThemePalette.primaryMain),),
            ),
          ])
        ),
        Container(
          color: colorScheme.surface,
          padding: EdgeInsets.all(spacingUnit(2)),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('By continuing, you agree with the', style: ThemeText.caption,),
                Text(' Terms and Conditions', style: ThemeText.caption.copyWith(color: ThemePalette.primaryMain)),
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
                      onPressed: () {},
                      style: ThemeButton.btnBig.merge(ThemeButton.tonalPrimary(context)),
                      child: const Text('Open Wallet App')
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