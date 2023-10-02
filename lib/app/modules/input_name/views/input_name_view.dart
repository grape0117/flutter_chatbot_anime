import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/input_name_controller.dart';

class InputNameView extends GetView<InputNameController> {
  // final List<bool> selectedAvatars;
  const InputNameView({Key? key}) : super(key: key);
  // String username = '';

  @override
  Widget build(BuildContext context) {
    const title = 'Pick your zodiac';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(width: 300, height: 100),
            const Text(
              "Type your name",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontFamily: AppPages.INITIAL,
              ),
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
                      borderSide:
                          BorderSide(color: Color.fromARGB(0, 14, 14, 253))),
                  hintText: 'Tap to enter a name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String username = controller.textEditingController.text;
                print(username.length);
                if (username.length == 0) {
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
                  // Add any function.
                  Get.toNamed(Routes.Avatars);
                }
              },
              child: const Text('Confirm'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(300, 50)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
