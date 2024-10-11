import 'package:flutter/material.dart';

class ThemeShade {
  // Soft
  static BoxShadow shadeSoft(BuildContext context){
    return BoxShadow(
      color: Theme.of(context).colorScheme.shadow,
      spreadRadius: 1,
      blurRadius: 3,
      offset: const Offset(0, 1),
    );
  } 

  // Medium
  static BoxShadow shadeMedium(BuildContext context){
    return BoxShadow(
      color:Colors.black.withOpacity(0.1),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 2),
    );
  }

  // Hard
  static BoxShadow shadeHard(BuildContext context){
    return BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 3,
      blurRadius: 7,
      offset: const Offset(0, 3),
    );
  }
}