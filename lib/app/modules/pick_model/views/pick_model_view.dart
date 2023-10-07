import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/pick_model_controller.dart';

class PickModelView extends GetView<PickModelController> {
  const PickModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Anime Chat';

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            title: const Text(
              title,
              // style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            leading: Image.asset(
              'assets/Sprite/img_btn_gift_main.png',
              width: 24.0,
              height: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    controller.index == 0
                        ? 'assets/Sprite/taskbar/icon_tabbar_card_selected.png'
                        : 'assets/Sprite/taskbar/icon_tabbar_card_unselected.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: 'Card',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    controller.index == 1
                        ? 'assets/Sprite/taskbar/icon_tabbar_chat_selected.png'
                        : 'assets/Sprite/taskbar/icon_tabbar_chat_unselected.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: 'Card',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    controller.index == 2
                        ? 'assets/Sprite/taskbar/icon_tabbar_setting_selected.png'
                        : 'assets/Sprite/taskbar/icon_tabbar_setting_unselected.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    controller.index == 3
                        ? 'assets/Sprite/taskbar/icon_tabbar_shop_selected.png'
                        : 'assets/Sprite/taskbar/icon_tabbar_shop_unselected.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  label: 'Card',
                ),
              ],
              currentIndex: controller.index.value,
              onTap: (int index) {
                controller.updateSelection(index);
                print(index);
              },
            );
          })),
    );
  }
}
