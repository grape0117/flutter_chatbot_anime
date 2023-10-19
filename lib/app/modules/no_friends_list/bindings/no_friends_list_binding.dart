import 'package:get/get.dart';

import '../controllers/no_friends_list_controller.dart';

class NoFriendsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoFriendsListController>(
      () => NoFriendsListController(),
    );
  }
}
