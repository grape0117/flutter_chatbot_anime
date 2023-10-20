import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/dragWidget/draggable_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../chat_text/controllers/chat_text_controller.dart';
import '../../../../model/Profile.dart';

enum Swipe { left, right, none }

class MyAnimationController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;

  final RelativeRectTween relativeRectTween = RelativeRectTween(
    begin: const RelativeRect.fromLTRB(40, 40, 0, 0),
    end: const RelativeRect.fromLTRB(0, 0, 40, 40),
  );

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

class CardsStackWidgetController extends GetxController {
  // DraggableController draggableController = Get.find<DraggableController>();
  // ChatTextController chatTextController = Get.find();

  final List<Profile> models = [
    Profile(
        name: 'Belliville',
        description:
            'The female pirate captain of the grand pirate crew, her hobbies are drinking, adventuring, and robbing young handsome men. She can handle much more than she appears.',
        avatarAsset: 'assets/Sprite/pick_model/avatar_1.png',
        zodiacAsset: 'assets/Sprite/zodiac/img_constellation_Cancer.png',
        message: 'Hello World!'),
    Profile(
        name: 'Sarah',
        description:
            'Maintaining a career and a relationship might be challenging, but after coming home to an empty bed too many times, I am willing to take on that challenge. Are you?',
        avatarAsset: 'assets/Sprite/pick_model/avatar_2.png',
        zodiacAsset: 'assets/Sprite/zodiac/img_constellation_Cancer.png',
        message:
            'There is not so much perfection in the world but my surname stars with P.'),
    Profile(
        name: 'Arpros',
        description:
            "It's hard to find any anyone more workaholic than her. According to her colleagues' descriptions, they hardly ever come accross her outside the company. Does she not even stroll around the streets?",
        avatarAsset: 'assets/Sprite/pick_model/avatar_3.png',
        zodiacAsset: 'assets/Sprite/zodiac/img_constellation_Cancer.png',
        message: 'What can I do for you?'),
    Profile(
        name: 'Vivian',
        description:
            "The class president, a somewhat hot-tempered catgirl, always gives off a serious and assertive vibe, but deep inside, she surprisingly becomes easily shy.",
        avatarAsset: 'assets/Sprite/pick_model/avatar_4.png',
        zodiacAsset: 'assets/Sprite/zodiac/img_constellation_Cancer.png',
        message:
            "Hmph! Don't get the wrong idea. I'm not tutoring you because I care about you."),
  ].obs;
}
