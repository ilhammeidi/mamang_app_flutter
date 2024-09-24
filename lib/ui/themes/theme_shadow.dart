import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ThemeShade {
  // Soft
  static final bool _isDark = Get.isDarkMode;

  static BoxShadow shadeSoft(BuildContext context){
    return BoxShadow(
      color: _isDark ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.09),
      spreadRadius: 1,
      blurRadius: 3,
      offset: const Offset(0, 1),
    );
  } 

  // Medium
  static BoxShadow shadeMedium(BuildContext context){
    return BoxShadow(
      color: _isDark ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.1),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 2),
    );
  }

  // Hard
  static BoxShadow shadeHard(BuildContext context){
    return BoxShadow(
      color: _isDark ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.2),
      spreadRadius: 3,
      blurRadius: 7,
      offset: const Offset(0, 3),
    );
  }
}