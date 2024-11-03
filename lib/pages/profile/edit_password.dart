import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
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

  final _keyEditPwd = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool _errCurPwd = false;
  bool _errNewPwd = false;
  bool _errConfirmPwd = false;

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
        title: const Text('Change Password'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _keyEditPwd,
          child: Padding(
            padding: EdgeInsets.all(spacingUnit(2)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              AppTextField(
                label: 'Current Password',
                obscureText: _hideCurrentPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _errCurPwd = true;
                    });
                    return '';
                  }
                  setState(() {
                    _errCurPwd = false;
                  });
                  return null;
                },
                errorText: _errCurPwd ? 'Please fill with your current password' : null,
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
                controller: _pass,
                obscureText: _hideNewPassword,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(6),
                ]),
                errorText: _errNewPwd ? 'Please fill your password with minimum 6 characters' : null,
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
                controller: _confirmPass,
                errorText: _errConfirmPwd ? 'Password not match' : null,
                validator: (value) {
                  if (value != _pass.text) {
                    setState(() {
                      _errConfirmPwd = true;
                    });
                    return '';
                  }
                  return null;
                },
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
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    if (_keyEditPwd.currentState!.validate()) {
                      Get.toNamed('/profile');
                    } else {
                      setState(() {
                        _errNewPwd = true;
                      });
                    }
                  },
                  style: ThemeButton.secondary,
                  child: const Text('UPDATE', style: ThemeText.subtitle2,)
                ),
              )
            ]),
          ),
        ),
      )
    );
  }
}