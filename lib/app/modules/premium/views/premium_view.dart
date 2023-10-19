import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/premium_controller.dart';

class PremiumView extends GetView<PremiumController> {
  // final List<bool> selectedAvatars;
  const PremiumView({Key? key}) : super(key: key);
  // String username = '';

  @override
  Widget build(BuildContext context) {
    const title = 'Pick your zodiac';

    return MaterialApp(
      title: title,
      home: Scaffold(
          // appBar: AppBar(
          //     title: const Text(title),
          //     leading: IconButton(
          //       onPressed: () {
          //         // Navigator.pop(context);
          //         // Get.toNamed(Routes.Avatars);
          //       },
          //       icon: Icon(Icons.arrow_back_ios),
          //       //replace with our own icon data.
          //     )),
          body: Container(
              padding: EdgeInsets.only(top: 280),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/Sprite/premium/bg_primium_large.png'),
                    fit: BoxFit.fill),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Anime AI',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/Sprite/premium/img_primium_text.png',
                      width: 170,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Sprite/premium/icon_right.png',
                            width: 15,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Obtain 3650 Gems at once',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Sprite/premium/icon_right.png',
                            width: 15,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Get 3650 Gems by daily reward',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Sprite/premium/icon_right.png',
                            width: 15,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('More closer with your waifu',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/Sprite/premium/icon_right.png',
                            width: 15,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Add-free experience',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text('\$89.99 / Year',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 243, 191, 122),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          Text('Billed yearly, auto-renewable, Cancel anytime',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 170,
                      child: Row(
                        children: [
                          Text('Enable discount',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          // Image.asset()
                        ],
                      ),
                    ),
                    Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/Sprite/premium/bg_continue.png'),
                                fit: BoxFit.fill)),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    Container(
                        width: 350,
                        child: GestureDetector(
                          onTap: () {
                            // print('object');
                            Get.back();
                          },
                          child: Center(
                            child: Text(
                              'NO THANKS',
                              style: TextStyle(
                                color: Color.fromARGB(179, 255, 255, 255),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 300,
                        child: Center(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Center(
                                child: Text(
                                  'Terms',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 100, 99, 99)),
                                ),
                              )),
                              Expanded(
                                  child: Center(
                                child: Text(
                                  'Restore',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 100, 99, 99)),
                                ),
                              )),
                              Expanded(
                                  child: Center(
                                child: Text(
                                  'Privacy',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 100, 99, 99)),
                                ),
                              )),
                            ],
                          ),
                        ))
                  ],
                ),
              ))),
    );
  }
}
