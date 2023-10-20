import 'package:get/get.dart';

import '../controllers/no_model_controller.dart';

class NoModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoModelController>(
      () => NoModelController(),
    );
  }
}
