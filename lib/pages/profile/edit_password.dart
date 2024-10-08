import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  bool _hideCurrentPassword = true;
  bool _hideNewPassword = true;
  bool _hideRepeatPassword = true;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/profile');
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        title: const Text('Change Password')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            AppTextField(
              label: 'Current Password',
              obscureText: _hideCurrentPassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _hideCurrentPassword = !_hideCurrentPassword;
                  });
                },
                icon: _hideCurrentPassword == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
              ),
              onChanged: (_) {}
            ),
            const VSpace(),
            AppTextField(
              label: 'New Password',
              obscureText: _hideNewPassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _hideNewPassword = !_hideNewPassword;
                  });
                },
                icon: _hideNewPassword == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
              ),
              onChanged: (_) {}
            ),
            const VSpace(),
            AppTextField(
              label: 'Repeat Password',
              obscureText: _hideRepeatPassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _hideRepeatPassword = !_hideRepeatPassword;
                  });
                },
                icon: _hideRepeatPassword == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
              ),
              onChanged: (_) {}
            ),
            const VSpace(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: FilledButton(
                onPressed: () {},
                style: ThemeButton.primary,
                child: const Text('Update')
              ),
            )
          ]),
        ),
      )
    );
  }
}