import 'package:flutter/material.dart';

double spacingUnit(int val) {
  return val * 8;
}

class VSpace extends StatelessWidget {
  const VSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacingUnit(3));
  }
}

class VSpaceShort extends StatelessWidget {
  const VSpaceShort({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacingUnit(2));
  }
}

class VSpaceBig extends StatelessWidget {
  const VSpaceBig({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spacingUnit(6));
  }
}
