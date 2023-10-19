import 'package:chat_gpt_flutter/app/model/Profile.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/views/widgets/text_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/headers.dart';
import '../../../common/search_text_field_widget.dart';
import '../controllers/chat_text_controller.dart';

class ChatTextView extends GetView<ChatTextController> {
  const ChatTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Column(children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final textData = controller.messages[index];
                  return textData.index == -999999
                      ? MyTextCard(
                          textData: textData,
                          profile: Profile(
                              name: 'name',
                              description: 'description',
                              avatarAsset:
                                  'assets/Sprite/zodiac/img_constellation_Aquarius.png',
                              zodiacAsset: 'zodiacAsset',
                              message: 'message'),
                        )
                      : TextCard(
                          textData: textData,
                          profile: Profile(
                              name: 'name',
                              description: 'description',
                              avatarAsset:
                                  'assets/Sprite/zodiac/img_constellation_Aquarius.png',
                              zodiacAsset: 'zodiacAsset',
                              message: 'message'),
                        );
                },
              ),
            ),
            controller.state.value == ApiState.loading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox(),
            const SizedBox(height: 12),
            SearchTextFieldWidget(
                color: Colors.green.withOpacity(0.8),
                textEditingController: controller.searchTextController,
                onTap: () {
                  controller
                      .getTextCompletion(controller.searchTextController.text);
                }),
            const SizedBox(height: 20),
          ])),
    );
  }
}
