import 'package:get/get.dart';

import 'draggable_controller.dart';

class DraggableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DraggableController>(
      () => DraggableController(),
    );
  }
}
