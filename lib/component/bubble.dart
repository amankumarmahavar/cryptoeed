import 'dart:ui';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final double width, height;
  final double leftMargin, rightMargin, topMargin, downMargin;
  Bubble(
      {required this.width,
      required this.height,
      this.leftMargin = 0,
      this.rightMargin = 0,
      this.downMargin = 0,
      this.topMargin = 0});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.only(
            left: leftMargin,
            right: rightMargin,
            top: topMargin,
            bottom: downMargin),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade700, Colors.orange.shade500],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
