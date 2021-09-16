import 'package:calentador_induccion/app/modules/config_room/controllers/config_room_controller.dart';
import 'package:calentador_induccion/app/modules/config_room/views/config_room_view.dart';

import 'package:calentador_induccion/app/shared/responisve/responsive.dart';
import 'package:calentador_induccion/app/shared/widgets/custom_button.dart';
import 'package:calentador_induccion/app/shared/widgets/icon_swicht_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _ = Get.put(HomeController());
  late Responsive responsive;

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: appBar(),
        body: _buttons(),
        // body: Stack(
        //   children: <Widget>[
        //     _fondoApp(),
        //     SingleChildScrollView(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           _titulos(),
        //           SizedBox(height: 50),
        //           // TextTitle(title: 'Configurações de Chuveiros', fontSize: 25),
        //           // SizedBox(height: 50),

        //           _button()

        //           //_botonesRedondeados(context),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }

  appBar() {
    return AppBar(
      title: _titulos(),
      toolbarHeight: 200,
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            gradient: LinearGradient(colors: [
              //Colors.green.shade600,
              Colors.green.shade800,
              Colors.green,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      ),
    );
  }

  _titulos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
        Text('Controle de Chuveiros por \nindução electromagnética',
            style: TextStyle(color: Colors.white, fontSize: 25.0)),
        //SizedBox(height: 10.0),
        Row(
          children: [
            Spacer(),
            _statusWidget(),
            SizedBox(
              width: 10,
            )
          ],
        ),
        //SizedBox(height: 10.0),
      ],
    );
  }

  _statusWidget() {
    final fontSize = 14.0;
    return Row(
      children: [
        _.connected.value
            ? Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Icon(Icons.wifi_outlined),
                    SizedBox(width: 10),
                    Text(
                      " Conectado",
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ))
            : Container(
                child: Row(
                  children: [
                    Icon(Icons.wifi_off, color: Colors.red),
                    SizedBox(width: 10),
                    Text(
                      " Desconectado",
                      style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
              ),
        SizedBox(width: 20),
        Container(
            height: _.connected.value ? 0 : 40,
            width: _.connected.value ? 0 : 180,
            //color: Colors.red,
            child: _.connected.value
                ? Container()
                : Container(
                    //color: Colors.red,
                    height: 30,
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tentando se conectar',
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
      ],
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

  Widget _titulos2() {
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

  Widget _buttons() {
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
      //height: responsive.height - 230,
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




