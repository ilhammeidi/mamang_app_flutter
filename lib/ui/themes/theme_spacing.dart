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

class LineSpace extends StatelessWidget {
  const LineSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacingUnit(3)),
      child: Divider(
        color: Theme.of(context).colorScheme.outline.withOpacity(0.25),
        thickness: 8,
        indent: 0,
        endIndent: 0,
        height: 8,
      ),
    );
  }
}

class LineList extends StatelessWidget {
  const LineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.outline, 
      height: 1,
      thickness: 1
    );
  }
}
