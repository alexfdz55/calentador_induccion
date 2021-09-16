import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double height;
  final double width;
  final double fontSize;
  final Color color;

  CustomMaterialButton(
      {required this.title,
      required this.onPressed,
      this.height = 30,
      this.fontSize = 15,
      this.width = 30,
      this.color = Colors.green});

  late Size size;

  @override
  Widget build(BuildContext context) {
    //final kColor = Theme.of(context).primaryColor;

    return MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        height: this.height,
        minWidth: this.width,
        //color: Colors.black,
        elevation: 6,
        padding: EdgeInsets.all(7.0),
        child: Text(
          this.title,
          style: TextStyle(
              //color: Colors.white,
              fontSize: this.fontSize,
              fontWeight: FontWeight.w900),
        ),
        onPressed: this.onPressed());
  }
}
