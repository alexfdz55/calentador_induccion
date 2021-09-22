import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class HomeController extends GetxController {
  late String temperatura;
  late String potencia;
  late String tiempo;

  DateTime date = DateTime.now();

  late IOWebSocketChannel channel;
  RxBool connected =
      false.obs; //boolean value to track if WebSocket is connected
  late bool ledstatus; //boolean value to track LED status, if its ON or OFF

  // String url = '192.168.0.1:81';
  String url = '192.168.0.1:81';
  String msg = '';

  @override
  void onInit() {
    ever(connected, (value) async {
      date = DateTime.now();
      //sendTimeNow();
      //print(date);
    });
    initConection();

    super.onInit();
  }

  initConection() {
    msg = 'Conectando con: $url';
    ledstatus = false;
    connected.value = false; //initially connection status is "NO" so its FALSE

    temperatura = "0"; //initial value of temperaturaerature
    potencia = "0"; //initial value of potencia
    tiempo = "0"; //initial value of tiempo

    Future.delayed(Duration.zero, () async {
      channelconnect(); //connect to WebSocket wth NodeMCU
    });
  }

  channelconnect() {
    //function to connect
    try {
      channel = IOWebSocketChannel.connect("ws://$url");
      //channel IP : Port
      channel.stream.listen(
        (message) {
          ////print(message);
          if (message == "connected") {
            connected.value = true; //message is "connected" from NodeMCU
          }
          //
          else if (message == "poweron:success") {
            ledstatus = true;
          }
          //
          else if (message == "poweroff:success") {
            ledstatus = false;
          } else {
            print(message);
          }

          //
          // else if (message.substring(0, 13) == "{'temperatura") {
          //   //check if the resonse has {'temperatura on it
          //   message = message.replaceAll(RegExp("'"), '"');
          //   Map<String, dynamic> jsondata =
          //       json.decode(message); //decode json to array
          //   temperatura = jsondata["temperatura"]; //temperaturaerature value
          //   potencia = jsondata["potencia"]; //potencia value
          //   tiempo = jsondata["tiempo"]; //tiempo value
          //   update();
          // }

          update();
        },
        onDone: () {
          //if WebSocket is disconnected

          //print("Web socket is closed");
          msg = 'Websocket se ha cerrado';
          connected.value = false;
          update();
          initConection();
        },
        onError: (error) {
          msg = 'No se ha podido conectar con el NodeMCU';
          update();
          //print(error.toString());
        },
      );
    } catch (_) {
      msg = 'Error al conectar con el NodeMCU';
      //print("error on connecting to websocket.");
    }
  }

  Future<void> sendcmd(String cmd) async {
    if (connected == true) {
      if (ledstatus == false && cmd != "poweron" && cmd != "poweroff") {
        //print("Send the valid command");
      } else {
        channel.sink.add(cmd); //sending Command to NodeMCU
      }
    } else {
      channelconnect();
      //print("Websocket is not connected.");
    }
  }

  Future<void> sendTimeNow() async {
    if (connected == true) {
      final n = potencia.length;
      final timeMap = {
        "year": date.year,
        "month": date.month,
        "day": date.day,
        "hour": date.hour,
        "minutes": date.minute,
        "seconds": date.second
      };
      print(timeMap);

      channel.sink.add(timeMap.toString());
    } else {
      channelconnect();
      //print("Websocket is not connected.");
    }
  }

  Future<void> setConfigRoom(
      {required String potencia,
      required String temperatura,
      required String tiempo,
      required String roomNumber}) async {
    if (connected == true) {
      final n = potencia.length;
      final configMap = {
        "roomNumber": roomNumber,
        "potencia": potencia.substring(potencia.indexOf(' '), n),
        "temperatura": temperatura,
        "tiempo": tiempo,
      };
      print(configMap);

      channel.sink.add(configMap.toString());
    } else {
      channelconnect();
      //print("Websocket is not connected.");
    }
  }
}
