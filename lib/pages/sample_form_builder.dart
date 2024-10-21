import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield_form_builder.dart';

class SampleFormBuilder extends StatefulWidget {
  const SampleFormBuilder({super.key});

  @override
  State<SampleFormBuilder> createState() => _SampleFormBuilderState();
}

class _SampleFormBuilderState extends State<SampleFormBuilder> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  final Map <String, dynamic>_initialValue = {
    'first_name': 'John',
    'middle_name': 'Zombie',
    'last_name': 'Doe',
    'email': 'johndoe@example.com',
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
        key: _formKey,
        initialValue: _initialValue,
        child: Column(
          children: [
            FormBuilderField(
              name: 'first_name',
              builder: (FormFieldState<dynamic> field) {
                return AppTextField(
                  // initialValue: 'john',
                  label: 'First Name',
                  onChanged: (value) => field.didChange(value),
                  errorText: field.hasError ? 'Error coy' : null,
                );
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 10),
            AppTextfieldFormBuilder(
              label: 'Middle Name',
              name: 'middle_name',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              // initialValue: 'dasa',
              name: 'last_name',
              decoration: const InputDecoration(labelText: 'Last Name',),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              key: _emailFieldKey,
              name: 'email',
              decoration: const InputDecoration(labelText: 'Email'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.or([
                  FormBuilderValidators.email(),
                  FormBuilderValidators.phoneNumber(),
                ])
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(6),
              ]),
            ),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'confirm_password',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                suffixIcon: (_formKey.currentState?.fields['confirm_password']
                            ?.hasError ??
                        false)
                    ? const Icon(Icons.error, color: Colors.red)
                    : const Icon(Icons.check, color: Colors.green),
              ),
              obscureText: true,
              validator: (value) =>
                  _formKey.currentState?.fields['password']?.value != value
                      ? 'No coinciden'
                      : null,
            ),
            const SizedBox(height: 10),
            FormBuilderFieldDecoration<bool>(
              name: 'test',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.equal(true),
              ]),
              // initialValue: true,
              decoration: const InputDecoration(labelText: 'Accept Terms?'),
              builder: (FormFieldState<bool?> field) {
                return InputDecorator(
                  decoration: InputDecoration(
                    errorText: field.errorText,
                  ),
                  child: SwitchListTile(
                    title: const Text(
                        'I have read and accept the terms of service.'),
                    onChanged: field.didChange,
                    value: field.value ?? false,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // if(_nameFieldKey.currentState?.isValid ?? false){
                //   setState(() {
                //     _message = '';
                //   });
                // } else {
                //   setState(() {
                //     _message = 'Error';
                //   });
                // }
                if (_formKey.currentState?.saveAndValidate() ?? false) {
                  if (true) {
                    // Either invalidate using Form Key
                    _formKey.currentState?.fields['email']
                        ?.invalidate('Email already taken.');
                    // OR invalidate using Field Key
                    // _emailFieldKey.currentState?.invalidate('Email already taken.');
                  }
                }
                debugPrint(_formKey.currentState?.value.toString());
              },
              child: const Text('Signup'),
            ),
            OutlinedButton(
              onPressed: () {
                _formKey.currentState?.reset();
                // setState(() {
                //   _initialValue = {
                //     'first_name': '',
                //     'last_name': '',
                //     'email': '',
                //   };
                // });
              },
              // color: Theme.of(context).colorScheme.secondary,
              child: const Text('Reset'),
            ),
            OutlinedButton(
              onPressed: () {
                _formKey.currentState?.patchValue({
                  'first_name': 'Ubah',
                  'middle_name': 'ome ome',
                  'last_name': 'rubah',
                });
              },
              // color: Theme.of(context).colorScheme.secondary,
              child: const Text('Set Value'),
            ),
          ],
        ),
      ),
    );
  }
}