import 'package:chat_gpt_flutter/app/model/Profile.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/controllers/chat_text_controller.dart';
import 'package:chat_gpt_flutter/app/modules/chat_text/views/chat_text_view.dart';
import 'package:chat_gpt_flutter/app/modules/pick_bot/views/pick_bot_view.dart';
import 'package:chat_gpt_flutter/app/modules/pick_bot/views/widget/CardsStackWidget_controller.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
// import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/view_profile_controller.dart';
// import '../../chat_text/views/chat_text_view.dart';
import '../../no_model/views/no_model_view.dart';

class ViewProfileView extends GetView<ViewProfileController> {
  // final List<bool> selectedAvatars;
  const ViewProfileView({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    const title = 'View Profile';
    // Get.put<bottomNavbarController>(bottomNavbarController());
    Get.put<ViewProfileController>(ViewProfileController());

    return MaterialApp(
      // title: title,
      home: Scaffold(
        // appBar: AppBar(
        //     title: const Text(title),
        //     backgroundColor: Colors.pink,
        //     leading: IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.arrow_back_ios),
        //       //replace with our own icon data.
        //     )),
        body: Container(
          // margin:
          //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: Column(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('objectCCCCCCCCCCCCC');
                      Navigator.pop(context);
                      // Get.back();
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 40),
                      child: Image.asset(
                        'assets/Sprite/pick_model/common_btn_close.png',
                        width: 40,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    // padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              0.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(profile.avatarAsset))),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      // width: 300,
                      height: MediaQuery.of(context).size.height * 0.7,
                      // ),
                      child: Stack(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        profile.name,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontFamily:
                                                                'BalloThambi2-Regular',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        child: Image.asset(
                                                          profile.zodiacAsset,
                                                          width: 20,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            print(profile.name);
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ViewProfileView(
                                                                        profile:
                                                                            profile),
                                                              ),
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons.more_horiz,
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )),

                                              //
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: Text(
                                                  profile.description,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'BalloThambi2-Regular'),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 20,),
                  Container(
                    // alignment: ,
                    padding: EdgeInsets.only(top: 50, left: 50, right: 50),
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  print('--------sdfsdfsd-----skip');
                                  final CardsStackWidgetController
                                      cardsStackWidgetController =
                                      Get.put(CardsStackWidgetController());
                                  cardsStackWidgetController.models
                                      .removeLast();
                                  Get.to(PickBotView(
                                      profile: cardsStackWidgetController
                                          .models.last));
                                  if (cardsStackWidgetController
                                          .models.length ==
                                      0) {
                                    cardsStackWidgetController.models.add(
                                        Profile(
                                            name: '',
                                            description: '',
                                            avatarAsset: '',
                                            zodiacAsset: '',
                                            message: ''));
                                    ;
                                    Get.to(() => NoModelView());
                                    cardsStackWidgetController.models
                                        .removeLast();
                                  }
                                },
                                child: Image.asset(
                                  'assets/Sprite/pick_model/profile_btn_dislike_bg.png',
                                  width: 35,
                                  height: 35,
                                ))),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  print('--------------like');
                                  print('object');
                                  Get.put(ChatTextController());
                                  Get.to(ChatTextView(profile: profile));
                                },
                                child: Image.asset(
                                  'assets/Sprite/pick_model/profile_bgn_like_bg.png',
                                  width: 40,
                                  height: 40,
                                ))),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
