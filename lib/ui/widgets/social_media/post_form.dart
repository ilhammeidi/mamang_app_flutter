import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/forms/caption_form.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/forms/location_form.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  bool _showMap = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        /// TITLE
        Text('Write Caption', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: spacingUnit(1)),

        /// FORM
        _showMap ? const LocationForm() : const CaptionForm(),
        
        const VSpace(),

        /// BUTTONS
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _showMap = !_showMap;
                });
              },
              style: ThemeButton.btnBig.merge(ThemeButton.outlinedPrimary(context)),
              child: Text(_showMap ? 'Back'.toUpperCase() : 'Set Location'.toUpperCase())
            ),
          ),
          SizedBox(width: spacingUnit(1)),
          Expanded(
            child: FilledButton(
              onPressed: () {},
              style: ThemeButton.btnBig.merge(ThemeButton.tonalPrimary(context)),
              child: Text('Post Now'.toUpperCase())
            ),
          )
        ]),
        const VSpaceBig(),
      ]),
    );
  }
}