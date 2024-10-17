import 'package:flutter/material.dart';

Color colorType(type) {
  switch(type) {
    case 'vip':
      return Colors.purpleAccent;
    case 'gold':
      return Colors.orangeAccent;
    case 'pro':
      return Colors.lightBlueAccent;
    default:
      return Colors.lightGreen;
  }
}