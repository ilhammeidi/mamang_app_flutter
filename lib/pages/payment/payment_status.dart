import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/payment/review.dart';
import 'package:mamang_app_flutter/ui/widgets/stepper/step_progress.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

class PaymentStatus extends StatelessWidget {
  const PaymentStatus({super.key});

  Color statusColor(status) {
    switch(status) {
      case 'error':
        return Colors.red;
      case 'waiting':
        return Colors.orangeAccent;
      case 'success':
        return Colors.green;
      default:
        return Colors.transparent;
    }
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
        const StepProgress(activeIndex: 3, items: ['Choose', 'Detail', 'Done'],),
        
        /// PAYMENT STATUS
        Container(
          margin: EdgeInsets.all(spacingUnit(1)),
          padding: EdgeInsets.all(spacingUnit(2)),
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.small,
            color: statusColor('success')
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(Icons.check_circle_outline_sharp, color: Colors.white, size: 48),
                SizedBox(width: spacingUnit(2)),
                Text('Payment Success', style: ThemeText.title.copyWith(fontWeight: FontWeight.bold, color: Colors.white))
              ]),
              SizedBox(height: spacingUnit(2),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(40))
                ),
                child: Text('\$26.88', style: ThemeText.title2.copyWith(color: statusColor('success'), fontWeight: FontWeight.bold)),
              )
            ],
          )
        ),

        Expanded(
          /// LIST DETAIL
          child: ListView(shrinkWrap: true, primary: true, padding: EdgeInsets.symmetric(vertical: spacingUnit(1), horizontal: spacingUnit(2)), children: const [
            PaymentReview(withPrice: false),
            VSpaceShort(),
            TitleBasicSmall(title: 'Detail Transaction'),
            VSpaceShort(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Date:'),
              Text('22 Jun 2025', style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
            LineList(spacing: 8,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Transaction Number:'),
              Text('A1234567890SSR', style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
            LineList(spacing: 8,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Price:'),
              Text('\$24', style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
            LineList(spacing: 8,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Tax 12%:'),
              Text('\$2.88', style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
            LineList(spacing: 8,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Total:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$26.88', style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ]),
        ),

        /// OTHER ACTIONS
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              onTap: () {},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: ThemePalette.primaryLight,
                      radius: 22,
                    ),
                    Icon(Icons.qr_code, size: 32, color: ThemePalette.primaryDark),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Show QR', style: ThemeText.caption)
              ]),
            ),
            InkWell(
              onTap: () {},
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: ThemePalette.secondaryLight,
                      radius: 22,
                    ),
                    Icon(Icons.download, size: 32, color: ThemePalette.secondaryDark),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Download Receipt', style: ThemeText.caption)
              ]),
            ),
            InkWell(
              onTap: () {
                Get.toNamed('/contact');
              },
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: ThemePalette.tertiaryLight,
                      radius: 22,
                    ),
                    Icon(Icons.question_answer_outlined, size: 32, color: ThemePalette.tertiaryDark),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Need help?', style: ThemeText.caption)
              ]),
            ),
          ]),
        ),

        const VSpaceShort(),
        
        /// ACTION BUTTON
        Padding(
          padding: EdgeInsets.all(spacingUnit(1)),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Get.toNamed('/');
                  },
                  style: ThemeButton.btnBig.merge(ThemeButton.tonalPrimary(context)),
                  child: const Text('Go to Homepage')
                ),
              ),
              SizedBox(height: spacingUnit(2)),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Get.toNamed('/payment/history');
                  },
                  style: ThemeButton.btnBig.merge(ThemeButton.outlinedPrimary(context)),
                  child: const Text('Go to Transaction History')
                ),
              ),
              const VSpaceShort()
            ],
          ),
        ),
      ])
    );
  }
}