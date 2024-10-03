import 'package:flutter/material.dart';

class FadedBottomHeader extends StatelessWidget {
  const FadedBottomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[colorScheme.surface, colorScheme.surface.withOpacity(0.5), colorScheme.surface.withOpacity(0)],
          stops: const [0.25, 0.5, 1.3],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      ),
    );
  }
}
