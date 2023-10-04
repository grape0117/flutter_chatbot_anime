import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/avatars_controller.dart';

class AvatarsView extends GetView<AvatarsController> {
  // final List<bool> selectedAvatars;
  const AvatarsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Pick your avatar';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(title),
            leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
                Get.toNamed(Routes.INPUT_NAME);
              },
              icon: Icon(Icons.arrow_back_ios),
              //replace with our own icon data.
            )),
        body: Column(
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
                      return CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 253, 253, 253),
                        child: Stack(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/Sprite/avatar_${index + 1}.png'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  width: 5.0,
                                  color: controller.isSelectedList[index]
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                              ),
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
                      title: const Text('Notification!'),
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
                  Get.toNamed(Routes.ZODIAC);
                }
              },
              child: Text('Confirm'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(300, 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
