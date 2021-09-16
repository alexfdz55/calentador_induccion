import 'package:calentador_induccion/app/modules/config_room/controllers/config_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TiempoWidget extends StatelessWidget {
  final _ = Get.put(ConfigRoomController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SleekCircularSlider(
        min: 5,
        max: 60,
        appearance: CircularSliderAppearance(
          customColors: CustomSliderColors(
            dotColor: Colors.white,
            progressBarColor: Colors.orange.shade100,
            progressBarColors: [
              Colors.green.shade900,
              Colors.green.shade700,
              Colors.green.shade500,
              Colors.green.shade300,
              Colors.green.shade100,
            ],
          ),
        ),
        initialValue: _.tiempo + 0.0,
        onChange: (double value) {
          print(value);
        },
        onChangeStart: (double startValue) {
          // callback providing a starting value (when a pan gesture starts)
        },
        onChangeEnd: (double endValue) {
          _.tiempo = endValue.toInt();
          _.setRoomConfig();
        },
        innerWidget: (double value) {
          return Center(
            child: Container(
              child: Text(
                value.round().toString(),
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
          // use your custom widget inside the slider (gets a slider value from the callback)
        },
      ),
    );
  }
}
