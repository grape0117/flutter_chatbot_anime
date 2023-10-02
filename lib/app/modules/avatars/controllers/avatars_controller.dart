import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AvatarsController extends GetxController {
  //TODO: Implement AvatarsController

  Rx<Color> borderColor = Colors.transparent.obs;
  Rx<double> borderWidth = 1.0.obs;

  void updateBorderStyle(Color color, double width) {
    borderColor.value = color;
    borderWidth.value = width;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
