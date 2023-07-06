import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 414;
    final double yScaling = size.height / 896;
    path.lineTo(3248 * xScaling, 1044.5 * yScaling);
    path.cubicTo(
      3248 * xScaling,
      1399.3 * yScaling,
      2765.1 * xScaling,
      1687 * yScaling,
      2169.5 * xScaling,
      1687 * yScaling,
    );
    path.cubicTo(
      2168 * xScaling,
      1687 * yScaling,
      2166.5 * xScaling,
      1687 * yScaling,
      2165 * xScaling,
      1687 * yScaling,
    );
    path.cubicTo(
      2100.3 * xScaling,
      1739 * yScaling,
      2020.4 * xScaling,
      1776.6 * yScaling,
      1931.9 * xScaling,
      1794 * yScaling,
    );
    path.cubicTo(
      1969.7 * xScaling,
      1762.3 * yScaling,
      2002.1000000000001 * xScaling,
      1724.2 * yScaling,
      2027.4 * xScaling,
      1681.4 * yScaling,
    );
    path.cubicTo(
      1737.4 * xScaling,
      1658.7 * yScaling,
      1483.6000000000001 * xScaling,
      1567.3000000000002 * yScaling,
      1313.7 * xScaling,
      1435.5 * yScaling,
    );
    path.cubicTo(
      1281.8 * xScaling,
      1410.7 * yScaling,
      1252.8 * xScaling,
      1384.5 * yScaling,
      1227.1000000000001 * xScaling,
      1357.1 * yScaling,
    );
    path.cubicTo(
      1140.4 * xScaling,
      1264.6 * yScaling,
      1091.0000000000002 * xScaling,
      1157.8999999999999 * yScaling,
      1091.0000000000002 * xScaling,
      1044.5 * yScaling,
    );
    path.cubicTo(
      1091.0000000000002 * xScaling,
      689.7 * yScaling,
      1573.9 * xScaling,
      402 * yScaling,
      2169.5 * xScaling,
      402 * yScaling,
    );
    path.cubicTo(
      2765.1 * xScaling,
      402 * yScaling,
      3248 * xScaling,
      689.7 * yScaling,
      3248 * xScaling,
      1044.5 * yScaling,
    );
    path.cubicTo(
      3248 * xScaling,
      1044.5 * yScaling,
      3248 * xScaling,
      1044.5 * yScaling,
      3248 * xScaling,
      1044.5 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
