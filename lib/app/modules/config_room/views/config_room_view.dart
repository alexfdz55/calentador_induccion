import 'package:calentador_induccion/app/modules/config_room/components/custom_container.dart';
import 'package:calentador_induccion/app/modules/config_room/components/potencia_widget.dart';
import 'package:calentador_induccion/app/modules/config_room/components/temperatura_widget.dart';
import 'package:calentador_induccion/app/modules/config_room/components/tiempo_widget.dart';
import 'package:calentador_induccion/app/modules/home/controllers/home_controller.dart';
import 'package:calentador_induccion/app/shared/responisve/responsive.dart';
import 'package:calentador_induccion/app/shared/widgets/custom_floating_button.dart';
import 'package:calentador_induccion/app/shared/widgets/icon_swicht_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/config_room_controller.dart';

class ConfigRoomView extends GetView<ConfigRoomController> {
  final _ = Get.put(ConfigRoomController());
  final homeController = Get.put(HomeController());
  final kColor = Get.theme.primaryColor;
  late Responsive responsive;

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Column(
          children: [
            Text('Configurações de Chuveiros'),
            Obx(
              () => Text('Quarto ${_.roomNumber.value + 1}'),
            ),
          ],
        ),
        actions: [
          Column(
            children: [
              IconSwitchTheme(),
              _statusWidget(),
            ],
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => CustomContainer(
                color: Colors.red,
                text: 'Potencia',
                value: _.getPotencia(),
                expandedWidget: Container(child: PotenciaWidget()),
              ),
            ),
            Obx(
              () => CustomContainer(
                // value: _.temperatura.value.toStringAsPrecision(3) + ' °C',
                value: _.getTemperatura(),
                color: Colors.orange,
                text: 'Temperatura',
                expandedWidget: TemperaturaWidget(),
              ),
            ),
            Obx(
              () => CustomContainer(
                  //value: _.tiempo.value.toString() + ' min',
                  value: _.getTiempo(),
                  color: Colors.green,
                  text: 'Tempo',
                  expandedWidget: TiempoWidget()),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButton(),
    );
  }

  _statusWidget() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            homeController.connected.value
                ? Container(
                    //color: Colors.red,
                    // padding: EdgeInsets.only(top: 20),
                    child: Icon(Icons.wifi_outlined),
                  )
                : Container(
                    child: Icon(Icons.wifi_off, color: Colors.red),
                  ),

            // homeController.connected ? Container() : SizedBox(width: 5),
            Container(
                height: homeController.connected.value ? 0 : 20,
                width: homeController.connected.value ? 0 : 30,
                //color: Colors.red,
                child: homeController.connected.value
                    ? Container()
                    : Container(
                        padding: EdgeInsets.only(right: 10),
                        //color: Colors.red,
                        height: 20,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )),
          ],
        ));
  }
}
