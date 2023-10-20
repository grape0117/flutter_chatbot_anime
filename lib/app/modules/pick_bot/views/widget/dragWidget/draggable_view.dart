import 'package:chat_gpt_flutter/app/modules/chat_text/controllers/chat_text_controller.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/views/chat_text_view.dart';
import 'package:chat_gpt_flutter/app/modules/pick_bot_copy/widget%20copy/CardsStackWidget_.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'draggable_controller.dart';
import '../../../../../model/Profile.dart';
import '../../../../chat_text/controllers/chat_text_controller.dart';
import '../profileCard.dart';

// class DragWidget extends

class DraggableView extends GetView<DraggableController> {
  final DraggableController draggableController =
      Get.put(DraggableController());

  DraggableView({Key? key, required this.index}) : super(key: key);
  // final Profile profile;
  final int index;
  // int length = controller.modelslength;

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
                // child: Center(
                //   child: Text('models \n'),
                // ),
              ),
            );
          },
          onAccept: (int data) {
            print('*******************    ');
            controller.cardsStackWidgetController.models.removeLast();
            print(controller.cardsStackWidgetController.models.length);
            if (controller.cardsStackWidgetController.models.length == 0) {
              Get.toNamed(Routes.NOMODEL);
              // controller.cardsStackWidgetController.models.removeLast();
            }
          },
        ),
        Expanded(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Draggable<int>(
              // Data is the value this Draggable stores.
              data: 1,
              feedback: Container(
                color: Colors.deepOrange,
                height: 100,
                width: 100,
                child: const Icon(Icons.directions_run),
              ),
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
              // child: Center(
              //   child: Text('Value is updated to: '),
              // ),
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
