import 'package:flutter/material.dart';

class GeneralList {
  final String value;
  final String thumb;
  final String? text;
  final String? desc;
  final Color? color;

  GeneralList({
    required this.value,
    required this.thumb,
    this.text,
    this.desc,
    this.color
  });
}