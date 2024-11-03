import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class DurationForm extends StatefulWidget {
  const DurationForm({super.key});

  @override
  State<DurationForm> createState() => _DurationFormState();
}

class _DurationFormState extends State<DurationForm> {
  double _currentSliderValue = 3;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(children: [
      const Text('Please set your post duration', textAlign: TextAlign.center, style: ThemeText.subtitle),
      const VSpace(),
      const Text('08:30 - 11:30', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700)),
      const VSpace(),
      Slider(
        value: _currentSliderValue,
        max: 12,
        divisions: 12,
        label: _currentSliderValue.round().toString(),
        inactiveColor: colorScheme.outline,
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('0'),
          Text('12 Hours')
        ]),
      ),
      const VSpaceShort(),
      Container(
        padding: EdgeInsets.all(spacingUnit(1)),
        decoration: BoxDecoration(
          color: Colors.amber.shade200,
          borderRadius: ThemeRadius.small,
        ),
        child: const Text(
          'This post is not permanent. It will be deleted automatically once time limit reached.',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ]);
  }
}