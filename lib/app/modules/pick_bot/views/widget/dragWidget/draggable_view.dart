import 'package:chat_gpt_flutter/app/common/Swipe.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/controllers/chat_text_controller.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/views/chat_text_view.dart';
// import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/CardsStackWidget_controller.dart';
import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/dragWidget/draggable_controller.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../dragWidget/draggable_controller.dart';
// import '../../../../../model/Profile.dart';
// import '../../../../chat_text/controllers/chat_text_controller.dart';
import '../profileCard/profileCard.dart';
// import '../dragWidget/TagWidget.dart';

import '../../../../../common/Swipe.dart' as Swipe;

class DraggableView extends GetView<DraggableController> {
  final DraggableController draggableController =
      Get.put(DraggableController());

  DraggableView({
    Key? key,
    required this.index,
    // required this.swipeNotifier,
    // this.isLastCard = false,
  }) : super(key: key);

  final int index;
  // final ValueNotifier<Swipe.Swipe> swipeNotifier;
  // final bool isLastCard;

  @override
  Widget build(BuildContext context) {
    Get.put(DraggableController());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return IgnorePointer(
              child: Container(
                height: 400.0,
                width: 40.0,
                color: Colors.green,
              ),
            );
          },
          onAccept: (int data) {
            print('*******************    ');
            controller.cardsStackWidgetController.models.removeLast();
            print(controller.cardsStackWidgetController.models.length);
            if (controller.cardsStackWidgetController.models.length == 0) {
              Get.toNamed(Routes.NOMODEL);
            }
          },
        ),
        Expanded(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Draggable<int>(
              // Data is the value this Draggable stores.
              data: 1,
              feedback: Material(
                color: Colors.transparent,
                child: ValueListenableBuilder(
                  valueListenable: controller.swipeNotifier,
                  builder: (context, swipe, _) {
                    return RotationTransition(
                      turns: swipe != Swipe.Swipe.none
                          ? swipe == Swipe.Swipe.left
                              ?
                              // controller.animation
                              const AlwaysStoppedAnimation(-15 / 360)
                              :
                              // controller.animation
                              const AlwaysStoppedAnimation(15 / 360)
                          : const AlwaysStoppedAnimation(0),
                      child: Stack(
                        children: [
                          ProfileCard(
                              profile: controller
                                  .cardsStackWidgetController.models[index]),
                          swipe != Swipe.Swipe.none
                              ? swipe == Swipe.Swipe.right
                                  ? Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.3,
                                      right: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/Sprite/pick_model/icon_card_like_big.png'),
                                        width: 50,
                                      ))
                                  : Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.3,
                                      right: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/Sprite/pick_model/icon_card_unlike_big.png'),
                                        width: 50,
                                      ),
                                    )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
                // When Draggable widget is dragged right
                if (dragUpdateDetails.delta.dx > 0 &&
                    dragUpdateDetails.globalPosition.dx >
                        MediaQuery.of(context).size.width / 2) {
                  print('right');
                  controller.swipeNotifier.value = Swipe.Swipe.right;
                }
                // When Draggable widget is dragged left
                if (dragUpdateDetails.delta.dx < 0 &&
                    dragUpdateDetails.globalPosition.dx <
                        MediaQuery.of(context).size.width / 2) {
                  controller.swipeNotifier.value = Swipe.Swipe.left;
                  print('left');
                }
              },
              childWhenDragging: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.transparent,
                // child: const Center(
                //   child: Text('$controller.index'),
                // ),
              ),
              child: Container(
                child: ProfileCard(
                    profile:
                        controller.cardsStackWidgetController.models[index]),
              )),
        )),
        DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: 400.0,
              width: 40.0,
              color: Colors.green,
            );
          },
          onAccept: (int data) {
            print(' object }');
            Get.put(ChatTextController());
            Get.to(() => ChatTextView(
                profile: controller.cardsStackWidgetController.models[index]));
          },
        ),
      ],
    );
  }
}
