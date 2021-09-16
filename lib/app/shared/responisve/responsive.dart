import 'dart:math';

import 'package:flutter/material.dart';

class Responsive {
  late double height, width, diagonal;
  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    this.height = size.height;
    this.width = size.width;
    this.diagonal = sqrt(pow(this.height, 2) + pow(this.width, 2));
  }

  double wp(double percent) => this.width * percent / 100;
  double hp(double percent) => this.height * percent / 100;
  double dp(double percent) => this.diagonal * percent / 100;

  double wDisponible(double percent, double ancho) =>
      (this.width - ancho) * percent / 100;

  double hpDisponible({required double percent, bool bottomBar = true}) {
    double h;
    if (bottomBar) {
      h = 160;
    } else {
      h = 110;
    }
    return (this.height - h) * percent / 100;
  }

  // double dp(double percent) => this.diagonal * percent / 100;
}
