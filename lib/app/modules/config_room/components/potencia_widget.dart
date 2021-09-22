import 'package:calentador_induccion/app/modules/config_room/controllers/config_room_controller.dart';
import 'package:calentador_induccion/app/shared/responisve/responsive.dart';
import 'package:custom_radio_grouped_button/CustomButtons/ButtonTextStyle.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PotenciaWidget extends StatelessWidget {
  final _ = Get.put(ConfigRoomController());
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    print(_.potencia);
    return //RadioButton();
        Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: CustomRadioButton(
        enableShape: true,
        elevation: 0,
        defaultSelected: _.potencia,
        enableButtonWrap: true,
        width: 130,
        autoWidth: false,
        selectedBorderColor: Colors.red,
        unSelectedBorderColor: Colors.grey,
        unSelectedColor: Theme.of(context).canvasColor,
        buttonTextStyle: ButtonTextStyle(
            textStyle: TextStyle(
                fontSize: responsive.optionDevice(
                    mobileOption: responsive.wp(3),
                    tabletOption: 15.0,
                    desktopOption: 15.0)),
            selectedColor: Colors.white,
            unSelectedColor: Get.textTheme.bodyText1!.color!),
        buttonLables: _.potencias,
        buttonValues: _.potencias,
        radioButtonValue: (value) {
          _.potencia = value.toString();
          _.setRoomConfig();
        },
        selectedColor: Colors.red,
      ),
    );
  }
}
