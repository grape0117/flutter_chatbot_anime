import 'package:chat_gpt_flutter/app/common/bottomNavagation/bottomNavbar_Controller.dart';
import 'package:chat_gpt_flutter/app/modules/user/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InfoController extends GetxController {
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    UserController userController = Get.find();
    print('object ${userController.user.name}');
    super.onInit();
  }

  BottomNavbarController get bottomNavbarController =>
      Get.find<BottomNavbarController>();
}
