import 'package:get/get.dart';

import '../controllers/web_socket_controller.dart';

class WebSocketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebSocketController>(
      () => WebSocketController(),
    );
  }
}
