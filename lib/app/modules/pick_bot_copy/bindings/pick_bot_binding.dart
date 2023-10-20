import 'package:get/get.dart';

import '../controllers/pick_bot_controller.dart';

class PickBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickBotController>(
      () => PickBotController(),
    );
  }
}
