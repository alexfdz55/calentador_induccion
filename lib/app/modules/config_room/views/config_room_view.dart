import 'package:calentador_induccion/app/modules/config_room/components/custom_container.dart';
import 'package:calentador_induccion/app/modules/config_room/components/potencia_widget.dart';
import 'package:calentador_induccion/app/modules/config_room/components/temperatura_widget.dart';
import 'package:calentador_induccion/app/modules/config_room/components/tiempo_widget.dart';
import 'package:calentador_induccion/app/shared/responisve/responsive.dart';
import 'package:calentador_induccion/app/shared/widgets/custom_floating_button.dart';
import 'package:calentador_induccion/app/shared/widgets/icon_swicht_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/config_room_controller.dart';

class ConfigRoomView extends GetView<ConfigRoomController> {
  final _ = Get.put(ConfigRoomController());
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
          IconSwitchTheme(),
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
}
