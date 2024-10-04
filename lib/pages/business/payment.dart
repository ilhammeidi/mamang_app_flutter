import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

class BusinessPayment extends StatefulWidget {
  const BusinessPayment({
    super.key,
    this.name = 'VIP Business',
    this.icon = const VipIcon()
  });

  final String name;
  final Widget icon;

  @override
  State<BusinessPayment> createState() => _BusinessPaymentState();
}

class _BusinessPaymentState extends State<BusinessPayment> {
  bool _active = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        centerTitle: true,
        title: Text(widget.name)
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          /// ICON
          widget.icon,
          const VSpace(),
        
          /// PROMO NAME
          AppTextField(label: 'Promo Name', onChanged: (_) {}),
          const VSpace(),
        
          /// ACTIVATED PROMO SWITCHES
          AppInputBox(
            content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Expanded(
                child: Text('Activate Promo Now',)
              ),
              Switch(
                value: _active,
                activeColor: ThemePalette.primaryMain,
                onChanged: (bool value) {
                  setState(() {
                    _active = value;
                  });
                },
              )
            ]),
          ),
          const Text(
            'You can activate the promo later',
            style: ThemeText.caption,
            textAlign: TextAlign.start,
          ),
          const VSpace(),
        
          /// ACTIVATION METODE
          const TitleBasic(title: 'Choose Activation Method'),
          const VSpaceShort(),

          /// TIMER
          AppInputBox(
            content: ListTile(
              contentPadding: const EdgeInsets.all(4),
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: ThemePalette.primaryLight,
                child: Icon(Icons.access_time, size: 24, color: ThemePalette.primaryMain),
              ),
              title: Text('Buy Timer', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
              trailing: const Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text('\$ 2 / day', style: ThemeText.caption),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios)
              ]),
            )
          ),
          const VSpaceShort(),

          /// POINT
          AppInputBox(
            content: ListTile(
              contentPadding: const EdgeInsets.all(4),
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: ThemePalette.secondaryLight,
                child: Icon(Icons.stars_rounded, size: 24, color: ThemePalette.secondaryMain),
              ),
              title: Text('Use Points', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
              trailing: const Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text('10 points / day', style: ThemeText.caption),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios)
              ]),
            )
          ),
          const VSpaceShort(),

          /// GET MEMBERs
          AppInputBox(
            content: ListTile(
              contentPadding: const EdgeInsets.all(4),
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: ThemePalette.tertiaryLight,
                child: Icon(Icons.person_add, size: 24, color: ThemePalette.tertiaryMain),
              ),
              title: Text('Get Members', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
              trailing: const Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text('Scan Barcode', style: ThemeText.caption),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios)
              ]),
            )
          ),
          const VSpaceShort(),

          /// WATCH ADS
          AppInputBox(
            content: ListTile(
              contentPadding: const EdgeInsets.all(4),
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: Theme.of(context).colorScheme.outline,
                child: Icon(Icons.play_arrow_outlined, size: 24, color: ThemePalette.tertiaryMain),
              ),
              title: Text('Watch Ads', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
              trailing: const Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text('FREE', style: ThemeText.caption),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios)
              ]),
            )
          ),
          const VSpace(),

          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                Get.toNamed('/business-new/form');
              },
              style: ThemeButton.btnBig.merge(ThemeButton.primary),
              child: const Text('CONTINUE'),
            ),
          )
        ]),
      )
    );
  }
}