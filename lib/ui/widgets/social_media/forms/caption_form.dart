import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class CaptionForm extends StatelessWidget {
  const CaptionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const Text('Add caption to enggage cutomers', textAlign: TextAlign.center, style: ThemeText.subtitle),
        const VSpaceShort(),
        AppTextField(
          onChanged: (_) {},
          label: 'Write caption',
          maxLines: 4,
        ),
        const VSpace(),
        AppInputBox(
          content: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
            title: const Text('Tag Promos and People', style: ThemeText.subtitle2,),
            subtitle: Text('#123456, #678901, @johndrome', style: TextStyle(color: ThemePalette.primaryMain)),
            trailing: const Icon(Icons.arrow_forward_ios),
          )
        ),
      ]
    );
  }
}