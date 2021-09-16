import 'package:calentador_induccion/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/config_room_controller.dart';

class ConfigRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfigRoomController>(
      () => ConfigRoomController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
