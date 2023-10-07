import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Anime Chat';

    return MaterialApp(
      title: title,
      home: Scaffold(
          body:
              // Obx(() {
              Container(
            margin: EdgeInsets.only(top: 30, right: 10, left: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 55,
                      child: CircleAvatar(
                        backgroundColor: Colors.pink[100],
                        backgroundImage:
                            AssetImage('assets/Sprite/avatar_1.png'),
                        radius: 50,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          // Add your onTap logic here
                          print("hello");
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            'assets/Sprite/info/img_editor.png',
                            alignment: Alignment.topRight,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Fanfanfan',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child: Image.asset(
                                  'assets/Sprite/avatar_1.png',
                                  width: 20.0,
                                  height: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // premium
                Container(
                  width: 400,
                  height: 40,
                  child: FilledButton.tonal(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 210, 215, 219)),
                    ),
                    child: const Text(
                      'Premium Status: Free',
                      style: TextStyle(
                          color: Color.fromARGB(255, 228, 138, 168),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // credit
                Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 223, 220, 220),
                            width: 1.0)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Sprite/info/img_gem.png',
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '2',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        )),
                        Container(
                          child: Image.asset(
                            'assets/Sprite/info/img_addIcon.png',
                            width: 35,
                            height: 35,
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    width: 400,
                    // height: 360,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 223, 220, 220),
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 223, 220, 220),
                                        width: 1.0))),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Sprite/info/img_nativeshare.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Tell Friends',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                                Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromARGB(255, 197, 195, 195),
                                  ),
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 223, 220, 220),
                                        width: 1.0))),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Sprite/info/img_encourage.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Encourage Us',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                                Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromARGB(255, 197, 195, 195),
                                  ),
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 223, 220, 220),
                                        width: 1.0))),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Sprite/info/img_contact.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Contact Us',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                                Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromARGB(255, 197, 195, 195),
                                  ),
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 223, 220, 220),
                                        width: 1.0))),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Sprite/info/img_PrivacPolicy.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Privac Policy',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                                Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromARGB(255, 197, 195, 195),
                                  ),
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromARGB(255, 223, 220, 220),
                                        width: 1.0))),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/Sprite/info/img_termsofuse.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Terms of Use',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                                Container(
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromARGB(255, 197, 195, 195),
                                  ),
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // }),
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
