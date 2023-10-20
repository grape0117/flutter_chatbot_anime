import 'dart:ffi';

import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/CardsStackWidget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../model/Profile.dart';

class DraggableController extends GetxController {
  CardsStackWidgetController get cardsStackWidgetController =>
      Get.find<CardsStackWidgetController>();

  // AnimationController _controller;1

  // void inInit() {
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 1),
  //   );
  //   super.onInit();
  // }
}
