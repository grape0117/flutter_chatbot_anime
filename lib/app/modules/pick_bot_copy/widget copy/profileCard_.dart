import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Profile.dart';
import '../../view_profile/views/view_profile_view.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              image: DecorationImage(image: AssetImage(profile.avatarAsset))),
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
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/Sprite/pick_model/icon_card_isAI.png',
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                                  fontWeight: FontWeight.bold),
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
                                                              profile: profile),
                                                    ),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.more_horiz,
                                                  size: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        profile.message,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: 'BalloThambi2-Regular'),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 50,
                            ),
                            // three icons
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // hand and arrow
                // GestureDetector(
                //   onPanUpdate: (details) {
                //     if (details.delta.dx > 0)
                //       print("Dragging in +X direction");
                //     else
                //       print("Dragging in -X direction");
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: Color.fromARGB(99, 21, 24, 22),
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     // margin: EdgeInsets.all(20),
                //     // padding: EdgeInsets.all(40),
                //     child: Column(
                //       children: [
                //         Stack(
                //           children: [
                //             Container(
                //               height: MediaQuery.of(context).size.height * 0.45,
                //               alignment: Alignment.topCenter,
                //               child: Image.asset(
                //                   'assets/Sprite/pick_model/img_card_line_down.png'),
                //             ),
                //             Container(
                //               margin: EdgeInsets.only(
                //                   top: MediaQuery.of(context).size.height *
                //                       0.45),
                //               child: Image.asset(
                //                   'assets/Sprite/pick_model/img_card_line_level.png'),
                //             ),
                //             Container(
                //                 child: Column(
                //               children: [
                //                 Row(
                //                   children: [
                //                     Container(
                //                         padding: EdgeInsets.only(
                //                             top: MediaQuery.of(context)
                //                                     .size
                //                                     .height *
                //                                 0.22,
                //                             left: MediaQuery.of(context)
                //                                     .size
                //                                     .width *
                //                                 0.2),
                //                         child: Column(
                //                           children: [
                //                             Image.asset(
                //                               'assets/Sprite/pick_model/icon_card_arrow_left.png',
                //                               width: 25,
                //                             ),
                //                             SizedBox(
                //                               height: MediaQuery.of(context)
                //                                       .size
                //                                       .height *
                //                                   0.03,
                //                             ),
                //                             Image.asset(
                //                               'assets/Sprite/pick_model/img_card_hand.png',
                //                               width: 30,
                //                             ),
                //                             SizedBox(
                //                               height: 15,
                //                             ),
                //                             Text(
                //                               'Skip',
                //                               style: TextStyle(
                //                                   color: Colors.white,
                //                                   fontSize: 25,
                //                                   fontWeight: FontWeight.bold),
                //                             )
                //                           ],
                //                         )),
                //                     Container(
                //                       padding: EdgeInsets.only(
                //                           top: MediaQuery.of(context)
                //                                   .size
                //                                   .height *
                //                               0.22,
                //                           left: MediaQuery.of(context)
                //                                   .size
                //                                   .width *
                //                               0.15),
                //                       child: Column(
                //                         children: [
                //                           Image.asset(
                //                             'assets/Sprite/pick_model/icon_card_arrow_right.png',
                //                             width: 25,
                //                           ),
                //                           SizedBox(
                //                             height: MediaQuery.of(context)
                //                                     .size
                //                                     .height *
                //                                 0.03,
                //                           ),
                //                           Image.asset(
                //                             'assets/Sprite/pick_model/img_card_hand.png',
                //                             width: 30,
                //                           ),
                //                           SizedBox(
                //                             height: 15,
                //                           ),
                //                           Text(
                //                             'Like',
                //                             style: TextStyle(
                //                                 color: Colors.white,
                //                                 fontSize: 25,
                //                                 fontWeight: FontWeight.bold),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 Container(
                //                   padding: EdgeInsets.only(
                //                       top: MediaQuery.of(context).size.height *
                //                           0.08,
                //                       left: MediaQuery.of(context).size.width *
                //                           0.3),
                //                   child: Row(
                //                     children: [
                //                       Text(
                //                         ' Open \nProfile',
                //                         style: TextStyle(
                //                             color: Colors.white,
                //                             fontSize: 25,
                //                             fontWeight: FontWeight.bold),
                //                       ),
                //                       SizedBox(
                //                         width: 20,
                //                       ),
                //                       Transform.rotate(
                //                         angle: 90 *
                //                             3.1415926535 /
                //                             180, // Replace with the desired rotation angle in degrees
                //                         child: Image.asset(
                //                           'assets/Sprite/pick_model/img_card_hand.png',
                //                           width: 30,
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ))
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        )
      ],
    );
  }
}
