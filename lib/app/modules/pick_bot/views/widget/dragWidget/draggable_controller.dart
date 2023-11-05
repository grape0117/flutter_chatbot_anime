import 'dart:ffi';

import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/CardsStackWidget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../model/Profile.dart';
import '../../../../../common/Swipe.dart' as Swipe;

class DraggableController extends GetxController
    with GetSingleTickerProviderStateMixin {
  CardsStackWidgetController get cardsStackWidgetController =>
      Get.find<CardsStackWidgetController>();

  // final left = Swipe.left;
  // final right = Swipe.right;
  // final none = Swipe.none;

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    initializeAnimation();
  }

  Future<void> initializeAnimation() async {
    animationController = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.0, end: 10.0 / 360).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    await animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  ValueNotifier swipeNotifier = ValueNotifier(Swipe.Swipe.none);
}
