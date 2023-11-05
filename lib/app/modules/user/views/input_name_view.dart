import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class InputNameView extends GetView<UserController> {
  // final List<bool> selectedAvatars;
  const InputNameView({Key? key}) : super(key: key);
  // String username = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(children: [
            SizedBox(width: 300, height: 100),
            const Text(
              "Type your name",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppPages.INITIAL,
                  color: Colors.pink),
            ),
            SizedBox(width: 300, height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 100,
              width: 300,
              child: TextField(
                controller: controller.textEditingController,
                onChanged: (value) {
                  if (value == '') {
                    controller.disableNameButton.value = true;
                  } else {
                    controller.disableNameButton.value = false;
                    print('changed value is ${controller.disableNameButton}');
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  hintText: 'Tap to enter a name',
                ),
              ),
            ),
            Obx(
              () => ElevatedButton(
                onPressed: controller.disableNameButton == true
                    ? null
                    : () async {
                        // await controller.clearLocalStorage();
                        controller.storeData(
                            'user_name', controller.textEditingController.text);
                        await controller.assignUserInfo();
                        print('Input Name: ${controller.user.name}');
                        Get.offNamed(Routes.Avatars);
                      },
                child: const Text('Confirm'),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(300, 50)),
                    backgroundColor: controller.disableNameButton.value == true
                        ? MaterialStateProperty.all<Color>(Colors.grey)
                        : MaterialStateProperty.all<Color>(Colors.pink)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
