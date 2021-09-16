import 'package:calentador_induccion/app/shared/responisve/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ButtonAzul extends StatelessWidget {
  final String title;
  final Callback onPressed;
  final double height;
  final double fontSize;
  final double paddingH;
  final double paddingV;
  final Color? color;

  ButtonAzul({
    required this.title,
    required this.onPressed,
    this.height = 60,
    this.fontSize = 23,
    this.paddingH = 20,
    this.paddingV = 10,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: this.paddingH, vertical: this.paddingV),
        child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            height: this.height,
            minWidth: responsive.width,
            color: this.color,
            elevation: 6,
            padding: EdgeInsets.all(7.0),
            child: Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: this.fontSize, fontWeight: FontWeight.w900),
            ),
            onPressed: this.onPressed),
      ),
      //),
    );
  }
}
