import 'package:calentador_induccion/app/modules/config_room/controllers/config_room_controller.dart';
import 'package:calentador_induccion/app/modules/config_room/views/config_room_view.dart';
import 'package:calentador_induccion/app/modules/rooms/views/rooms_view.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomFloatingButton extends StatelessWidget {
  final configController = Get.put(ConfigRoomController());
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Builder(
      builder: (context) => FabCircularMenu(
        // Cannot be `Alignment.center`
        alignment: Alignment.bottomRight,
        ringColor: Colors.green,
        ringDiameter: 400.0,
        ringWidth: 100.0,
        fabSize: 64.0,
        fabElevation: 8.0,
        fabIconBorder: CircleBorder(),
        // Also can use specific color based on wether
        // the menu is open or not:
        // fabOpenColor: Colors.white
        // fabCloseColor: Colors.white
        // These properties take precedence over fabColor
        fabColor: Get.theme.primaryColor,
        fabOpenIcon: Icon(Icons.menu, color: Colors.white),
        fabCloseIcon: Icon(Icons.close, color: Colors.white),
        fabMargin: const EdgeInsets.all(16.0),
        animationDuration: const Duration(milliseconds: 800),
        animationCurve: Curves.easeInOutCirc,
        onDisplayChange: (isOpen) {
          print("The menu is ${isOpen ? "open" : "closed"}");
        },
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              configController.roomNumber.value = 0;
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.looks_one, color: Colors.white),
          ),
          RawMaterialButton(
            onPressed: () {
              configController.roomNumber.value = 1;
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.looks_two, color: Colors.white),
          ),
          RawMaterialButton(
            onPressed: () {
              configController.roomNumber.value = 2;
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.looks_3, color: Colors.white),
          ),
          RawMaterialButton(
            onPressed: () {
              configController.roomNumber.value = 3;
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.looks_4, color: Colors.white),
          ),
          RawMaterialButton(
            onPressed: () {
              configController.roomNumber.value = 4;
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.looks_5, color: Colors.white),
          ),
          RawMaterialButton(
            onPressed: () {
              configController.roomNumber.value = 5;
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.looks_6, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 60,
      child: Stack(
        children: [
          Icon(
            FontAwesomeIcons.bed,
            size: 40,
            color: Colors.white,
          ),
          Positioned(
              bottom: 0,
              child: Text(
                '1',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
