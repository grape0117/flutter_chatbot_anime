import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../common/bottomNavagation/bottomNavbar.dart';
import '../controllers/no_friends_list_controller.dart';

class NoFriendsListView extends GetView<NoFriendsListController> {
  final NoFriendsListController controller = Get.put(NoFriendsListController());
  NoFriendsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Pick your zodiac';

    return MaterialApp(
      title: title,
      home: Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/Sprite/no_friends_list/img_chat_nochat.png',
                  width: 80,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Active chats will be shown here',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    print('No Friends');
                    controller.bottomNavbarController.index(0);
                    Get.toNamed(Routes.PICKBOT);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                          'assets/Sprite/no_friends_list/img_bg_roundCorner.png'),
                    )),
                    child: Text(
                      'Go Swiping',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    "When you match with others, they'll appear here, where you can send them a message",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavbar()),
    );
  }
}
