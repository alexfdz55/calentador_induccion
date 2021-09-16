import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketController extends GetxController {
  late String temperatura;
  late String potencia;
  late String tiempo;

  late IOWebSocketChannel channel;
  late bool connected; //boolean value to track if WebSocket is connected
  late bool ledstatus; //boolean value to track LED status, if its ON or OFF

  // String url = '192.168.0.1:81';
  String url = '192.168.0.1:81';
  String msg = '';

  @override
  void onInit() {
    initConection();
    super.onInit();
  }

  initConection() {
    msg = 'Conectando con: $url';
    ledstatus = false;
    connected = false; //initially connection status is "NO" so its FALSE

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
          print(message);
          if (message == "connected") {
            connected = true; //message is "connected" from NodeMCU
          }
          //
          else if (message == "poweron:success") {
            ledstatus = true;
          }
          //
          else if (message == "poweroff:success") {
            ledstatus = false;
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
          else {
            print(message);
          }
          update();
        },
        onDone: () {
          //if WebSocket is disconnected

          print("Web socket is closed");
          msg = 'Websocket se ha cerrado';
          connected = false;
          update();
        },
        onError: (error) {
          msg = 'No se ha podido conectar con el NodeMCU';
          update();
          print(error.toString());
        },
      );
    } catch (_) {
      msg = 'Error al conectar con el NodeMCU';
      print("error on connecting to websocket.");
    }
  }

  Future<void> sendcmd(String cmd) async {
    if (connected == true) {
      if (ledstatus == false && cmd != "poweron" && cmd != "poweroff") {
        print("Send the valid command");
      } else {
        channel.sink.add(cmd); //sending Command to NodeMCU
      }
    } else {
      channelconnect();
      print("Websocket is not connected.");
    }
  }

  Future<void> setTemp(String cmd) async {
    if (connected == true) {
      // if (ledstatus == false && cmd != "poweron" && cmd != "poweroff") {
      //   print("Send the valid command");
      // } else {
      //   //sending Command to NodeMCU
      // }              poweroff
      channel.sink.add("5dfgdfg");
    } else {
      channelconnect();
      print("Websocket is not connected.");
    }
  }
}
