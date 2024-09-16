import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;

class ThemeShade {
  // Soft
  static BoxShadow shadeSoft = BoxShadow(
    color: brightness == Brightness.dark
      ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.06),
    spreadRadius: 1,
    blurRadius: 3,
    offset: const Offset(0, 1),
  );

  // Medium
  static BoxShadow shadeMedium = BoxShadow(
    color: brightness == Brightness.dark
      ? Colors.black.withOpacity(0.3) : Colors.black.withOpacity(0.06),
    spreadRadius: 2,
    blurRadius: 5,
    offset: const Offset(0, 2),
  );

  // Hard
  static BoxShadow shadeHard = BoxShadow(
    color: brightness == Brightness.dark
      ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.1),
    spreadRadius: 3,
    blurRadius: 7,
    offset: const Offset(0, 3),
  );
}