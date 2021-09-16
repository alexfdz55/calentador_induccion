import 'package:calentador_induccion/app/modules/config_room/controllers/config_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TemperaturaWidget extends StatelessWidget {
  final _ = Get.put(ConfigRoomController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SleekCircularSlider(
        min: 33,
        max: 40,
        appearance: CircularSliderAppearance(
          customColors: CustomSliderColors(
            dotColor: Colors.white,
            progressBarColor: Colors.orange.shade100,
            progressBarColors: [
              Colors.redAccent,
              Colors.red,
              Colors.deepOrange,
              Colors.orange,
              Colors.orangeAccent
            ],
          ),
        ),
        initialValue: _.temperatura,
        onChange: (double value) {
          print(value);
        },
        onChangeStart: (double startValue) {
          // callback providing a starting value (when a pan gesture starts)
        },
        onChangeEnd: (double endValue) {
          _.temperatura = endValue;
          _.setRoomConfig();
        },
        innerWidget: (double value) {
          return Center(
            child: Container(
              child: Text(
                value.toStringAsPrecision(3),
                style: TextStyle(
                    color: Colors.orange,
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
