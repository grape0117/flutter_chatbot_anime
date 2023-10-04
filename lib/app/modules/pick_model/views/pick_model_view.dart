import 'package:flutter/material.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../controllers/pick_model_controller.dart';

class PickModelView extends GetView<PickModelController> {
  const PickModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Anime Chat';

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
        title: const Text(title),
        leading: Icon(
          Icons.card_giftcard,
          color: Colors.yellow,
          size: 24.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
      )),
    );
  }
}
