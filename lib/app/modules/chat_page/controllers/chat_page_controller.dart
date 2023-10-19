import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChatPageController extends GetxController {
  TextEditingController textEditingController = TextEditingController();

  // Function to retrieve the value of the text field
  void dispose() {
    textEditingController.dispose();
    super.dispose();
    print("DDDDD $textEditingController");
  }

  //TODO: Implement InputNameController
}
