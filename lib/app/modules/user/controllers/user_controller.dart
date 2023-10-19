import 'package:chat_gpt_flutter/app/modules/info/controllers/info_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../model/user.dart';
import '../../../model/user_info.dart';

class UserController extends GetxController {
  User _user = User(
      name: '',
      avatar: '',
      zodiac: '',
      history: {},
      credit: 10,
      premium_status: false);

  User get user => _user;

  // input-name

  TextEditingController textEditingController = TextEditingController();

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // pick avatar

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

  // pick zodiac
  RxList<bool> zodiacSelectedList = List.generate(12, (index) => false).obs;

  bool flag_zodiac = false;
  void updateZodiacSelection(int index) {
    for (var i = 0; i < zodiacSelectedList.length; i++) {
      if (i == index) {
        zodiacSelectedList[i] = true;
      } else {
        zodiacSelectedList[i] = false;
      }
    }
    flag_zodiac = true;
    print("zodiac $zodiacSelectedList[index]");
  }

  bool flag_edit = false;
}
