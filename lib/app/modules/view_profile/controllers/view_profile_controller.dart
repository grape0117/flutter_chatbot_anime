import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:chat_gpt_flutter/app/model/Profile.dart';

class ViewProfileController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  //TODO: Implement InputNameController
  List<Profile> currentProfile = [
    Profile(
        name: '',
        description: '',
        avatarAsset: '',
        zodiacAsset: '',
        message: '')
  ];

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
