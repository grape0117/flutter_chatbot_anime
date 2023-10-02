import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../model/avatar_model.dart';

class AvatarsController extends GetxController {
  //TODO: Implement AvatarsController
  RxList<bool> isSelectedList = List.generate(12, (index) => false).obs;

  bool flag_avatar = false;
  void updateSelection(int index) {
    for (var i = 0; i < isSelectedList.length; i++) {
      if (i == index) {
        isSelectedList[i] = true;
      } else {
        isSelectedList[i] = false;
      }
    }
    flag_avatar = true;
    print("sdfsdf $isSelectedList[index]");
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
