import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_bottom.dart';
import 'package:mamang_app_flutter/ui/widgets/decorations/rounded_top.dart';

class RoundedDecoMain extends StatelessWidget {
  const RoundedDecoMain({
    super.key,
    this.toBottom = false,
    required this.height,
    required this.bgDecoration
  });

  final bool toBottom;
  final double height;
  final BoxDecoration bgDecoration;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 600
      ),
      child: ClipPath(
        clipper: toBottom ? RoundedClipPathBottom() : RoundedClipPathTop(),
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: bgDecoration
        ),
      ),
    );
  }
}