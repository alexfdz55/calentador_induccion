import 'package:calentador_induccion/app/modules/config_room/controllers/config_room_controller.dart';
import 'package:calentador_induccion/app/modules/config_room/views/config_room_view.dart';
import 'package:calentador_induccion/app/modules/rooms/views/rooms_view.dart';
import 'package:calentador_induccion/app/routes/app_pages.dart';
import 'package:calentador_induccion/app/shared/responisve/responsive.dart';
import 'package:calentador_induccion/app/shared/widgets/custom_button.dart';
import 'package:calentador_induccion/app/shared/widgets/custom_material_button.dart';
import 'package:calentador_induccion/app/shared/widgets/icon_swicht_theme.dart';
import 'package:calentador_induccion/app/shared/widgets/radial_progress.dart';
import 'package:calentador_induccion/app/shared/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  late Responsive responsive;

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _titulos(),
                SizedBox(height: 50),
                // TextTitle(title: 'Configurações de Chuveiros', fontSize: 25),
                // SizedBox(height: 50),

                _button()

                //_botonesRedondeados(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(0, 54, 101, 1.0),
            Color.fromRGBO(0, 37, 57, 1.0)
          ])),
    );

    final caja = Container(
      height: responsive.height < 700 ? responsive.hp(40) : responsive.hp(36),
      width: responsive.wp(90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(100)),
        gradient: LinearGradient(
          colors: [
            // Color.fromRGBO(20, 98, 188, 1.0),
            Colors.green.shade600,
            Colors.green,

            // Color.fromRGBO(20, 142, 172, 1.0)
          ],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              spreadRadius: 6.0,
              offset: Offset(1.0, 2.0))
        ],
      ),
    );

    return Stack(
      children: <Widget>[Positioned(top: -100, child: caja)],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        width: responsive.wp(90),
        //color: Colors.red,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hostal Caçari',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                IconSwitchTheme(),
              ],
            ),
            SizedBox(height: 10.0),
            Text('Controle de Chuveiros por indução electromagnética',
                style: TextStyle(color: Colors.white, fontSize: 25.0)),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    // return BotonGordo(
    //     icon: FontAwesomeIcons.bed,
    //     icon2: FontAwesomeIcons.bath,
    //     sizeIcon2: 100,
    //     color1: Get.theme.primaryColor,
    //     texto: 'Quartos',
    //     onPress: () {
    //       Get.to(RoomsView());
    //     });
    return Container(
      // color: Colors.blueGrey,
      height: responsive.height - 230,
      child: ListView.builder(
        itemBuilder: (__, index) {
          return BotonGordo(
              icon: FontAwesomeIcons.bed,
              icon2: FontAwesomeIcons.bath,
              sizeIcon2: 100,
              color1: Get.theme.primaryColor,
              texto: 'Quarto ' + (index + 1).toString(),
              onPress: () {
                final configController = Get.put(ConfigRoomController());

                Get.to(ConfigRoomView(),
                    transition: Transition.leftToRightWithFade);
                configController.roomNumber.value = index;
              });
        },
        itemCount: 6,
      ),
    );
  }
}



//Text('Configurações de Chuveiros')




