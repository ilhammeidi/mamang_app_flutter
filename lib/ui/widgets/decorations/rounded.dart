import 'package:flutter/material.dart';

class RoundedClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
  
    final path = Path();
    
    path.lineTo(0, h - 20);
    path.quadraticBezierTo(w * 0.5, 0, w, h - 20);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
  
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}