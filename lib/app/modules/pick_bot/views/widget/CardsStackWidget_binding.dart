import 'package:get/get.dart';

import 'CardsStackWidget_controller.dart';

class CardsStackWidgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardsStackWidgetController>(
      () => CardsStackWidgetController(),
    );
  }
}
