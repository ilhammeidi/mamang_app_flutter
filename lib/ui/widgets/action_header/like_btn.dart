import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';

class LikeBtn extends StatelessWidget {
  const LikeBtn({
    super.key,
    this.isLiked = false,
    this.invert = false,
    this.onPressed,
    this.highContrast = false,
    this.hasBg = false
  });

  final bool isLiked;
  final bool invert;
  final bool hasBg;
  final bool highContrast;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: onPressed, 
      style: hasBg ? IconButton.styleFrom(
        backgroundColor: colorScheme.surface,
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 3
      ) : null,
      icon: isLiked == true ? 
        Icon(Icons.favorite, color: ThemePalette.tertiaryMain)
        : Icon(
            Icons.favorite_border_outlined,
            shadows: highContrast ? const [BoxShadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 5)] : null,
            color: invert ? Colors.white : colorScheme.onSurface
          )
    );
  }
}