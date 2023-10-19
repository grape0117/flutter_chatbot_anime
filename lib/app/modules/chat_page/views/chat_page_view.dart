import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:chat_gpt_flutter/app/model/Profile.dart';

import '../controllers/chat_page_controller.dart';
import '../views/widget/matechat.dart';
import '../views/widget/mychat.dart';
import '../views/widget/defaultmessage.dart';

class ChatPageView extends GetView<ChatPageController> {
  // final List<bool> selectedAvatars;
  const ChatPageView({Key? key, required this.profile}) : super(key: key);

  final Profile profile;
  // String username = '';

  @override
  Widget build(BuildContext context) {
    Get.put<ChatPageController>(ChatPageController());
    const title = 'ChatPage';

    return MaterialApp(
      // title: title,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(profile.avatarAsset), fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  // back
                  Positioned(
                      top: 50,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          print('back');
                        },
                        child: Image.asset(
                          'assets/Sprite/chat_page/common_btn_back_alpha.png',
                          width: 50,
                        ),
                      )),

                  // clear history
                  Positioned(
                    top: 50,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        print('Erase history');
                      },
                      child: Image.asset(
                        'assets/Sprite/chat_page/aichat_history_reset.png',
                        width: 50,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 100,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        print('Erase history');
                      },
                      child: Image.asset(
                        'assets/Sprite/chat_page/aichat_profile_button.png',
                        width: 50,
                      ),
                    ),
                  ),

                  // messages
                  // Positioned(
                  //   top: 0,
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     child: MateChat(profile: profile),
                  //     // child: Column(children: [
                  //     //   MyChat(profile: profile),
                  //     //   // MateChat(profile: profile),
                  //     //   // DefaultMessage(profile: profile),
                  //     // ]),
                  //   ),
                  // ),

                  // user input
                  Positioned(
                    bottom: 30,
                    left: 10,
                    right: 10,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/Sprite/chat_page/aichat_userinput_bg.png'),
                              fit: BoxFit.fill)),
                      child: TextField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter by yourself...',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 35,
                      right: 50,
                      child: GestureDetector(
                        onTap: () {
                          String message =
                              controller.textEditingController.text;
                          print('send message-----------   $message');
                        },
                        child: Image.asset(
                          'assets/Sprite/chat_page/aichat_userinput_sendBtn.png',
                          width: 40,
                        ),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
