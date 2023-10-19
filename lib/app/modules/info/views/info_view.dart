import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../common/bottomNavagation/bottomNavbar.dart';
import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(InfoController());
    const title = 'Anime Chat';

    return MaterialApp(
      title: title,
      home: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 60, right: 40, left: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 202, 188, 202),
                        radius: 30,
                        child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 223, 166, 208),
                            radius: 25,
                            child: Image.asset(
                              controller.userController.user.avatar,
                            )),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              controller.userController.flag_edit = true;
                              print(
                                  "flag_edit equals to ${controller.userController.flag_edit}");
                              Get.toNamed(Routes.INPUT_NAME);
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'assets/Sprite/info/img_editor.png',
                                alignment: Alignment.topRight,
                              ),
                            )))
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
                              text: controller.userController.user.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  controller.userController.user.zodiac,
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.PREMIUM);
                  },
                  child: Container(
                      width: 400,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/Sprite/info/img_notsubscribe.png'),
                              fit: BoxFit.fill)),
                      child: Container()),
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
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                        Container(
                            child: GestureDetector(
                          onTap: () {
                            controller.bottomNavbarController.index(2);
                            Get.toNamed(Routes.PURCHASE);
                          },
                          child: Image.asset(
                            'assets/Sprite/info/img_addIcon.png',
                            width: 35,
                            height: 35,
                          ),
                        ))
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),

                Container(
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
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(255, 223, 220, 220),
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
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(255, 223, 220, 220),
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
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(255, 223, 220, 220),
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
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(255, 223, 220, 220),
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
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromARGB(255, 223, 220, 220),
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
                  // ),
                ),

                // follow us divider
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey,
                        )),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'follow us',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                        Expanded(
                            child: Divider(
                          color: Colors.grey,
                        )),
                      ]),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/Sprite/info/tiktok.png',
                        width: 40,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/Sprite/info/discord.png',
                        width: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavbar()),
    );
  }
}
