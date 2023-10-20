import 'package:chat_gpt_flutter/app/common/bottomNavagation/bottomNavbar_Controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NoModelController extends GetxController {
  BottomNavbarController get bottomNavbarController =>
      Get.find<BottomNavbarController>();
}
