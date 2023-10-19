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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink)),
                  hintText: 'Tap to enter a name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.user.name = controller.textEditingController.text;
                print('DFDFDFDF ${controller.user.name}');
                print(controller.user.name);
                if (controller.user.name.length == 0) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Notification!'),
                      content: const Text('Please type your name!'),
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
                  Get.toNamed(Routes.Avatars);
                }
              },
              child: const Text('Confirm'),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(300, 50)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink)),
            ),
          ]),
        ),
      ),
    );
  }
}