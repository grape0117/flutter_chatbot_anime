import 'package:chat_gpt_flutter/app/common/bottomNavagation/bottomNavbar_Controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/CardModel.dart';

class NoModelController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // late AnimationController animationController;
  // late Animation<RelativeRect> animation;

  // @override
  // void onInit() {
  //   super.onInit();
  //   animationController = AnimationController(
  //     duration: Duration(seconds: 2),
  //     vsync: this,
  //   );
  //   animation = Tween<RelativeRect>(
  //     begin: RelativeRect.fromLTRB(0, 0, 0, 0),
  //     end: RelativeRect.fromLTRB(200, 200, 0, 0),
  //   ).animate(animationController);
  //   animationController.forward();
  // }

  // @override
  // void onClose() {
  //   animationController.dispose();
  //   super.onClose();
  // // }

  late AnimationController animationController;
  late List<Animation<Offset>> positionAnimations;
  late List<Animation<double>> angleAnimations;
  late int lastImageIndex = 3; // Index of the last image

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    positionAnimations = List.generate(4, (index) {
      return Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-1.0, 0.0),
      ).animate(animationController);
    });

    angleAnimations = List.generate(4, (index) {
      return Tween<double>(
        begin: 0.0,
        end: -0.5,
      ).animate(animationController);
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  List<CardModel> cards = [
    CardModel(
      id: '1',
      image: 'assets/Sprite/pick_model/avatar_1.png',
      title: 'Card 1',
      description: 'This is the first card',
    ),
    CardModel(
      id: '2',
      image: 'assets/Sprite/pick_model/avatar_2.png',
      title: 'Card 2',
      description: 'This is the second card',
    ),
    // Add more card objects as needed
  ];
}
