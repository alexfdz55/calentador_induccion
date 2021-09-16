import 'package:get/get.dart';

import '../controllers/config_room_controller.dart';

class ConfigRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfigRoomController>(
      () => ConfigRoomController(),
    );
  }
}
