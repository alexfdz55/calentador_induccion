import 'package:calentador_induccion/app/modules/config_room/controllers/config_room_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<ConfigRoomController>(
      () => ConfigRoomController(),
    );
  }
}
