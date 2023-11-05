import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../../../model/user_info.dart';

class AvatarsView extends GetView<UserController> {
  // final List<bool> selectedAvatars;
  // final UseController draggableController =
  //     Get.put(DraggableController());
  const AvatarsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Pick your avatar';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(title),
            backgroundColor: Colors.pink,
            leading: IconButton(
              onPressed: () {
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
                    onTap: () async {
                      // await controller.clearLocalStorage();
                      controller.updateSelection(index);
                      controller.disableAvatarButton.value = false;
                      // print('user avatar is ${controller.user.avatar}');
                      controller.storeData('user_avatar', avatar[index]);
                      controller.assignUserInfo();
                      // controller.user.avatar = avatar[index];
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
                                      'assets/Sprite/avatar/avatar_${index + 1}.png'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  width: 5.0,
                                  color: controller.isSelectedList[index]
                                      ? Colors.pink
                                      : Color.fromARGB(255, 233, 231, 231),
                                ),
                              ),
                            ),
                            if (controller.isSelectedList[index])
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Icon(
                                  Icons.verified,
                                  color: Colors.pink,
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
              width: 150,
              height: 0,
            ),
            Container(
                height: 60,
                padding: EdgeInsets.only(bottom: 10),
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.disableAvatarButton.value == true
                        ? null
                        : () async {
                            print('Avatar ConfirmButton is clicked!');
                            print(
                                'Selected Avatar is ${controller.user.avatar}');
                            Get.offNamed(Routes.ZODIAC);
                          },
                    child: Text('Confirm'),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(300, 30)),
                        backgroundColor: controller.disableAvatarButton == true
                            ? MaterialStateProperty.all<Color>(Colors.grey)
                            : MaterialStateProperty.all<Color>(Colors.pink)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
