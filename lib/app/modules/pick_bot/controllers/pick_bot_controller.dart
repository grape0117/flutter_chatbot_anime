import 'package:chat_gpt_flutter/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:chat_gpt_flutter/app/routes/app_pages.dart';

import '../../../model/Profile.dart';
import '../../../modules/user/controllers/user_controller.dart';

class PickBotController extends GetxController {
  // UserController userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    // checkPremium();
  }

  @override
  void onReady() {
    super.onReady();
    print('>>>>>>>>>>>>>>>>>');
  }

  // void checkPremium() {
  //   Future.delayed(Duration(seconds: 3), () {
  //     if (userController.user.premium_status == false) {
  //       Get.toNamed(Routes.PREMIUM);
  //       // print('HEre');
  //     } else {
  //       return;
  //     }
  //   });
  // }
}
