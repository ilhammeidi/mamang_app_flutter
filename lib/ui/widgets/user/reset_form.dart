import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class ResetForm extends StatefulWidget {
  const ResetForm({super.key});

  @override
  State<ResetForm> createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
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
      const Text('Password Recovery', style: ThemeText.title),
      SizedBox(height: spacingUnit(1)),
      Text('Please provide your email or phone', style: ThemeText.subtitle2.copyWith(color: colorScheme.onSurfaceVariant)),
      const VSpaceBig(),
    
      /// INPUT FIELD
      AppTextField(label: 'Email or Phone Number', onChanged: (_) {}),
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
    ]);
  }
}