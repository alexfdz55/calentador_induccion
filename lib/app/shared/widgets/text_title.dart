import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final double fontSize;
  final bool centerText;
  double marginLeft;

  TextTitle(
      {required this.title,
      this.color,
      this.marginLeft = 0,
      required this.fontSize,
      this.centerText = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.title,
        textAlign: this.centerText ? TextAlign.center : null,
        style: TextStyle(color: this.color, fontSize: this.fontSize),
      ),
    );
  }
}
