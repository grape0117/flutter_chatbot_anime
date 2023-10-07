import 'package:flutter/material.dart';

import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/purchase_controller.dart';

class PurchaseView extends GetView<PurchaseController> {
  const PurchaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Anime Chat';

    return MaterialApp(
      title: title,
      home: Scaffold(
          // appBar: AppBar(
          //     // backgroundColor: Colors.white,
          //     ),
          // Obx(() {

          // }),

          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                      height: 80,
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(child: Container()),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/Sprite/purchase/chat_diamond@1x.png'),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ],
                      )),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          // height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                              'assets/Sprite/purchase/bg_premium.png'),
                        ),
                        //

                        // Offers
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/Sprite/purchase/shop_image_offerTitle.png'))),
                        ),

                        // Post
                        Container(
                            child: Stack(
                          children: [
                            Container(
                                height: 150,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/Sprite/purchase/img_shopbundle_bg.png"),
                                      fit: BoxFit.cover),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Image.asset(
                                                'assets/Sprite/purchase/img_shopbundle_tag.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 50),
                                        child: Column(
                                          children: [
                                            Text(
                                              'SPECIAL OFFER',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 200, 88, 223)),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            FractionallySizedBox(
                                              widthFactor: 0.7,
                                              // heightFactor: 0.5,
                                              child: Container(
                                                height: 70,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                          color: Colors.white),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/Sprite/purchase/icon_singleGem_purple.png',
                                                            width: 25,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            '200',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            '100',
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                        height: 40,
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          10.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          10.0),
                                                                ),
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: Alignment
                                                                      .centerLeft,
                                                                  end: Alignment
                                                                      .centerRight,
                                                                  colors: [
                                                                    Color.fromARGB(
                                                                        255,
                                                                        222,
                                                                        115,
                                                                        243),
                                                                    Color.fromARGB(
                                                                        255,
                                                                        201,
                                                                        42,
                                                                        233),
                                                                  ],
                                                                )),
                                                        child: Center(
                                                          child: Text(
                                                            '\$9.99',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            Positioned(
                              left:
                                  140, // Set the desired left position of the badge
                              top:
                                  0, // Set the desired top position of the badge
                              child: Badge(
                                // Your badge widget here

                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                                backgroundColor:
                                    Color.fromARGB(255, 201, 42, 233),
                                alignment: AlignmentDirectional.topCenter,
                                largeSize: 24,
                                textStyle: TextStyle(fontSize: 14),
                                textColor: Colors.white,
                                label: Container(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          'assets/Sprite/purchase/icon_chat_Stopwatch.png'),
                                      Text(" 23:59:59")
                                    ],
                                  ),
                                ),
                                isLabelVisible: true,
                              ),
                            ),
                          ],
                        )),

                        //  Gems divider
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/Sprite/purchase/shop_image_gemsTItle.png'))),
                        ),
                      ],
                    ),
                  ),

                  //  credits options
                  Container(
                      decoration: BoxDecoration(color: Colors.white),
                      height: 480,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                          child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            padding: EdgeInsets.only(top: 120),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFffffff),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Sprite/purchase/img_gems_gemSlot_shop_04.png')),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius:
                                                      5.0, // soften the shadow
                                                  spreadRadius:
                                                      0.0, //extend the shadow
                                                  offset: Offset(
                                                    0.0, // Move to right 5  horizontally
                                                    0.0, // Move to bottom 5 Vertically
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/Sprite/purchase/icon_singleGem_purple.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Text(
                                                  '50',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 180),
                                                width: 90,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 222, 115, 243),
                                                        Color.fromARGB(
                                                            255, 201, 42, 233),
                                                      ],
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    '\$4.99',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            padding: EdgeInsets.only(top: 120),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFffffff),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Sprite/purchase/img_gems_gemSlot_shop_04.png')),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius:
                                                      5.0, // soften the shadow
                                                  spreadRadius:
                                                      0.0, //extend the shadow
                                                  offset: Offset(
                                                    0.0, // Move to right 5  horizontally
                                                    0.0, // Move to bottom 5 Vertically
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/Sprite/purchase/icon_singleGem_purple.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 180),
                                                width: 90,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 222, 115, 243),
                                                        Color.fromARGB(
                                                            255, 201, 42, 233),
                                                      ],
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    '\$9.99',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            padding: EdgeInsets.only(top: 120),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFffffff),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Sprite/purchase/img_gems_gemSlot_shop_04.png')),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius:
                                                      5.0, // soften the shadow
                                                  spreadRadius:
                                                      0.0, //extend the shadow
                                                  offset: Offset(
                                                    0.0, // Move to right 5  horizontally
                                                    0.0, // Move to bottom 5 Vertically
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/Sprite/purchase/icon_singleGem_purple.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Text(
                                                  '210',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 180),
                                                width: 90,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 222, 115, 243),
                                                        Color.fromARGB(
                                                            255, 201, 42, 233),
                                                      ],
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    '\$19.99',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      )),
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 110),
                                child: Image.asset(
                                  'assets/Sprite/purchase/img_shop_slot_label.png',
                                  width: 50,
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                          child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 5,
                                            ),
                                            padding: EdgeInsets.only(top: 120),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFffffff),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Sprite/purchase/img_gems_gemSlot_shop_04.png')),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius:
                                                      5.0, // soften the shadow
                                                  spreadRadius:
                                                      0.0, //extend the shadow
                                                  offset: Offset(
                                                    0.0, // Move to right 5  horizontally
                                                    0.0, // Move to bottom 5 Vertically
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/Sprite/purchase/icon_singleGem_purple.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Text(
                                                  '50',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 180),
                                                width: 90,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 222, 115, 243),
                                                        Color.fromARGB(
                                                            255, 201, 42, 233),
                                                      ],
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    '\$4.99',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            padding: EdgeInsets.only(top: 120),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFffffff),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Sprite/purchase/img_gems_gemSlot_shop_04.png')),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius:
                                                      5.0, // soften the shadow
                                                  spreadRadius:
                                                      0.0, //extend the shadow
                                                  offset: Offset(
                                                    0.0, // Move to right 5  horizontally
                                                    0.0, // Move to bottom 5 Vertically
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/Sprite/purchase/icon_singleGem_purple.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 180),
                                                width: 90,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 222, 115, 243),
                                                        Color.fromARGB(
                                                            255, 201, 42, 233),
                                                      ],
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    '\$9.99',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Stack(
                                        children: [
                                          Container(
                                            height: 200,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            padding: EdgeInsets.only(top: 120),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFffffff),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Sprite/purchase/img_gems_gemSlot_shop_04.png')),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius:
                                                      5.0, // soften the shadow
                                                  spreadRadius:
                                                      0.0, //extend the shadow
                                                  offset: Offset(
                                                    0.0, // Move to right 5  horizontally
                                                    0.0, // Move to bottom 5 Vertically
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/Sprite/purchase/icon_singleGem_purple.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                                Text(
                                                  '210',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 180),
                                                width: 90,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Color.fromARGB(
                                                            255, 222, 115, 243),
                                                        Color.fromARGB(
                                                            255, 201, 42, 233),
                                                      ],
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    '\$19.99',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      )),
                                    ]),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 110),
                                child: Image.asset(
                                  'assets/Sprite/purchase/img_shop_slot_label.png',
                                  width: 50,
                                ),
                              )
                            ],
                          ),
                        ],
                      )),

                  // free Gems
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/Sprite/purchase/shop_image_freeGemsTitle.png'))),
                  ),

                  // Reward Ads
                  Container(
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/Sprite/purchase/img_bg_shopSlot_blue.png'),
                            fit: BoxFit.fill)),
                    child: GestureDetector(
                      onTap: () {
                        print('object');
                      },
                      child: Container(
                        // width: 50,
                        margin: EdgeInsets.only(left: 15, right: 220, top: 70),
                        padding: EdgeInsets.only(
                            top: 22, bottom: 22, left: 35, right: 10),
                        height: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/Sprite/purchase/shop_btn_bg_rewardAds.png'))),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Get 3',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Image.asset(
                                      'assets/Sprite/purchase/icon_singleGem_purple.png',
                                      width: 20,
                                    )
                                  ],
                                ),
                                Text(
                                  ' Watch AD',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                        // child: Stack(
                        //   children: [
                        //     Image.asset(
                        //         'assets/Sprite/purchase/shop_btn_bg_rewardAds.png'),
                        //   ],
                        // ),
                      ),
                    ),
                  )
                ],
              ),
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
