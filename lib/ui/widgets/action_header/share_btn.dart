import 'package:flutter/material.dart';

class ShareBtn extends StatelessWidget {
  const ShareBtn({super.key, required this.invert, this.onPressed});

  final bool invert;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: onPressed, 
      icon: Icon(Icons.share, color: invert ? Colors.white : colorScheme.onSurface)
    );
  }
}