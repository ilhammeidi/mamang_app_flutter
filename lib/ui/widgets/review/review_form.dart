import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/grabber_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/widgets/review/rating_star.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  String _review = 'Awesome';

  void handleChange(val) {
    setState(() {
      switch(val) {
        case 1:
          _review = 'Worst';
        break;
        case 2:
          _review = 'Bad';
        break;
        case 3:
          _review = 'Not Bad';
        break;
        case 4:
          _review = 'Good';
        break;
        default:
          _review = 'Awesome';
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(spacingUnit(2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const GrabberIcon(),
        const VSpace(),
        
        /// TEXT
        Text('Write Review', textAlign: TextAlign.center, style: ThemeText.title2.copyWith(fontWeight: FontWeight.w700)),
        SizedBox(height: spacingUnit(1)),
        const Text('Click the star to change the rating. IMPORTANT: Reviews are public and include your name and avatar,', textAlign: TextAlign.center),
        const VSpace(),

        /// FORM
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RatingStar(initVal: 5, size: 32, onChanged: handleChange),
          SizedBox(width: spacingUnit(1)),
          Text(_review, style: ThemeText.subtitle)
        ]),
        const VSpace(),
        AppTextField(
          label: 'Write your description',
          maxLines: 4,
          onChanged: (_) {},
        ),
        const VSpace(),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {
              Get.back();
            },
            style: ThemeButton.btnBig.merge(ThemeButton.primary),
            child: const Text('POST REVIEW'),
          ),
        ),
        const VSpaceBig(),
        const SizedBox(height: 300)
      ]),
    );
  }
}