import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _showCurrentPassword = false;
  bool _showNewPassword = false;
  bool _showRepeatPassword = false;
  
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
              obscureText: _showCurrentPassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _showCurrentPassword = !_showCurrentPassword;
                  });
                },
                icon: _showCurrentPassword == true ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
              ),
              onChanged: (_) {}
            ),
            const VSpace(),
            AppTextField(
              label: 'New Password',
              obscureText: _showNewPassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _showNewPassword = !_showNewPassword;
                  });
                },
                icon: _showNewPassword == true ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
              ),
              onChanged: (_) {}
            ),
            const VSpace(),
            AppTextField(
              label: 'Repeat Password',
              obscureText: _showRepeatPassword,
              suffix: IconButton(
                onPressed: () {
                  setState(() {
                    _showRepeatPassword = !_showRepeatPassword;
                  });
                },
                icon: _showRepeatPassword == true ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
              ),
              onChanged: (_) {}
            ),
            const VSpace(),
            FilledButton(
              onPressed: () {},
              style: ThemeButton.primary,
              child: const Text('Update')
            )
          ]),
        ),
      )
    );
  }
}