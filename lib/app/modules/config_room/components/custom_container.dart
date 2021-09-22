import 'package:calentador_induccion/app/data/colors_text.dart';
import 'package:calentador_induccion/app/shared/responisve/responsive.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String value;
  final Color color;
  final Widget expandedWidget;

  CustomContainer(
      {required this.text,
      required this.color,
      required this.expandedWidget,
      required this.value});

  late Responsive responsive;
  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: isLight
              ? Theme.of(context).backgroundColor
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: this.color,
                blurRadius: 3.0,
                spreadRadius: 2.0,
                offset: Offset(1.0, 2.0))
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        // padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        width: responsive.wp(80),
        child: MaterialButton(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 5, color: this.color),
              borderRadius: BorderRadius.circular(20.0)),
          child: Center(
            child: Column(
              children: [
                Text(
                  this.text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  this.value,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ExpandablePanel(
                    header: Padding(
                        padding: EdgeInsets.only(top: 7),
                        child: Text('Configurar')),
                    theme: ExpandableThemeData(
                      iconColor: Get.textTheme.bodyText1!.color!,
                      iconSize: 20,
                      expandIcon: FontAwesomeIcons.arrowRight,
                    ),
                    collapsed: Text(''),
                    expanded: this.expandedWidget),
              ],
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
