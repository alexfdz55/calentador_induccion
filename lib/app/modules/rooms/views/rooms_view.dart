import 'package:calentador_induccion/app/modules/config_room/controllers/config_room_controller.dart';
import 'package:calentador_induccion/app/modules/config_room/views/config_room_view.dart';
import 'package:calentador_induccion/app/routes/app_pages.dart';
import 'package:calentador_induccion/app/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/rooms_controller.dart';

class RoomsView extends GetView<RoomsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações de Chuveiros'),
        centerTitle: true,
      ),
      body: ListView.builder(
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
                configController.roomNumber.value = index + 1;
              });
        },
        itemCount: 6,
      ),
    );
  }
}
