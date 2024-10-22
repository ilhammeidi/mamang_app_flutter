import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
  final _resetPwdKey = GlobalKey<FormState>();
  bool _isNotValid = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _resetPwdKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// TITLE
        const VSpace(),
        const Text('Password Recovery', style: ThemeText.title),
        SizedBox(height: spacingUnit(1)),
        Text('Please provide your email or phone', style: ThemeText.subtitle2.copyWith(color: colorScheme.onSurfaceVariant)),
        const VSpace(),
      
        /// INPUT FIELD
        AppTextField(
          label: 'Email or Phone Number',
          onChanged: (_) {},
          errorText: _isNotValid ? 'Incorrect email or phone number' : null,
          validator: FormBuilderValidators.compose(<FormFieldValidator<String>>[
            FormBuilderValidators.required(),
            FormBuilderValidators.or([
              FormBuilderValidators.email(),
              FormBuilderValidators.phoneNumber(),
            ])
          ])
        ),
        const VSpace(),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledButton(
            onPressed: () {
              if (_resetPwdKey.currentState!.validate()) {
                Get.toNamed('/');
              } else {
                setState(() {
                  _isNotValid = true;
                });
              }
            },
            style: ThemeButton.btnBig.merge(ThemeButton.secondary),
            child: const Text('CONTINUE', style: ThemeText.subtitle)
          ),
        ),
        const VSpaceBig(),
      ]),
    );
  }
}