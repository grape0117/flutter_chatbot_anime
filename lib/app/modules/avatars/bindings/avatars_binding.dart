import 'package:get/get.dart';

import '../controllers/avatars_controller.dart';

class AvatarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AvatarsController>(
      () => AvatarsController(),
    );
  }
}
