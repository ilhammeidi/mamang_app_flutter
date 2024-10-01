import 'package:flutter/material.dart';

Color colorType(type) {
  switch(type) {
    case 'purple':
      return Colors.purpleAccent;
    case 'blue':
      return Colors.lightBlueAccent;
    case 'green':
      return Colors.lightGreen;
    default:
      return Colors.grey;
  }
}