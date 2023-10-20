import 'package:chat_gpt_flutter/app/model/Profile.dart';
import 'package:chat_gpt_flutter/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';

import 'package:chat_gpt_flutter/app/routes/app_pages.dart';

import '../../modules/pick_bot/views/pick_bot_view.dart';
import '../../modules/no_friends_list/views/no_friends_list_view.dart';

class BottomNavbarController extends GetxController {
  UserController get userController => Get.find<UserController>();

  RxList<bool> isSelectedList = List.generate(4, (index) => false).obs;
  RxInt index = 0.obs;

  void updateSelection(int selectedindex) {
    index.value = selectedindex;
    print("BottomNavbar $index  ");
    if (index.value == 0) {
      Get.to(() => PickBotView(
            profile: Profile(
                name: 'name',
                description: 'description',
                avatarAsset: 'avatarAsset',
                zodiacAsset: 'zodiacAsset',
                message: 'message'),
          ));
    } else if (index.value == 1) {
      // Get.toNamed(Routes.NOFRIENDSLIST);
      Get.to(() => NoFriendsListView());
    } else if (index.value == 2) {
      Get.toNamed(Routes.PURCHASE);
    } else {
      Get.toNamed(Routes.INFO);
    }
    update();
  }
}
