import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
  final _registerKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return FormBuilder(
      key: _registerKey,
      child: ListView(children: [
        /// TITLE
        const VSpace(),
        const Text('Register', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700)),
        SizedBox(height: spacingUnit(1)),
        Text('👋 Very nice to meet you! Create new account for free.', style: ThemeText.subtitle2.copyWith(color: colorScheme.onSurfaceVariant)),
        const VSpaceBig(),
      
        /// INPUT FIELD
        FormBuilderField(
          name: 'name',
          builder: (FormFieldState<dynamic> field) {
            return AppTextField(
              label: 'User Name',
              onChanged: (value) => field.didChange(value),
              errorText: field.hasError ? 'Please fill your name' : null,
            );
          },
          validator: FormBuilderValidators.required(),
        ),
        const VSpace(),

        FormBuilderField(
          name: 'email_or_phone',
          builder: (FormFieldState<dynamic> field) {
            return AppTextField(
              label: 'Email or Phone Numner',
              onChanged: (value) => field.didChange(value),
              errorText: field.hasError ? 'Incorrect email or phone number' : null,
            );
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.or([
              FormBuilderValidators.email(),
              FormBuilderValidators.phoneNumber(),
            ])
          ]),
        ),
        const VSpace(),

        FormBuilderField(
          name: 'password',
          builder: (FormFieldState<dynamic> field) {
            return AppTextField(
              label: 'Password',
              obscureText: true,
              onChanged: (value) => field.didChange(value),
              errorText: field.hasError ? 'Please fill your password with minimum 6 characters' : null,
            );
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.minLength(6),
          ]),
        ),
        const VSpace(),

        FormBuilderField(
          name: 'repeat_password',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<dynamic> field) {
            return AppTextField(
              label: 'Repeat Password',
              obscureText: true,
              onChanged: (value) => field.didChange(value),
              errorText: field.hasError ? 'Password doesn\'t match' : null,
            );
          },
          validator: (value) =>
            _registerKey.currentState?.fields['password']?.value != value
              ? 'Password not match'
              : null,
        ),
        const VSpaceShort(),
        FormBuilderCheckbox(
          name: 'accept_terms',
          initialValue: false,
          title: const Text('Agree with our terms and condtions'),
          validator: FormBuilderValidators.equal(
            true,
            errorText: 'You must accept terms and conditions to continue',
          ),
        ),
        const VSpace(),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledButton(
            onPressed: () {
              if (_registerKey.currentState?.saveAndValidate() ?? false) {
                debugPrint(_registerKey.currentState?.value.toString());
                Get.toNamed('/otp');
              }
            },
            style: ThemeButton.btnBig.merge(ThemeButton.secondary),
            child: const Text('CONTINUE', style: ThemeText.subtitle)
          ),
        ),
        const VSpaceBig()
      ]),
    );
  }
}