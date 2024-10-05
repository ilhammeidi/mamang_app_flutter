import 'package:flutter/material.dart';

Color colorType(type) {
  switch(type) {
    case 'purple':
      return Colors.purpleAccent;
    case 'blue':
      return Colors.orangeAccent;
    case 'green':
      return Colors.lightBlueAccent;
    default:
      return Colors.lightGreen;;
  }
}