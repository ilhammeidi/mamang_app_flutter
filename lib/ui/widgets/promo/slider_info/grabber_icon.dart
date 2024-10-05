import 'package:flutter/material.dart';

class GrabberIcon extends StatelessWidget {
  const GrabberIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: 32.0,
        height: 4.0,
        decoration: BoxDecoration(
          color: colorScheme.outline,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}