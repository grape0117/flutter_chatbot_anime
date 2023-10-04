import 'package:get/get.dart';

import '../controllers/pick_model_controller.dart';

class PickModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickModelController>(
      () => PickModelController(),
    );
  }
}
