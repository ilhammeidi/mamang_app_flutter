import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/counter/counter_down.dart';
import 'package:mamang_app_flutter/ui/widgets/stepper/step_progress.dart';

class PaymentDetailVac extends StatelessWidget {
  const PaymentDetailVac({super.key});

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
        const Column(children: [
          /// TIMER
          VSpace(),
          Text('Time left:'),
          CounterDown(
            duration: Duration(
              days: 0,
              hours: 23,
              minutes: 30,
            ),
            format: CountDownTimerFormat.daysHoursMinutes
          ),
          VSpaceShort(),
          Text('Please finish your payment before 22 May 2025:17:45', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ]),
        const VSpaceShort(),

        /// DETAIL BANK ACCOUNT
        Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(spacingUnit(2)),
            children: [
              PaperCard(
                flat: true,
                content: Padding(
                  padding: EdgeInsets.all(spacingUnit(2)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Center(child: Image.asset('assets/images/logos/logo2.png', height: 50,)),
                    const VSpace(),
                    const Text('Virtual Account Number'),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('098765432112345', style: ThemeText.title.copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(width: spacingUnit(1)),
                      IconButton(icon: const Icon(Icons.copy), onPressed: () {})
                    ]),
                    const VSpaceShort(),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Text('Total amount + tax 12%: ', style: ThemeText.paragraph.copyWith(color: colorScheme.onSurfaceVariant)),
                      Text('\$24.00', style: ThemeText.title2.copyWith(color: ThemePalette.primaryMain, fontWeight: FontWeight.bold),),
                    ]),
                  ]),
                )
              ),
              const VSpace(),
              AppInputBox(content: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(Icons.help_outline, color: ThemePalette.primaryMain),
                title: Text('Need guide for this transfer method?', style: TextStyle(color: ThemePalette.primaryMain)),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  showModalBottomSheet<dynamic>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Wrap(
                        children: [
                          _helpInfo(context)
                        ]
                      );
                    }
                  );
                },
              ))
            ],
          ),
        ),

        /// ACTION BUTTON
        Padding(
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
                      child: const Text('Confirm Transfer')
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

  Widget _helpInfo(BuildContext context) {
    return ListView(padding: EdgeInsets.all(spacingUnit(2)), shrinkWrap: true, primary: true, children: [
      const VSpaceShort(),
      Text('Payment Guide', textAlign: TextAlign.center, style: ThemeText.subtitle2.copyWith(fontWeight: FontWeight.bold)),
      const VSpaceShort(),
      const ListTile(
        leading: Text('1', style: ThemeText.subtitle),
        title: Text('Log in to the mobile banking application, internet banking, or ATM.')
      ),
      const ListTile(
        leading: Text('2', style: ThemeText.subtitle),
        title: Text('Select the "Transfer to Virtual Account" menu.')
      ),
      const ListTile(
        leading: Text('3', style: ThemeText.subtitle),
        title: Text('Enter the virtual account number.')
      ),
      const ListTile(
        leading: Text('4', style: ThemeText.subtitle),
        title: Text('Please verify the amount. The amount must be same as in application.')
      ),
      const ListTile(
        leading: Text('5', style: ThemeText.subtitle),
        title: Text('Complete the transfer process until successful. Save proof of transfer if necessary.')
      ),
      const ListTile(
        leading: Text('6', style: ThemeText.subtitle),
        title: Text('Go back to the application, then select the "Confirm Payment" button.')
      ),
      const VSpace(),
      OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ThemeButton.btnBig.merge(ThemeButton.outlinedPrimary(context)),
        child: const Text('Understood')
      ),
    ]);
  }
}