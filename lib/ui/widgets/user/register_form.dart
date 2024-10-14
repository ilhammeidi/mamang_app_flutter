import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ListView(children: [
      /// TITLE
      const VSpace(),
      const Text('Register', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
      SizedBox(height: spacingUnit(1)),
      Text('👋 Very nice to meet you! Create new account for free.', style: ThemeText.subtitle2.copyWith(color: colorScheme.onSurfaceVariant)),
      const VSpaceBig(),
    
      /// INPUT FIELD
      AppTextField(label: 'User Name', onChanged: (_) {}),
      const VSpace(),
      AppTextField(label: 'Email or Phone Number', onChanged: (_) {}),
      const VSpace(),
      AppTextField(label: 'Password', obscureText: true, onChanged: (_) {}),
      const VSpaceShort(),
      AppTextField(label: 'Confirm Password', obscureText: true, onChanged: (_) {}),
      const VSpaceShort(),
      Row(children: [
        Checkbox(
          value: _agree,
          onChanged: (val) {
            setState(() {
              _agree = val!;
            });
          }
        ),
        const SizedBox(width: 4),
        const Text('Agree with our terms and condtions')
      ]),
      const VSpace(),
      SizedBox(
        width: double.infinity,
        height: 50,
        child: FilledButton(
          onPressed: () {
            Get.toNamed('/otp');
          },
          style: ThemeButton.btnBig.merge(ThemeButton.secondary),
          child: const Text('CONTINUE', style: ThemeText.subtitle)
        ),
      ),
      const VSpaceBig()
    ]);
  }
}