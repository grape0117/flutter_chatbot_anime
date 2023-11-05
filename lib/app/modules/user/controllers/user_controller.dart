import 'package:chat_gpt_flutter/app/modules/info/controllers/info_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';

import '../../../model/user.dart';
import '../../../model/user_info.dart';

class UserController extends GetxController {
  // Initialization

  Future<void> onInit() async {
    super.onInit();
    await assignUserInfo();
    print('Here is init function ${user.name}');
    if (user.name != '') {
      print('already registered');
      // Get.toNamed(Routes.PICKBOT);
    } else {
      print('new member');
    }
  }

  Rx<User> _user = User(
          name: '',
          avatar: '',
          zodiac: '',
          history: {},
          credit: 10,
          premium_status: false)
      .obs;

  User get user => _user.value;

  // store local on the mobile
  void storeData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    print('Here is storeData');
  }

  // retrieve data from local
  Future<String?> retrieveData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('retrieveData $key is ${prefs.getString(key)}');
    return prefs.getString(key);
  }

  //  clear local stroage
  Future<void> clearLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('localStorage is cleared');
  }

  // assign user info
  Future<void> assignUserInfo() async {
    String? username = await retrieveData('user_name');
    String? useravatar = await retrieveData('user_avatar');
    String? userzodiac = await retrieveData('user_zodiac');
    String? userhistory = await retrieveData('user_history');
    String? usercredit = await retrieveData('user_credit');
    String? userpremiumstatus = await retrieveData('userpremiumstatus');

    _user.value = User(
      name: username ?? '',
      avatar: useravatar ?? '',
      zodiac: userzodiac ?? '',
      history: _user.value.history,
      credit: _user.value.credit,
      premium_status: _user.value.premium_status,
    );
  }

  // input-name
  bool edit_flag = false;
  RxBool disableNameButton = true.obs;
  TextEditingController textEditingController = TextEditingController();

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // pick avatar

  RxList<bool> isSelectedList = List.generate(12, (index) => false).obs;
  RxBool disableAvatarButton = true.obs;

  void updateSelection(int index) {
    for (var i = 0; i < isSelectedList.length; i++) {
      if (i == index) {
        isSelectedList[i] = true;
      } else {
        isSelectedList[i] = false;
      }
    }
    print("sdfsdf $isSelectedList[index]");
  }

  // pick zodiac
  RxList<bool> zodiacSelectedList = List.generate(12, (index) => false).obs;
  RxBool disableZodiacButton = true.obs;

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
