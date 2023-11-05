import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'bottomNavbar_Controller.dart';
import '../../modules/user/controllers/user_controller.dart';

class BottomNavbar extends GetView<BottomNavbarController> {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<BottomNavbarController>(BottomNavbarController());
    // Get.put<UserController>(UserController());
    //  UserController user Controller = Get.find<UserController>();

    return Obx(() {
      return BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 202, 9, 9), fontSize: 14),
        backgroundColor: const Color(0xFF084A76),
        fixedColor: Colors.pink,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              controller.index == 0
                  ? 'assets/Sprite/taskbar/icon_tabbar_card_selected.png'
                  : 'assets/Sprite/taskbar/icon_tabbar_card_unselected.png',
              width: 24.0,
              height: 24.0,
            ),
            label: 'Model',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              controller.index == 1
                  ? 'assets/Sprite/taskbar/icon_tabbar_chat_selected.png'
                  : 'assets/Sprite/taskbar/icon_tabbar_chat_unselected.png',
              width: 24.0,
              height: 24.0,
            ),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              controller.index == 2
                  ? 'assets/Sprite/taskbar/icon_tabbar_shop_selected.png'
                  : 'assets/Sprite/taskbar/icon_tabbar_shop_unselected.png',
              width: 24.0,
              height: 24.0,
            ),
            label: 'Credit',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              controller.index == 3
                  ? 'assets/Sprite/taskbar/icon_tabbar_setting_selected.png'
                  : 'assets/Sprite/taskbar/icon_tabbar_setting_unselected.png',
              width: 24.0,
              height: 24.0,
            ),
            label: 'Info',
          ),
        ],
        currentIndex: controller.index.value,
        onTap: (int index) {
          controller.updateSelection(index);
          print(index);
        },
      );
    });
  }
}
