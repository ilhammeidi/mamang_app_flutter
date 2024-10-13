import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _hidePassword = true;

  void handleShowPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /// TITLE
      const VSpace(),
      const Text('Login', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
      SizedBox(height: spacingUnit(1)),
      Text('✨ Welcome back! Please login to your account.', style: ThemeText.subtitle2.copyWith(color: colorScheme.onSurfaceVariant)),
      const VSpaceBig(),
    
      /// INPUT FIELD
      AppTextField(label: 'Email or Phone Number', onChanged: (_) {}),
      const VSpace(),
      AppTextField(
        label: 'Password',
        obscureText: _hidePassword,
        onChanged: (_) {},
        suffix: IconButton(
          onPressed: () {
            handleShowPassword();
          },
          icon: _hidePassword == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
        ),
      ),
      const VSpace(),
      SizedBox(
        width: double.infinity,
        height: 50,
        child: FilledButton(
          onPressed: () {
            Get.toNamed('/');
          },
          style: ThemeButton.btnBig.merge(ThemeButton.secondary),
          child: const Text('CONTINUE', style: ThemeText.subtitle)
        ),
      ),
      const VSpaceBig(),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: () {
            Get.toNamed('/reset-password');
          },
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: ThemePalette.secondaryMain.withOpacity(0.25),
                  radius: 22,
                ),
                Icon(Icons.help_outline, size: 32, color: ThemePalette.secondaryDark),
              ],
            ),
            const SizedBox(height: 4),
            const Text('Forgot Password', style: ThemeText.caption)
          ]),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: ThemePalette.primaryMain.withOpacity(0.25),
                radius: 22,
              ),
              Icon(Icons.question_answer_outlined, size: 32, color: ThemePalette.primaryDark),
            ],
          ),
          const SizedBox(height: 4),
          const Text('Help and Support', style: ThemeText.caption)
        ]),
        InkWell(
          onTap: () {
            Get.toNamed('/');
          },
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: ThemePalette.tertiaryMain.withOpacity(0.25),
                  radius: 22,
                ),
                Icon(Icons.group_outlined, size: 32, color: ThemePalette.tertiaryDark),
              ],
            ),
            const SizedBox(height: 4),
            const Text('User Demo', style: ThemeText.caption)
          ]),
        ),
      ],)
    ]);
  }
}