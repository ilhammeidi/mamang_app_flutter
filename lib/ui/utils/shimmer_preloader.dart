import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPreloader extends StatelessWidget {
  const ShimmerPreloader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(color: Colors.white),
    );
  }
}