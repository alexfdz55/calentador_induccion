import 'package:get/get.dart';

import 'package:calentador_induccion/app/modules/config_room/bindings/config_room_binding.dart';
import 'package:calentador_induccion/app/modules/config_room/views/config_room_view.dart';
import 'package:calentador_induccion/app/modules/home/bindings/home_binding.dart';
import 'package:calentador_induccion/app/modules/home/views/home_view.dart';
import 'package:calentador_induccion/app/modules/rooms/bindings/rooms_binding.dart';
import 'package:calentador_induccion/app/modules/rooms/views/rooms_view.dart';
import 'package:calentador_induccion/app/modules/web_socket/bindings/web_socket_binding.dart';
import 'package:calentador_induccion/app/modules/web_socket/views/web_socket_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROOMS,
      page: () => RoomsView(),
      binding: RoomsBinding(),
    ),
    GetPage(
      name: _Paths.CONFIG_ROOM,
      page: () => ConfigRoomView(),
      binding: ConfigRoomBinding(),
    ),
    GetPage(
      name: _Paths.WEB_SOCKET,
      page: () => WebSocketView(),
      binding: WebSocketBinding(),
    ),
  ];
}
