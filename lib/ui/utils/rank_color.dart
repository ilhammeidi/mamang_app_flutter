import 'package:flutter/material.dart';

Color rankType(type) {
  switch(type) {
    case 'diamond':
      return Colors.purpleAccent;
    case 'ruby':
      return Colors.red;
    case 'emerald':
      return Colors.green;
    case 'platinum':
      return Colors.lightBlue;
    case 'gold':
      return Colors.orangeAccent;
    case 'silver':
      return Colors.grey.shade400;
    default:
      return Colors.brown.shade300;
  }
}