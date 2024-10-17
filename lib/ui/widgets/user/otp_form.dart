import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Column(
      children: [
        /// TITLE
        const VSpace(),
        const Text('Check Your Phone', style: ThemeText.title),
        SizedBox(height: spacingUnit(1)),
        Text('We\'ve sent the code to your phone', style: ThemeText.subtitle2.copyWith(color: colorScheme.onSurfaceVariant)),
        const VSpaceBig(),

        /// FORM      
        Form(
          key: formKey,
          child: Column(
            children: [
              Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: pinController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return value == '1234' ? null : 'Pin is incorrect';
                  },
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              const VSpace(),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: ThemeButton.btnBig.merge(ThemeButton.secondary),
                  onPressed: () {
                    focusNode.unfocus();
                    if (formKey.currentState!.validate()) {
                      Get.toNamed('/');
                    }
                  },
                  child: const Text('Verify'),
                ),
              ),
              const VSpaceShort(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: ThemeButton.btnBig,
                  onPressed: null,
                  child: const Text('Send again'),
                ),
              ),
              const SizedBox(height: 8),
              RichText(text: const TextSpan(
                text: 'Please wait ',
                style: ThemeText.paragraph,  
                  children: [
                    TextSpan(
                      text: '1:30',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    TextSpan(
                      text: ' to send again',
                    )
                  ]
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}