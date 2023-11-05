import 'package:chat_gpt_flutter/app/model/Profile.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/views/widgets/text_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../common/headers.dart';
import '../../../common/search_text_field_widget.dart';
import '../controllers/chat_text_controller.dart';
import '../../../model/Profile.dart';

class ChatTextView extends GetView<ChatTextController> {
  const ChatTextView({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(profile.avatarAsset), fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                // chat
                Positioned(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: false,
                          itemCount: controller.messages.length > 2 ? 2 : 1,
                          itemBuilder: (context, index) {
                            int? itemIndex = 0;
                            if (controller.messages.length == 2) {
                              itemIndex =
                                  controller.messages.length - 1 + index;
                            } else {
                              itemIndex =
                                  controller.messages.length - 2 + index;
                            }
                            final textData = controller.messages[itemIndex];
                            return textData.index == -999999
                                ? MyTextCard(
                                    textData: textData,
                                    profile: profile,
                                  )
                                : TextCard(
                                    textData: textData,
                                    profile: profile,
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
                          textEditingController:
                              controller.searchTextController,
                          onTap: () {
                            controller.getTextCompletion(
                                controller.searchTextController.text);
                          }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                // back

                Positioned(
                  top: 50,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      print('back');
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/Sprite/chat_page/common_btn_back_alpha.png',
                      width: 50,
                    ),
                  ),
                ),

                // clear history
                Positioned(
                  top: 50,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      print('Erase history ${controller.messages.length}');
                      controller.messages.clear();
                      controller.initializationMessage();
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
                      print('Switch model');
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Set the desired borderRadius here
                          ),
                          content: Container(
                            width: 360,
                            height: 200,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Switch Your AI Model',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'BalloThambi2-Regular',
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: ToggleSwitch(
                                    minWidth: 130.0,
                                    initialLabelIndex: 0,
                                    cornerRadius: 5.0,
                                    activeFgColor: Colors.white,
                                    inactiveBgColor: Colors.grey,
                                    inactiveFgColor: Colors.white,
                                    totalSwitches: 2,
                                    customTextStyles: [
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'BalloThambi2-Regular',
                                      ),
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'BalloThambi2-Regular',
                                      )
                                    ],
                                    labels: ['Pro Model', 'Lite Model'],
                                    activeBgColors: [
                                      [Color.fromARGB(255, 194, 69, 216)],
                                      [Color.fromARGB(255, 194, 69, 216)]
                                    ],
                                    onToggle: (index) {
                                      print('switched to: $index');
                                      controller.changeFlag(index == 0);
                                    },
                                  ),
                                ),
                                Obx(() {
                                  return controller.toggle_flag.value
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '\u00B7 Exclusive to everyone',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'BalloThambi2-Regular',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '\u00B7 Balanced cost standard:',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'BalloThambi2-Regular',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Row(children: [
                                                  Text('  1 message per gem',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'BalloThambi2-Regular',
                                                      )),
                                                  Image.asset(
                                                    'assets/Sprite/pick_model/icon_singleGem_purple.png',
                                                    width: 30,
                                                  )
                                                ]),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '\u00B7 Simulated Permenent Memory',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'BalloThambi2-Regular',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ) // Widget to display when flag is true
                                      : Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '\u00B7 Exclusive to subscribers',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'BalloThambi2-Regular',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '\u00B7 Low cost standard:',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'BalloThambi2-Regular',
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Row(children: [
                                                  Text('  5 messages per gem',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'BalloThambi2-Regular',
                                                      )),
                                                  Image.asset(
                                                    'assets/Sprite/pick_model/icon_singleGem_purple.png',
                                                    width: 30,
                                                  )
                                                ]),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  '\u00B7 Keep only 5 minutes of memory',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'BalloThambi2-Regular',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ); // Widget to display when flag is false
                                }),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Sprite/pick_model/bg_gotitButton.png'))),
                              child: TextButton(
                                onPressed: () {
                                  print('okay button is pressed');
                                  Get.back();
                                },
                                child: const Text(
                                  'Okay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'BalloThambi2-Regular',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/Sprite/chat_page/aichat_profile_button.png',
                      width: 50,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
