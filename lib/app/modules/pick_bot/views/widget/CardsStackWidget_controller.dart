// import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/dragWidget/draggable_controller.dart';
// import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/dragWidget/draggable_controller.dart'
//     as DragWidget;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_navigation/src/routes/default_transitions.dart';

// import '../../../chat_text/controllers/chat_text_controller.dart';
import '../../../../model/Profile.dart';
import '../../../../common/Swipe.dart' as Swipe;

class CardsStackWidgetController extends GetxController
    with GetSingleTickerProviderStateMixin {
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

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    initializeAnimation();
  }

  Future<void> initializeAnimation() async {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // models.removeLast();
        animationController.reset();
        swipeNotifier.value = Swipe.Swipe.none;
      }
    });
    // animation = Tween<double>(begin: 0.0, end: 10.0 / 360).animate(
    //     CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    await animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  // late AnimationController animationController;
  // late Animation<Offset> positionAnimation;
  // late Animation<double> angleAnimation;

  // @override
  // void onInit() {
  //   super.onInit();
  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(milliseconds: 500),
  //   );
  //   positionAnimation = Tween<Offset>(
  //     begin: Offset.zero,
  //     end: Offset(-1.0, 0.0),
  //   ).animate(animationController);
  //   angleAnimation = Tween<double>(
  //     begin: 0.0,
  //     end: -0.5,
  //   ).animate(animationController);
  // }

  // @override
  // void onClose() {
  //   animationController.dispose();
  //   super.onClose();
  // }

  ValueNotifier<Swipe.Swipe> swipeNotifier = ValueNotifier(Swipe.Swipe.none);
}
