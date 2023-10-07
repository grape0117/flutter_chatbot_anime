import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InfoController extends GetxController {
  RxList<bool> isSelectedList = List.generate(4, (index) => false).obs;
  RxInt index = 0.obs;

  void updateSelection(int selectedindex) {
    index.value = selectedindex;
    print("DDDDDDDD $index  ");
    update();
  }
}
