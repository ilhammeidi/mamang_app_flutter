import 'package:flutter/material.dart';

class AnimatedSlideHorizontal extends StatelessWidget {
  const AnimatedSlideHorizontal({
    super.key,
    required this.order,
    required this.child,
    this.start = false,
  });

  final int order;
  final Widget child;
  final bool start;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (order * 200)),
      transform: Matrix4.translationValues(start ? 0 : screenWidth, 0, 0),
      child: child
    );
  }
}