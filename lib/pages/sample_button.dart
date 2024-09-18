import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SampleButton extends StatefulWidget {
  const SampleButton({super.key});

  @override
  State<SampleButton> createState() => _SampleButtonState();
}

class _SampleButtonState extends State<SampleButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () {},
          style: ThemeButton.btnBig.merge(ThemeButton.tonalSecondary),
          child: const Text('Mamang', style: ThemeText.subtitle
        )),
        const SizedBox(height: 40),
        FilledButton(
          onPressed: () {},
          style: ThemeButton.tertiary.merge(ThemeButton.btnSmall),
          child: const Text('Button Mamang App', style: ThemeText.caption),
        ),
        const SizedBox(height: 40),
        const Divider(),
        Row(
          children: [
            const SizedBox(width: 10),
            Center(
              child: Column(children: [
                const VSpaceShort(),
                FilledButton(
                  onPressed: () {},
                  style: ThemeButton.primary.merge(ThemeButton.btnSmall),
                  child: const Text('Button', style: ThemeText.caption),
                ),
                const VSpaceShort(),
                FilledButton(
                  onPressed: () {},
                  style: ThemeButton.secondary,
                  child: const Text('Button'),
                ),
                const VSpaceShort(),
                FilledButton(
                  onPressed: () {},
                  style: ThemeButton.tertiary,
                  child: const Text('Button'),
                )
              ])
            ),
            const SizedBox(width: 10),
            Center(
              child: Column(children: [
                const VSpaceShort(),
                OutlinedButton(
                  onPressed: () {},
                  style: ThemeButton.outlinedPrimary,
                  child: const Text('Button'),
                ),
                const VSpaceShort(),
                OutlinedButton(
                  onPressed: () {},
                  style: ThemeButton.outlinedSecondary,
                  child: const Text('Button'),
                ),
                const VSpaceShort(),
                OutlinedButton(
                  onPressed: () {},
                  style: ThemeButton.outlinedTertiary,
                  child: const Text('Button'),
                )
              ])
            ),
            const SizedBox(width: 10),
            Center(
              child: Column(children: [
                const VSpaceShort(),
                FilledButton(
                  onPressed: () {},
                  style: ThemeButton.tonalPrimary,
                  child: const Text('Button'),
                ),
                const VSpaceShort(),
                FilledButton(
                  onPressed: () {},
                  style: ThemeButton.tonalSecondary,
                  child: const Text('Button'),
                ),
                const VSpaceShort(),
                FilledButton(
                  onPressed: () {},
                  style: ThemeButton.tonalTertiary,
                  child: const Text('Button'),
                )
              ])
            ),
            const SizedBox(width: 10),
            Center(
              child: Column(children: [
                const VSpaceShort(),
                TextButton(
                  onPressed: () {},
                  style: ThemeButton.textPrimary,
                  child: const Text('Button'),
                ),
                const VSpaceShort(),
                TextButton(
                  onPressed: () {},
                  style: ThemeButton.textSecondary,
                  child: const Text('Button'),
                ),
                const VSpaceShort(),
                TextButton(
                  onPressed: () {},
                  style: ThemeButton.textTertiary,
                  child: const Text('Button'),
                )
              ])
            ),
          ],
        ),
      ],
    );
  }
}