import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/forms/caption_form.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/forms/duration_form.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/forms/location_form.dart';

class PostFormStep extends StatefulWidget {
  const PostFormStep({super.key});

  @override
  State<PostFormStep> createState() => _PostFormStepState();
}

class _PostFormStepState extends State<PostFormStep> {
  int _formStep = 0;
  final double _formHeight = 300;

  @override
  Widget build(BuildContext context) {

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      /// FORM
      SizedBox(
        height: _formHeight + 250,
        child: Stepper(
          margin: const EdgeInsets.all(0),
          type: StepperType.horizontal,
          currentStep: _formStep,
          onStepCancel: () {
            if (_formStep >= 1) {
              setState(() {
                _formStep -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_formStep <= 1) {
              setState(() {
                _formStep += 1;
              });
            }
          },
          steps: <Step>[
            Step(
              title: const Text('Duration', style: ThemeText.caption,),
              content: SizedBox(height: _formHeight, child: const DurationForm()),
              isActive: _formStep >= 0,
            ),
            Step(
              title: const Text('Location', style: ThemeText.caption),
              content: SizedBox(height: _formHeight, child: const LocationForm()),
              isActive: _formStep >= 1,
            ),
            Step(
              title: const Text('Caption', style: ThemeText.caption),
              content: SizedBox(height: _formHeight, child: const CaptionForm()),
              isActive: _formStep >= 2,
            )
          ],
        
          /// ACTION BUTTONS
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Padding(
              padding: EdgeInsets.only(
                top: spacingUnit(2),
                bottom: 100
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: details.onStepCancel,
                    style: ThemeButton.btnBig.merge(ThemeButton.outlinedPrimary(context)),
                    child: Text('Back'.toUpperCase())
                  ),
                ),
                SizedBox(width: spacingUnit(1)),
                Expanded(
                  child: FilledButton(
                    onPressed: details.onStepContinue,
                    style: ThemeButton.btnBig.merge(ThemeButton.primary),
                    child: Text(_formStep < 2 ? 'Next'.toUpperCase() : 'Post Now'.toUpperCase())
                  ),
                )
              ]),
            );
          },
        ),
      ),
    ]);
  }
}