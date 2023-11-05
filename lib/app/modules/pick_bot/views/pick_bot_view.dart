import 'package:chat_gpt_flutter/app/model/Profile.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../common/bottomNavagation/bottomNavbar.dart';
import '../controllers/pick_bot_controller.dart';

import 'widget/CardsStackWidget.dart';

class PickBotView extends GetView<PickBotController> {
  // final List<bool> selectedAvatars;
  const PickBotView({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    Get.put(PickBotController());
    const title = 'Anime Chat1111';

    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        title: title,
        home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),

                  // left corner credit
                  Container(
                    width: double.infinity,
                    child: Stack(children: [
                      GestureDetector(
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/Sprite/purchase/img_limitOffer_shop.png',
                                  height: 300,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  top: 0,
                                  child: Badge(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    backgroundColor: const Color.fromARGB(
                                        255, 180, 115, 255),
                                    alignment: AlignmentDirectional.topCenter,
                                    largeSize: 20,
                                    textStyle: TextStyle(fontSize: 14),
                                    textColor: Colors.white,
                                    label: Text(
                                      'Limited Offer',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'BalloThambi2-Regular'),
                                    ),
                                    isLabelVisible: true,
                                  ),
                                ),
                                Positioned(
                                    top: 20,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Special Starter Offer',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  'BalloThambi2-Regular'),
                                        ),
                                        Text(
                                          'Special bundle to get your started!',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  'BalloThambi2-Regular'),
                                        ),
                                      ],
                                    )),
                                Positioned(
                                  top: 170,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: 170,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                        'assets/Sprite/pick_model/bg_priceAndValue.png',
                                      ),
                                    )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/Sprite/purchase/icon_singleGem_purple.png',
                                              width: 30,
                                            ),
                                            Text(
                                              ' 200',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '100',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '\$9.99',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                height: 40,
                                margin: EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/Sprite/pick_model/bg_gotitButton.png'))),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Get',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/Sprite/img_btn_gift_main.png',
                            width: 50,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: Center(
                          child: Text(
                            'Anime Chat',
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CardsStackWidget(),
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavbar()),
      ),
    );
  }
}
