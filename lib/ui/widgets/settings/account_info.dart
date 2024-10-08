import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/promo/slider_info/grabber_icon.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const GrabberIcon(),
      const VSpace(),
      Text('Account InFo', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
      const VSpaceShort(),

      /// ACCOUNT INFO
      AppInputBox(
        content: Column(children: [
          Row(children: [
            Text('Name', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(userDummy.name),
          ]),
          const LineList(),
          Row(children: [
            Text('Email', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            const Text('name@mail.com'),
          ]),
          const LineList(),
          Row(children: [
            Text('Phone Number/WhatsApp', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            const Text('+621234567890'),
          ]),
          const VSpace(),
          FilledButton(
            onPressed: () {},
            style: ThemeButton.tonalPrimary(context),
            child: const Column(children: [
              Icon(Icons.edit_attributes),
              Text('Change Profile'),
            ])
          ),
          const VSpaceShort(),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.red.shade300)
            ),
            child: const Column(children: [
              Icon(Icons.lock),
              Text('Change Password'),
            ])
          ),
        ])
      )
    ]);
  }
}