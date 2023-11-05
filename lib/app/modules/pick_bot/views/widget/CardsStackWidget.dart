// import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
// import 'package:chat_gpt_flutter/app/model/Profile.dart';
// import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/CardsStackWidget_controller.dart';
// import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/dragWidget/draggable_controller.dart';
// import 'package:chat_gpt_flutter/app/modules/pick_bot_copy/widget%20copy/CardsStackWidget_.dart';
import 'package:chat_gpt_flutter/app/model/Profile.dart';
import 'package:chat_gpt_flutter/app/modules/chat_page/controllers/chat_page_controller.dart';
import 'package:chat_gpt_flutter/app/modules/chat_page/views/chat_page_view.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/controllers/chat_text_controller.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/views/chat_text_view.dart';
import 'package:chat_gpt_flutter/app/modules/no_model/controllers/no_model_controller.dart';
import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/dragWidget/draggable_controller.dart';
// import 'package:chat_gpt_flutter/app/modules/chat_text/views/chat_text_view.dart';
import 'package:chat_gpt_flutter/app/modules/view_profile/views/view_profile_view.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import '../../../../model/Profile.dart';
// import '../../controllers/pick_bot_controller.dart';
// import 'profileCard.dart';
// import '../../../chat_page/views/chat_page_view.dart';

import '../widget/dragWidget/draggable_view.dart';
import 'CardsStackWidget_controller.dart';
// import '../../../view_profile/views/view_profile_view.dart';
import '../../../chat_text/views/chat_text_view.dart';
import '../../../chat_text/controllers/chat_text_controller.dart';
import '../../../no_model/views/no_model_view.dart';
import '../../../pick_bot/controllers/pick_bot_controller.dart';
import '../../../../common/Swipe.dart' as Swipe;

class CardsStackWidget extends GetView<CardsStackWidgetController> {
  CardsStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CardsStackWidgetController());

    return Stack(
      children: [
        Container(
          child: Obx(
            () => Stack(
              children: List.generate(
                controller.models.length,
                (index) => DraggableView(index: index),
                // ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 50,
          right: 50,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          print('----------skip');
                          DraggableController draggableController = Get.find();

                          controller.models.removeLast();
                          print(controller.models.length);
                          if (controller.models.length == 0) {
                            controller.models.add(Profile(
                                name: '',
                                description: '',
                                avatarAsset: '',
                                zodiacAsset: '',
                                message: ''));
                            Get.put(NoModelController());
                            Get.to(() => NoModelView());
                            controller.models.removeLast();
                          }
                        },
                        child: Image.asset(
                          'assets/Sprite/pick_model/profile_btn_dislike_bg.png',
                          width: 35,
                          height: 35,
                        ))),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print(
                          '--------------like -----  ${controller.models.length}');
                      print('object');
                      controller.swipeNotifier.value = Swipe.Swipe.left;
                      controller.animationController;
                      Get.put(ChatTextController());
                      Get.to(() => ChatTextView(
                          profile:
                              controller.models[controller.models.length - 1]));
                    },
                    child: Image.asset(
                      'assets/Sprite/pick_model/profile_bgn_like_bg.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('--------------back');
                    },
                    child: Image.asset(
                      'assets/Sprite/pick_model/img_btn_back_main.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
