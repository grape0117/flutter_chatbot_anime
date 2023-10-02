import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/avatars_controller.dart';

class AvatarsView extends GetView<AvatarsController> {
  const AvatarsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Pick your avatar';

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),
          body: Obx(() {
            return Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controller.updateBorderStyle(Colors.blue, 2.0);
                    },
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(12, (index) {
                        return Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/Sprite/avatar_${index + 1}.png'),
                            backgroundColor: Color.fromARGB(255, 248, 219, 242),
                            radius: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: controller.borderColor.value,
                                  width: controller.borderWidth.value,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.CHAT_TEXT);
                  },
                  child: Text('Confirm'),
                ),
              ],
            );
          })),
    );
  }
}
