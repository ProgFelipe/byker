import 'package:flutter/material.dart';

class CurvedShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    /*path.quadraticBezierTo(size.width * .25, size.height- 50.0,
        size.width * .5, size.height -35.0);

    path.quadraticBezierTo(size.width * .75, size.height- 25.0,
        size.width, size.height -90.0);*/

    path.quadraticBezierTo(size.width * .25, size.height - 50.0,
        size.width * .5, size.height - 35.0);

    path.quadraticBezierTo(
        size.width * .75, size.height - 25.0, size.width, size.height - 90.0);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
