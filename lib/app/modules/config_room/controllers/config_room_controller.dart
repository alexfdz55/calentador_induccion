import 'package:calentador_induccion/app/shared/models/room_model.dart';
import 'package:calentador_induccion/app/shared/share_prefs/preferencias_usuario.dart';
import 'package:get/get.dart';

class ConfigRoomController extends GetxController {
  final prefs = PreferenciasUsuario();

  RxList rooms = [].obs;
  var roomNumber = 1.obs;

  List<String> potencias = [];
  var potencia = '';

  double temperatura = 36.0;
  double value = 10;
  int tiempo = 10;

  @override
  void onInit() {
    for (var i = 0; i < 10; i++) {
      potencias.add('Potencia ${i + 1}');
    }
    potencia = potencias[0];

    if (prefs.potencias.length == 0) {
      initFirst();
    } else {
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
  }

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
}
