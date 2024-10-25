import 'package:flutter/material.dart';

class ShareBtn extends StatelessWidget {
  const ShareBtn({super.key, this.invert = false, this.onPressed, this.highContrast = false});

  final bool invert;
  final bool highContrast;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: onPressed, 
      icon: Icon(
        Icons.share,
        color: invert ? Colors.white : colorScheme.onSurface,
        shadows: highContrast ? const [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)] : null,
      )
    );
  }
}