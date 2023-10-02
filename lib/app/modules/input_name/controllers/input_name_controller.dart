import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InputNameController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  // Function to retrieve the value of the text field
  void dispose() {
    textEditingController.dispose();
    super.dispose();
    print("DDDDD");
  }

  //TODO: Implement InputNameController
  String username = '';

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
