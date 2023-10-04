import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/zodiac_controller.dart';

List<String> zodiacs = [
  'Aquarius',
  'Aries',
  'Cancer',
  'Capricorn',
  'Gemini',
  'Leo',
  'Libra',
  'Pisces',
  'Sagittarius',
  'Scorpio',
  'Taurus',
  'Virgo'
];

class ZodiacView extends GetView<ZodiacController> {
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
                        onTap: () {
                          controller.updateSelection(index);
                        },
                        child: Obx(() {
                          return ClipRect(
                            // backgroundColor: Color.fromARGB(255, 253, 253, 253),
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
                                          'assets/Sprite/img_constellation_${zodiacs[index]}.png'),
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
                                if (controller.isSelectedList[index])
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 3,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                  height: 8,
                                ),
                                if (controller.isSelectedList[index])
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                    ),
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
                ElevatedButton(
                  onPressed: () {
                    // Add your button's onPressed logic here
                    print(controller.flag_avatar);
                    if (!controller.flag_avatar) {
                      print("here is false!");
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(''),
                          content: const Text('Please pick your avatar!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      Get.toNamed(Routes.CHAT_TEXT);
                    }
                  },
                  child: Text('Confirm'),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(300, 30)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
