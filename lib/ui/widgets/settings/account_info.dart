import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/grabber_icon.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const GrabberIcon(),
      const VSpace(),
      Text('Account Info', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
      const VSpaceShort(),

      /// ACCOUNT INFO
      SizedBox(
        height: 500,
        child: Padding(
          padding: EdgeInsets.all(spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(children: [
              Text('Name', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(userDummy.name),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: const LineList(),
            ),
            Row(children: [
              Text('Email', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Text('name@mail.com'),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: const LineList(),
            ),
            Row(children: [
              Text('Phone Number/WhatsApp', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              const Text('+621234567890'),
            ]),
            const VSpaceBig(),
            SizedBox(
              width: 250,
              height: 40,
              child: FilledButton(
                onPressed: () {
                  Get.toNamed('/edit-profile');
                },
                style: ThemeButton.tonalSecondary(context),
                child: const Text('Change Profile', style: ThemeText.subtitle)
              ),
            ),
            const VSpaceShort(),
            SizedBox(
              width: 250,
              height: 40,
              child: OutlinedButton(
                onPressed: () {
                  Get.toNamed('/change-password');
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red.shade300),
                  foregroundColor: Colors.red.shade300
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.lock),
                  Text('Change Password', style: ThemeText.subtitle),
                ])
              ),
            ),
            const VSpaceBig(),
          ])
        ),
      ),
    ]);
  }
}