import 'package:calentador_induccion/app/modules/home/controllers/home_controller.dart';
import 'package:calentador_induccion/app/shared/models/room_model.dart';
import 'package:calentador_induccion/app/shared/share_prefs/preferencias_usuario.dart';
import 'package:get/get.dart';

class ConfigRoomController extends GetxController {
  final prefs = PreferenciasUsuario();

  final homeController = Get.put(HomeController());

  RxList rooms = [].obs;
  var roomNumber = 1.obs;

  List<String> potencias = [];
  var potencia = '';

  double temperatura = 36.0;
  int tiempo = 10;

  @override
  void onInit() {
    for (var i = 0; i < 10; i++) {
      potencias.add('Potencia ${i + 1}');
    }

    ever(roomNumber, (value) async {
      print(roomNumber.value);
      if (prefs.potencias.length != 0) {}
      {
        //rint(roomNumber);
        potencia = prefs.potencias[roomNumber.value];
        temperatura = double.parse(prefs.temperaturas[roomNumber.value]);
        tiempo = int.parse(prefs.tiempos[roomNumber.value]);
        for (var i = 0; i < 6; i++) {
          rooms.add(
            Room(
              potencia: prefs.potencias[i],
              temperatura: double.parse(prefs.temperaturas[i]),
              tiempo: int.parse(prefs.tiempos[i]),
            ),
          );
        }
      }
    });

    if (prefs.potencias.length == 0) {
      potencia = potencias[0];
      print('asdasdas');
      initFirst();
    }
    print('potencia: ${prefs.potencias[0]}');
    print('temp: $temperatura');
    print('tiempo: $tiempo');

    super.onInit();
  }

  initFirst() {
    for (var i = 0; i < 6; i++) {
      rooms.add(
        Room(
          potencia: 'Potencia 1',
          temperatura: 36,
          tiempo: 10,
        ),
      );
    }
  }

  setRoomConfig() {
    print('potencia: $potencia');
    print('temp: $temperatura');
    print('tiempo: $tiempo');
    rooms[roomNumber.value] =
        Room(potencia: potencia, temperatura: temperatura, tiempo: tiempo);

    List<String> pot = [];
    List<String> temp = [];
    List<String> tiem = [];

    for (Room room in rooms) {
      pot.add(room.potencia);
      temp.add(room.temperatura.toString());
      tiem.add(room.tiempo.toString());
    }
    prefs.potencias = pot;
    prefs.temperaturas = temp;
    prefs.tiempos = tiem;
    homeController.setTemp((tiempo * 10).toString());
  }

  // setTemperatura() {
  //   rooms[roomNumber.value] =
  //       Room(potencia: potencia, temperatura: temperatura, tiempo: tiempo);

  //   List<String> temp = [];

  //   for (Room room in rooms) {
  //     temp.add(room.temperatura.toString());
  //   }
  //   prefs.temperaturas = temp;

  // }

  // setTiempo() {
  //   rooms[roomNumber.value] =
  //       Room(potencia: potencia, temperatura: temperatura, tiempo: tiempo);

  //   List<String> tiem = [];
  //   for (Room room in rooms) {
  //     tiem.add(room.tiempo.toString());
  //   }
  //   prefs.tiempos = tiem;
  //   //homeController.setTemp((tiempo * 10).toString());
  // }

  getPotencia() {
    Room room = rooms[roomNumber.value];
    return room.potencia;
  }

  getTemperatura() {
    Room room = rooms[roomNumber.value];
    return room.temperatura.toStringAsPrecision(3) + ' °C';
  }

  getTiempo() {
    Room room = rooms[roomNumber.value];
    return room.tiempo.toString() + ' min';
  }

  getTemperaturaDouble() {
    Room room = rooms[roomNumber.value];
    return room.temperatura;
  }

  getTiempoInt() {
    Room room = rooms[roomNumber.value];
    return room.tiempo;
  }
}
