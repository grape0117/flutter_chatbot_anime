import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../../../model/user_info.dart';

class ZodiacView extends GetView<UserController> {
// final List<bool> selectedAvatars;
  const ZodiacView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Pick your zodiac';

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
              title: const Text(title),
              backgroundColor: Colors.pink,
              leading: IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Get.toNamed(Routes.Avatars);
                },
                icon: Icon(Icons.arrow_back_ios),
                //replace with our own icon data.
              )),
          body: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns
                    ),
                    itemCount: 12, // Total number of grid items
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          controller.updateZodiacSelection(index);
                          controller.disableZodiacButton.value = false;
                          controller.storeData('user_zodiac', zodiac[index]);
                          controller.assignUserInfo();
                        },
                        child: Obx(() {
                          return ClipRect(
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(30),
                                  padding: EdgeInsets.all(10),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Sprite/zodiac/img_constellation_${zodiacs[index]}.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 185, 184, 184)
                                            .withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0,
                                            3), // changes the position of the shadow
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                      padding: EdgeInsets.all(8),
                                      // color: Colors.black.withOpacity(0.5),
                                      child: Align(
                                        child: Text(
                                          zodiacs[index],
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 51, 51, 51),
                                            fontSize: 16,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )),
                                ),
                                if (controller.zodiacSelectedList[index])
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(),
                                        Icon(
                                          Icons.verified,
                                          color: Colors.pink,
                                        ),
                                      ],
                                    ),
                                  ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 0,
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: controller.disableZodiacButton.value == true
                          ? null
                          : () async {
                              if (controller.edit_flag == false) {
                                Get.offNamed(Routes.PICKBOT);
                              } else {
                                Get.offNamed(Routes.INFO);
                                controller.edit_flag = true;
                              }
                            },
                      child: Text('Confirm'),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(300, 30)),
                          backgroundColor: controller
                                      .disableZodiacButton.value ==
                                  true
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(Colors.pink)),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
