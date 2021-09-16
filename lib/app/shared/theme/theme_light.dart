import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  return ThemeData(
    //Colores

    canvasColor: Colors.grey.shade200,
    cardColor: Colors.white,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.green, //Color azul
    hintColor: Color(0xff9D9D9D), //COlor opaco

    // //accentColor: Colors.white, //Color(0xff5692FF),
    // errorColor: Color(0xffE94040),

    //AppBar
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        //color: Colors.black,
        actionsIconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6:
              TextStyle(color: Colors.white, fontSize: 20), //Letra blanca
        )),
  );
}
