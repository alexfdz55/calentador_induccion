import 'package:calentador_induccion/app/modules/web_socket/controllers/web_socket_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WebSocketView extends StatelessWidget {
  final _ = Get.put(WebSocketController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebSocketController>(
      init: WebSocketController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Prueba lectura - escritura de datos esp86"),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter, //inner widget alignment to center
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                statusWidget(),
                SizedBox(height: 10),
                readDataWidget(),
                SizedBox(height: 40),
                ledWidget(),
                ElevatedButton(
                  child: Text('Test'),
                  onPressed: () => _.setTemp('cmd'),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: _.initConection,
        ),
      ),
    );
  }

  readDataWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Lectura de datos",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.flash_on_outlined,
              color: Colors.blue,
              size: 30,
            ),
            title: Text(
              "A0: ${_.temperatura}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              color: Colors.blue,
              size: 30,
            ),
            title: Text("Incremento: ${_.potencia}",
                style: TextStyle(fontSize: 20)),
          ),
          ListTile(
            leading: Icon(
              Icons.exposure_minus_1,
              color: Colors.blue,
              size: 30,
            ),
            title:
                Text("Decremento: ${_.tiempo}", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  ledWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          Text(
            "Controlar Led",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 20),
          _.ledstatus
              ? Icon(FontAwesomeIcons.lightbulb, color: Colors.black, size: 80)
              : Icon(FontAwesomeIcons.solidLightbulb,
                  color: Colors.yellow, size: 80),
          SizedBox(height: 20),
          Text(
            _.ledstatus ? "Led apagado" : "Led encendido",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          SizedBox(height: 20),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            //button to start scanning
            color: _.ledstatus ? Colors.green : Colors.redAccent,
            colorBrightness: Brightness.dark,
            onPressed: () {
              //on button press
              if (_.ledstatus) {
                //if ledstatus is true, then turn off the led
                //if led is on, turn off
                _.sendcmd("poweroff");
                _.ledstatus = false;
              } else {
                //if ledstatus is false, then turn on the led
                //if led is off, turn on
                _.sendcmd("poweron");
                _.ledstatus = true;
              }
              _.update();
            },
            child: _.ledstatus ? Text("Encender Led") : Text("Apagar Led"),
          ),
        ],
      ),
    );
  }

  statusWidget() {
    return Column(
      children: [
        _.connected
            ? Text(
                "WEBSOCKET: Conectado",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              )
            : Text(
                "WEBSOCKET: Desconectado",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
        SizedBox(height: 30),
        _.connected
            ? Container()
            : Text(
                _.msg,
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
        SizedBox(height: 20),
        Container(
          height: _.connected ? 0 : 50,
          width: _.connected ? 0 : 50,
          // color: Colors.green,
          child: _.connected ? Container() : CircularProgressIndicator(),
        ),
      ],
    );
  }
}
