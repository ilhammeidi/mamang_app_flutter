import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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
        title: const Text('Edit Profile')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(spacingUnit(2)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundColor: ThemePalette.primaryMain,
                  child: const Icon(Icons.edit, size: 12, color: Colors.white),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(userDummy.avatar),
                ),
              ],
            ),
            const VSpace(),
            AppTextField(label: userDummy.name, onChanged: (_) {}),
            const VSpace(),
            AppTextField(label: '+621234567890', onChanged: (_) {}),
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