import 'package:flutter/widgets.dart';

class ColRow extends StatelessWidget {
  const ColRow({
    super.key,
    required this.children,
    this.switched = false,
    this.reversed = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final bool switched;
  final bool reversed;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    if (switched) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: reversed ? children.reversed.toList() : children
      );
    }
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: reversed ? children.reversed.toList() : children
    );
  }
}